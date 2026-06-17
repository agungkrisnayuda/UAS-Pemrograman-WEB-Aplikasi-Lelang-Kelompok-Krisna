import { createApp } from "vue";
import { createPinia } from "pinia";
import 'bootstrap/dist/css/bootstrap.min.css'
import "./assets/style.css";

import App from "./App.vue";
import router from "./router";

import "./echo";

const app = createApp(App);

app.use(createPinia());
app.use(router);

app.mount("#app");