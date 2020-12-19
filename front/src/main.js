import Vue from 'vue'
import router from './router' 
import App from './App.vue'

// require('@/src/assets/scss/style.scss')

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')

