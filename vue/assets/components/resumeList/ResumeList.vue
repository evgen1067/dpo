<template>
  <div class="container" v-if="!loading">
    <div class="row">
      <div class="col-lg-3 col-6 mt-3">
        <h3>Новый ({{ newStatus.length }}):</h3>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <h3>Назначено собеседование ({{ interviewStatus.length }}):</h3>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <h3>Принят ({{ acceptedStatus.length }}):</h3>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <h3>Отказ ({{ refusedStatus.length }}):</h3>
      </div>
    </div>
    <div class="row" v-if="resumeList">
      <div class="col-lg-3 col-6 mt-3">
        <draggable
          class="list-group"
          tag="ul"
          v-model="newStatus"
          v-bind="dragOptions"
          :move="onMove"
          @start="isDragging = true"
          @end="isDragging = false"
        >
          <transition-group type="transition" name="flip-list">
            <li class="list-group-item" v-for="item in newStatus" :key="item.id">
              <list-card
                :name="item.name"
                :profession="item.profession"
                :age="item.dateOfBirth"
                :photo="item.photo"
                @click="clickCard(item)"
              ></list-card>
            </li>
          </transition-group>
        </draggable>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <draggable element="span" v-model="interviewStatus" v-bind="dragOptions" :move="onMove">
          <transition-group type="transition" name="flip-list">
            <li class="list-group-item" v-for="item in interviewStatus" :key="item.id">
              <list-card
                :name="item.name"
                :profession="item.profession"
                :age="item.dateOfBirth"
                :photo="item.photo"
                @click="clickCard(item)"
              ></list-card>
            </li>
          </transition-group>
        </draggable>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <draggable element="span" v-model="acceptedStatus" v-bind="dragOptions" :move="onMove">
          <transition-group type="transition" name="flip-list">
            <li class="list-group-item" v-for="item in acceptedStatus" :key="item.id">
              <list-card
                :name="item.name"
                :profession="item.profession"
                :age="item.dateOfBirth"
                :photo="item.photo"
                @click="clickCard(item)"
              ></list-card>
            </li>
          </transition-group>
        </draggable>
      </div>
      <div class="col-lg-3 col-6 mt-3">
        <draggable element="span" v-model="refusedStatus" v-bind="dragOptions" :move="onMove">
          <transition-group type="transition" name="flip-list">
            <li class="list-group-item" v-for="item in refusedStatus" :key="item.id">
              <list-card
                :name="item.name"
                :profession="item.profession"
                :age="item.dateOfBirth"
                :photo="item.photo"
                @click="clickCard(item)"
              ></list-card>
            </li>
          </transition-group>
        </draggable>
      </div>
    </div>
  </div>
  <div class="container" v-else>
    <app-spinner></app-spinner>
  </div>
</template>

<script>
import AppSpinner from "@/ui/appSpinner/AppSpinner";
import ListCard from './ListCard/ListCard';
import { VueDraggableNext } from 'vue-draggable-next';
import { ResumeApi } from '@/api/resumeApi/ResumeApi';

export default {
  name: 'ResumeList',
  components: { AppSpinner, ListCard, draggable: VueDraggableNext },
  data: () => ({
    editable: true,
    isDragging: false,
    delayedDragging: false,
    loading: true,
  }),
  async created() {
    await this.updateLists();
  },
  methods: {
    async onMove({ relatedContext, draggedContext }) {
      const relatedElement = relatedContext.element;
      const draggedElement = draggedContext.element;
      await ResumeApi.editResumeStatus(draggedElement.id, { status: relatedElement.status });
      await this.updateLists();
      return (!relatedElement || !relatedElement.fixed) && !draggedElement.fixed;
    },
    async updateLists() {
      await this.$store.dispatch('fetchResumeList');
      this.loading = false;
    },
    clickCard(item) {
      item.fixed = !item.fixed;
      this.$router.push({ name: 'edit', params: { id: item.id } });
    },
  },
  computed: {
    resumeList() {
      return this.$store.getters.resumeList;
    },
    newStatus() {
      return this.resumeList?.filter(item => item.status === 'new');
    },
    interviewStatus() {
      return this.resumeList?.filter(item => item.status === 'interview');
    },
    acceptedStatus() {
      return this.resumeList?.filter(item => item.status === 'accepted');
    },
    refusedStatus() {
      return this.resumeList?.filter(item => item.status === 'refused');
    },
    dragOptions() {
      return {
        animation: 0,
        group: 'description',
        disabled: !this.editable,
        ghostClass: 'ghost',
      };
    },
  },
  watch: {
    isDragging(newValue) {
      if (newValue) {
        this.delayedDragging = true;
        return;
      }
      this.$nextTick(() => {
        this.delayedDragging = false;
      });
    },
  },
};
</script>

<style scoped>
.flip-list-move {
  transition: transform 0.5s;
}
.no-move {
  transition: transform 0s;
}
.ghost {
  opacity: 0.5;
  background: #c8ebfb;
}
.list-group {
  min-height: 20px;
}
.list-group-item {
  cursor: move;
}
.list-group-item i {
  cursor: pointer;
}
</style>
