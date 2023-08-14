<template>
  <div class="container">
    <!--  don't loading  -->
    <template v-if="!loading">
      <div class="row mt-5" v-if="resume">
        <div class="col-lg-6 col-12 p-3 border">
          <h3>Форма</h3>
          <resume-form
            :resume-props="resume"
            :status-options="statusOptions"
            :education-options="educationOptions"
            @apply="apply"
          />
          <template v-if="errors.length">
            <h3>Вы не заполнили поля (или заполнили неверно):</h3>
            <ul>
              <li v-for="(error, key) in errors" :key="key">{{ error }}</li>
            </ul>
          </template>
        </div>
        <div class="col-lg-6 col-12 p-3 border">
          <h3>Шаблон</h3>
          <resume-template
            :resume="resume"
            :status-options="statusOptions"
            :education-options="educationOptions"
          ></resume-template>
        </div>
      </div>
      <div class="row mt-5" v-else>
        <div class="col-12">
          <h3>К сожалению, такого резюме не существует! :(</h3>
          <router-link :to="{ name: 'resume' }" class="mt-3 btn btn-outline-dark"> Обратно на главную страницу </router-link>
        </div>
      </div>
    </template>

    <!--  loading  -->
    <template v-if="loading">
      <app-spinner></app-spinner>
    </template>
  </div>
</template>

<script>
import AppSpinner from '@/ui/appSpinner/AppSpinner';
import ResumeForm from '@/components/resume/resumeForm/ResumeForm';
import ResumeTemplate from '@/components/resume/resumeTemplate/ResumeTemplate';
import { ResumeApi } from '@/api/resumeApi/ResumeApi';

export default {
  name: 'MainResume',
  components: { ResumeTemplate, ResumeForm, AppSpinner },
  props: {
    id: {
      type: String,
      required: false,
      default: null,
    },
  },
  watch: {
    async id() {
      this.loading = true;
      await this.$store.dispatch('fetchResume', this.id);
      if (!this.resume) {
        this.fail = true;
      }
      this.loading = false;
    },
  },
  async created() {
    await this.$store.dispatch('fetchResume', this.id);
    if (!this.resume) {
      this.fail = true;
    }
    this.loading = false;
  },
  data: () => ({
    loading: true,
    fail: false,
    errors: [],
    // status options for select-box
    statusOptions: [
      {
        value: 'new',
        caption: 'Новый',
      },
      {
        value: 'interview',
        caption: 'Назначено собеседование',
      },
      {
        value: 'accepted',
        caption: 'Принят',
      },
      {
        value: 'refused',
        caption: 'Отказ',
      },
    ],
    // education options for select-box
    educationOptions: [
      {
        value: 'average',
        caption: 'Среднее',
      },
      {
        value: 'average_special',
        caption: 'Среднее специальное',
      },
      {
        value: 'unfinished_higher',
        caption: 'Неоконченное высшее',
      },
      {
        value: 'higher',
        caption: 'Высшее',
      },
    ],
  }),
  methods: {
    async apply() {
      this.errors = this.validateForm;
      if (!(this.errors && this.errors.length)) {
        if (!this.isEdit) {
          let result = await ResumeApi.postResume(this.resume);
          if (result) alert(`Резюме добавлено в БД`);
          else alert(`Произошла неизвестная ошибка`);
        } else {
          let result = await ResumeApi.editResume(this.id, this.resume);
          if (result) alert(`Резюме отредактировано в БД`);
          else alert(`Произошла неизвестная ошибка`);
        }
      }
    },
  },
  computed: {
    resume() {
        return this.$store.getters.resume;
    },
    isEdit() {
      return !!this.id;
    },
    validateForm() {
      let errors = [];
      for (let key in this.resume) {
        if (!this.resume[key].value) {
          errors.push(this.resume[key].caption);
        }
        if (key === 'education' && this.resume[key].value !== 'average' && this.resume[key].value !== '') {
          for (let i = 0; i < this.resume.education.optionally.length; i++) {
            for (let educationKey in this.resume.education.optionally[i]) {
              if (!this.resume.education.optionally[i][educationKey].value) {
                errors.push(this.resume.education.optionally[i][educationKey].caption);
              }
            }
          }
        }
      }
      if (!(this.resume.telephone.value.length === 11) && !errors.includes(this.resume.telephone.caption))
        errors.push('В телефоне должно быть 11 цифр!');
      return errors;
    },
  },
};
</script>

<style scoped></style>
