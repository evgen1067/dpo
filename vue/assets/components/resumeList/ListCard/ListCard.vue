<template>
  <div class="card mb-3">
    <img :src="photo" class="card-img-top" alt="" />
    <div class="card-body">
      <h5 class="card-title">{{ name }}</h5>
      <p class="card-text">
        {{ profession + ', ' + age }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListCard',
  props: {
    name: {
      type: String,
      required: true,
    },
    profession: {
      type: String,
      required: true,
    },
    age: {
      type: String,
      required: true,
    },
    photo: {
      type: String,
      required: true,
    },
  },
};
</script>

<style scoped>
.card {
  cursor: pointer !important;
  width: 100%;
}
</style>
