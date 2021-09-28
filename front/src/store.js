import Vue  from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
export default new Vuex.Store({
  strict: true,
  state:{
    entered:false // このステートが変更されるとアニメーションが🔥
  },
  getters:{
    getData(state) {
      return state.entered // 各コンポーネントのウォッチャで監視するので
    }
  },
  mutations:{
    setData(state) {
      state.entered = !state.entered; // クリックされたらステートを切り替えます
    },
  }
})