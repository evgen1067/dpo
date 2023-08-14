<template>
  <div class="mb-3">
    <label :for="id" class="form-label">
      <slot></slot>
    </label>
    <input
      class="form-control"
      v-model="value"
      :id="id"
      :type="type"
      :placeholder="placeholder"
      :list="itemKey"
      @update:modelValue="changeInput"
    />
    <datalist v-if="hints" :id="itemKey">
      <option v-for="(item, key) in hints" :key="key" :value="item.title">{{ item.title }}</option>
    </datalist>
  </div>
</template>

<script>
import { uuid } from 'vue-uuid';

export default {
  name: 'AppInput',
  props: {
    placeholder: {
      type: String,
      required: true,
    },
    itemKey: {
      type: String,
      required: false,
    },
    type: {
      type: String,
      required: false,
      default: 'text',
    },
    hints: {
      type: Array,
      required: false,
      default: null,
    },
  },
  emits: ['changeInput'],
  data: () => ({
    id: uuid.v1(),
    value: '',
  }),
  methods: {
    changeInput() {
      if (this.itemKey === 'telephone' && this.value) {
        if (/\D/.test(this.value)) this.value = this.value.substring(0, this.value.length - 1);
      }
      this.$emit('changeInput', {
        key: this.itemKey,
        value: this.value,
      });
    },
  },
};
</script>

<style scoped></style>
