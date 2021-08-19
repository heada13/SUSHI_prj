<template>
    <transition name="fade">
        <div class="stanValue" v-if="isShow">
          <div class="overlay">
            <div class="content">
              <input type="radio" class="radio" v-model="checkDifficulty" value="EASY"><span class="label panel-easy">EASY</span>
              <input type="radio" class="radio" v-model="checkDifficulty" value="HARD"><span class="label panel-hard">HARD</span>
              <input type="radio" class="radio" v-model="checkDifficulty" value="HELL"><span class="label panel-hell">HELL</span>
              <button @click="hideModal">closeModal</button>
            </div>
          </div>
        </div>
    </transition>
</template>

<script>
import { mapState } from 'vuex'
import MultiModalMixin from '@/mixins/MultiModalMixin'
export default {
  name: 'DifficultySet',
  data (){
    return {
        checkDifficulty: ''
    }
  },
  computed: {
    ...mapState('BasicModal', ['isShow'])
  },
  mixins: [MultiModalMixin]

}

</script>

<style lang="scss">
@import '@/assets/sass/modal.scss';
@import '@/assets/sass/ExplanationButton.scss';
@import '@/assets/sass/label.scss';


// .label1{
//   width: 100px;
//   height: 50px;
//   background-color: aquamarine;
// }

.radio{
  width: 30px;
  height: 30px;
}


</style>