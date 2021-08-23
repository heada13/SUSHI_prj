import Vue from 'vue'
import router from './router' 
import App from './App.vue'
import vuetify from '@/plugins/vuetify' // path to vuetify export
import axios from 'axios'
// import web3 from '@/plugins/web3.js'
// require('@/assets/sass/modal.scss')

Vue.config.productionTip = false
Vue.prototype.$axios = axios

new Vue({
  // web3,
  vuetify,
  router,
  render: h => h(App),
}).$mount('#app')
