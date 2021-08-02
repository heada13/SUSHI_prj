import Vue from 'vue'
import router from './router' 
import App from './App.vue'
import vuetify from '@/plugins/vuetify' // path to vuetify export
import axios from 'axios'

// require('@/assets/sass/modal.scss')

Vue.config.productionTip = false
Vue.prototype.$axios = axios

new Vue({
  vuetify,
  router,
  render: h => h(App),
}).$mount('#app')
