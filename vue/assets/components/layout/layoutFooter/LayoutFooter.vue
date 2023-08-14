<template>
  <div class="container">
    <footer class="py-3 my-4">
      <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item">
          <router-link :to="{ name: 'resume' }" class="nav-link px-2 text-muted">Главная</router-link>
        </li>
        <li class="nav-item">
          <router-link :to="{ name: 'new_resume' }" class="nav-link px-2 text-muted">Новое резюме</router-link>
        </li>
        <li class="nav-item">
          <router-link :to="{ name: 'convert' }" class="nav-link px-2 text-muted">Конвертация</router-link>
        </li>
      </ul>
      <p class="text-center text-muted">© 2022 LSTU, Bogomolov Evgeniy</p>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'LayoutFooter',
};
</script>

<style scoped></style>
