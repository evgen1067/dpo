<template>
  <template v-for="(item, key) in resume" :key="key">
    <div class="d-flex flex-column">
      <h5>{{ `${item.caption}:` }}</h5>
      <p>{{ value(key, item.value) }}</p>
      <template v-if="lvlEducation && key === 'education'">
        <template v-for="(opt, optKey) in item.optionally" :key="optKey">
          <template v-for="(subItem, subKey) in opt" :key="subKey">
            <h5>{{ `${subItem.caption}:` }}</h5>
            <p>{{ value(subKey, subItem.value) }}</p>
          </template>
        </template>
      </template>
    </div>
  </template>
</template>

<script>
export default {
  name: 'ResumeTemplate',
  props: {
    resume: {
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
  methods: {
    value(key, value) {
      if (key === 'status') {
        return this.statusOptions.filter(x => x.value === value)[0].caption;
      } else if (key === 'education') {
        return this.educationOptions.filter(x => x.value === value)[0].caption;
      } else {
        return value;
      }
    },
  },
  computed: {
    lvlEducation() {
      return !(this.resume.education.value === 'average' || this.resume.education.value === '');
    },
  },
};
</script>

<style scoped>
p {
  white-space: break-spaces;
  overflow: hidden;
}
</style>
