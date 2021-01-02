<template>
  <transition name="fade">
    <div>
      <component v-if="isShow" :is="modalName"></component>
    </div>
  </transition>
</template>

<script>
import { mapState } from 'vuex'
import BasicModal from '@/components/StandardValue.vue'
import DifficultySet from '@/components/DifficultySet.vue'
import SushiSelect from '@/components/SushiSelect.vue'

export default {
    name: 'MultiModalView',
    components: {
      BasicModal,
      DifficultySet,
      SushiSelect,
    },
    computed: {
      ...mapState('BasicModal', ['isShow']),
      ...mapState('multiModal', ['modalName']),
      isShow () {
        return this.modalName !== ''
      }
    }
}
</script>

<style lang="scss">

@import '@/assets/sass/modal.scss';

</style>