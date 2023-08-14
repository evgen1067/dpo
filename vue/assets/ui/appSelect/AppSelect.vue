<template>
  <div class="mb-3">
    <label :for="id" class="form-label">
      <slot></slot>
    </label>
    <select
        class="form-select"
        :id="id"
        :value="value"
        @change="changeSelect($event.target.value)">
      <option v-for="(option, key) in options" :key="key" :value="option.value">
        {{ option.caption }}
      </option>
    </select>
  </div>
</template>

<script>
import { uuid } from 'vue-uuid';
export default {
  name: 'AppSelect',
  props: {
    options: {
      type: Array,
      required: true,
    },
    itemKey: {
      type: String,
      required: false,
    },
    value: {
      type: String,
      required: false,
      default: '',
    },
  },
  emits: ['changeSelect'],
  data: () => ({
    id: uuid.v1(),
  }),
  methods: {
    changeSelect(value) {
      this.$emit('changeSelect', {
        key: this.itemKey,
        value: value,
      });
    }
  }
};
</script>

<style scoped>

</style>