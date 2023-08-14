<template>
  <div class="mb-3">
    <label :for="id" class="form-label">
      <slot></slot>
    </label>
    <textarea
        class="form-control"
        rows="3"
        v-model="value"
        :id="id"
        :placeholder="placeholder"
        @update:modelValue="changeTextarea"
    ></textarea>
  </div>
</template>

<script>
import { uuid } from 'vue-uuid';
export default {
  name: 'AppTextarea',
  props: {
    itemKey: {
      type: String,
      required: false,
    },
    placeholder: {
      type: String,
      required: false,
      default: '',
    },
  },
  emits: ['changeTextarea'],
  data: () => ({
    id: uuid.v1(),
    value: '',
  }),
  methods: {
    changeTextarea() {
      this.$emit('changeTextarea', {
        key: this.itemKey,
        value: this.value,
      });
    }
  }
};
</script>

<style scoped>

</style>