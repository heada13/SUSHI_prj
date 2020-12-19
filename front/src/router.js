import Vue from 'vue'
import Router from 'vue-router'
import Start from './views/metamaskAuth.vue'
import HomeView from './views/homeView.vue'

Vue.use(Router)

export default new Router({
    base: process.env.BASE_URL,
    mode: 'history',
    routes: [
        {
        path: '/',
        name: 'start',
        component: Start
        },
        {
        path: '/main',
        name: 'homeView',
        component: HomeView
        }        
    ]
})