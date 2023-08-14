<template>
  <header class="p-3 bg-dark text-white sticky-top">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li>
            <router-link :to="{ name: 'resume' }" class="nav-link px-2 text-secondary fw-bolder">Resume</router-link>
          </li>

          <li><router-link :to="{ name: 'resume' }" class="nav-link px-2 text-white">Главная</router-link></li>
          <li><router-link :to="{ name: 'new_resume' }" class="nav-link px-2 text-white">Новое резюме</router-link></li>
          <li><router-link :to="{ name: 'convert' }" class="nav-link px-2 text-white">Конвертация</router-link></li>
        </ul>

        <div class="text-end">
          <router-link :to="{ name: 'resume' }" class="btn btn-outline-light me-2">Главная</router-link>
          <router-link :to="{ name: 'new_resume' }" class="btn btn-outline-warning me-2">Новое резюме</router-link>
          <router-link :to="{ name: 'convert' }" class="btn btn-outline-success">Конвертация</router-link>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: 'LayoutHeader',
};
</script>

<style scoped></style>
