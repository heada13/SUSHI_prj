import Vue from 'vue'
import router from './router' 
import App from './App.vue'
import vuetify from '@/plugins/vuetify' // path to vuetify export

// require('@/assets/sass/modal.scss')

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  render: h => h(App),
}).$mount('#app')

