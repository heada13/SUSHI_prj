const state = {
    modalName: 'BasicModal'
  }
  
  const mutations = {
    setModal (state, name) {
      state.modalName = name
    },
    hideModal (state) {
      state.modalName = ''
    }
  }
  
  const actions = {
    DifficultySet ({ commit }) {
      commit('setModal', 'DifficultySet')
    },
    showSushiSelectt ({ commit }) {
      commit('setModal', 'SushiSelectt')
    },
  }
  
  export default {
    namespaced: true,
    state,
    mutations,
    actions
  }