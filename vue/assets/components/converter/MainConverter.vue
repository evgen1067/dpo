<template>
  <div class="container mt-3">
    <div class="row mt-1 border">
      <div class="col-12 text-center mt-3">
        <h3>Метры в футы</h3>
      </div>
      <div class="col-6 border-end">
        <div class="mb-3">
          <label for="feet" class="form-label"> Футы </label>
          <input v-model="feet" id="feet" type="number" class="form-control" />
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="meters" class="form-label"> Метры </label>
          <input v-model="meters" id="meters" type="number" class="form-control" />
        </div>
      </div>
    </div>

    <div class="row mt-1 border">
      <div class="col-12 text-center mt-3">
        <h3>Морские мили в километры</h3>
      </div>
      <div class="col-6 border-end">
        <div class="mb-3">
          <label for="miles" class="form-label"> Морские мили </label>
          <input v-model="miles" id="miles" type="number" class="form-control" />
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="kilometers" class="form-label"> Километры </label>
          <input v-model="kilometers" id="kilometers" type="number" class="form-control" />
        </div>
      </div>
    </div>

    <div class="row mt-1 border">
      <div class="col-12 text-center mt-3">
        <h3>Градусы в радианы</h3>
      </div>
      <div class="col-6 border-end">
        <div class="mb-3">
          <label for="degrees" class="form-label"> Градусы </label>
          <input v-model="degrees" id="degrees" type="number" class="form-control" />
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="radians" class="form-label"> Радианы </label>
          <input v-model="radians" id="radians" type="number" class="form-control" />
        </div>
      </div>
    </div>

    <div class="row mt-1 border">
      <div class="col-12 text-center mt-3">
        <h3>Температура по Цельсию в температуру по Фаренгейту</h3>
      </div>
      <div class="col-6 border-end">
        <div class="mb-3">
          <label for="celsius" class="form-label"> Температура по Цельсию </label>
          <input v-model="celsius" id="celsius" type="number" class="form-control" />
        </div>
      </div>
      <div class="col-6">
        <div class="mb-3">
          <label for="fahrenheit" class="form-label"> Температура по Фаренгейту </label>
          <input v-model="fahrenheit" id="fahrenheit" type="number" class="form-control" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MainConverter',
  data: () => ({
    feet: 0,
    meters: 0,
    miles: 0,
    kilometers: 0,
    degrees: 0,
    radians: 0,
    celsius: 0,
    fahrenheit: 0,
  }),
  watch: {
    feet() {
      this.meters = this.feet * 3.281;
    },
    meters() {
      this.feet = this.meters / 3.281;
    },
    miles() {
      this.kilometers = this.miles * 1.852;
    },
    kilometers() {
      this.miles = this.kilometers / 1.852;
    },
    degrees() {
      this.radians = this.degrees * (Math.PI / 180);
    },
    radians() {
      this.degrees = this.radians * (180 / Math.PI);
    },
    celsius() {
      this.fahrenheit = this.celsius * 1.8 + 32;
    },
    fahrenheit() {
      this.celsius = (this.fahrenheit - 32) / 1.8;
    },
  },
};
</script>

<style scoped></style>
