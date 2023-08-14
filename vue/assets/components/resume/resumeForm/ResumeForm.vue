<template>
  <app-input :placeholder="resume.profession.value" item-key="profession" @change-input="changeValue">
    {{ resume.profession.caption }}
  </app-input>
  <app-input :placeholder="resume.city.value" item-key="city" @change-input="changeValue" :hints="cityHints">
    {{ resume.city.caption }}
  </app-input>
  <app-input :placeholder="resume.photo.value" item-key="photo" @change-input="changeValue">
    {{ resume.photo.caption }}
  </app-input>
  <app-input :placeholder="resume.name.value" item-key="name" @change-input="changeValue">
    {{ resume.name.caption }}
  </app-input>
  <app-input :placeholder="resume.telephone.value" item-key="telephone" @change-input="changeValue">
    {{ resume.telephone.caption }}
  </app-input>
  <app-input :placeholder="resume.email.value" item-key="email" @change-input="changeValue">
    {{ resume.email.caption }}
  </app-input>
  <app-input :placeholder="resume.dateOfBirth.value" item-key="dateOfBirth" @change-input="changeValue">
    {{ resume.dateOfBirth.caption }}
  </app-input>
  <app-select
    :options="educationOptions"
    :value="resume.education.value"
    item-key="education"
    @change-select="changeValue"
  >
    {{ resume.education.caption }}
  </app-select>
  <template v-if="lvlEducation">
    <template v-for="(item, key) in resume.education.optionally" :key="key">
      <div v-if="key !== 0" class="d-flex justify-content-end" @click="rmEducation(key)">
        <svg width="32px" height="32px" class="bi bi-x-square-fill" viewBox="0 0 16 16">
          <path
            d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm3.354 4.646L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 1 1 .708-.708z"
          />
        </svg>
      </div>
      <app-input
        :placeholder="item.institution.value"
        item-key="institution"
        @change-input="changeOptionallyValue(key, $event)"
        :hints="universityHints"
      >
        {{ item.institution.caption }}
      </app-input>
      <app-input
        :placeholder="item.faculty.value"
        item-key="faculty"
        @change-input="changeOptionallyValue(key, $event)"
      >
        {{ item.faculty.caption }}
      </app-input>
      <app-input
        :placeholder="item.specialization.value"
        item-key="specialization"
        @change-input="changeOptionallyValue(key, $event)"
      >
        {{ item.specialization.caption }}
      </app-input>
      <app-input
        :placeholder="item.endYear.value"
        item-key="endYear"
        @change-input="changeOptionallyValue(key, $event)"
      >
        {{ item.endYear.caption }}
      </app-input>
    </template>
    <app-button @click="createEducation">Добавить образование</app-button>
  </template>
  <app-input :placeholder="resume.salary.value" item-key="salary" @change-input="changeValue">
    {{ resume.salary.caption }}
  </app-input>
  <app-textarea :placeholder="resume.skills.value" item-key="skills" @change-textarea="changeValue">
    {{ resume.skills.caption }}
  </app-textarea>
  <app-textarea :placeholder="resume.about.value" item-key="about" @change-textarea="changeValue">
    {{ resume.about.caption }}
  </app-textarea>
  <app-select :options="statusOptions" item-key="status" :value="resume.status.value" @change-select="changeValue">
    {{ resume.status.caption }}
  </app-select>
  <app-button @click="$emit('apply')">Применить</app-button>
</template>

<script>
import AppInput from '@/ui/appInput/AppInput';
import AppButton from '@/ui/appButton/AppButton';
import AppSelect from '@/ui/appSelect/AppSelect';
import AppTextarea from '@/ui/appTextarea/AppTextarea';
import { CityApi } from '@/api/cityApi/CityApi';
import { UniversityApi } from '@/api/universityApi/UniversityApi';

export default {
  name: 'ResumeForm',
  components: { AppTextarea, AppSelect, AppButton, AppInput },
  props: {
    resumeProps: {
      type: Object,
      required: true,
    },
    statusOptions: {
      type: Array,
      required: true,
    },
    educationOptions: {
      type: Array,
      required: true,
    },
  },
  emits: ['apply'],
  data: () => ({
    // city hints
    cityHints: [],
    // university hints
    universityHints: [],
  }),
  methods: {
    async changeValue(item) {
      this.resume[item.key].value = item.value;
      if (item.key === 'city' && item.value) {
        this.cityHints = await CityApi.getCities(item.value);
      }
    },
    async changeOptionallyValue(key, item) {
      this.resume.education.optionally[key][item.key].value = item.value;
      if (item.key === 'institution' && item.value) {
        this.universityHints = await UniversityApi.getUniversities(item.value);
      }
    },
    createEducation() {
      this.resume.education.optionally.push({
        institution: {
          value: '',
          caption: 'Учебное заведение',
        },
        faculty: {
          value: '',
          caption: 'Факультет',
        },
        specialization: {
          value: '',
          caption: 'Специализация',
        },
        endYear: {
          value: '',
          caption: 'Год окончания',
        },
      });
    },
    rmEducation(key) {
      this.resume.education.optionally.splice(key, 1);
    },
  },
  computed: {
    resume() {
      return this.resumeProps;
    },
    lvlEducation() {
      return !(this.resume.education.value === 'average' || this.resume.education.value === '');
    },
  },
};
</script>

<style scoped></style>
