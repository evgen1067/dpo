import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

// BOOTSTRAP
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle';

// UUID
import withUUID from 'vue-uuid';

// FONT
import '@fontsource/montserrat-alternates/100.css';
import '@fontsource/montserrat-alternates/200.css';
import '@fontsource/montserrat-alternates/300.css';
import '@fontsource/montserrat-alternates/400.css';
import '@fontsource/montserrat-alternates/500.css';
import '@fontsource/montserrat-alternates/600.css';
import '@fontsource/montserrat-alternates/700.css';
import '@fontsource/montserrat-alternates/800.css';
import '@fontsource/montserrat-alternates/900.css';

const app = withUUID(createApp(App));
app.use(store);
app.use(router);
app.mount('#app');
