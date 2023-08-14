<template>
  <layout-header></layout-header>
  <main-index></main-index>
  <layout-footer></layout-footer>
</template>

<script>
import MainIndex from '@/components/MainIndex';
import LayoutHeader from '@/components/layout/layoutHeader/LayoutHeader';
import LayoutFooter from '@/components/layout/layoutFooter/LayoutFooter';
export default {
  name: 'App',
  components: { LayoutFooter, LayoutHeader, MainIndex },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Montserrat Alternates', sans-serif;
}
main {
  min-height: 70vh;
}
</style>
