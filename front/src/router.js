import Vue from 'vue'
import Router from 'vue-router'
// import Start from './views/MetamaskAuth.vue'
// import HomeView from './views/HomeView.vue'

Vue.use(Router)

export default new Router({
    base: process.env.BASE_URL,
    mode: 'history',
    routes: [
        {
        path: '/',
        name: 'start',
        component: () =>
            import (/* webpackChunkName: "Start" */ "./views/MetamaskAuth.vue")
        },
        {
        path: '/main',
        name: 'HomeView',
        component: () =>
            import (/* webpackChunkName: "HmoeView" */ "./views/HomeView.vue")
        },
        {
        path: '/setting',
        name: 'InitialSetting',
        component: () =>
            import (/* webpackChunkName: "HmoeView" */ "./views/InitialSetting.vue")
        }        

    ]
})