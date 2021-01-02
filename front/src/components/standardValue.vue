<template>
    <transition name="fade">
        <div class="stanValue" v-if="isShow">
            <div class="overlay">
                <!-- <div class="modal__bg"></div> -->
                <!-- <div class="modal__content"> -->
                <div class="content">
                    <span>基準値を入力して、OKボタンを押して下さい。</span>
                    <input v-model="value">円/SUSHI
                    <button class="explanationButton" v-on:click="explanationValueModal">基準値とは</button>
                    <button class="okButton" @click="DifficultySet">OK</button>
                    <!-- <button @click="DifficultySet">DifficultySet</button>
                    <button @click="showSushiSelectt">shoSushiSelectct</button> -->
                    <button class="closeButton" @click="hide">閉じる</button>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
import { mapState, mapMutations, mapActions } from 'vuex'
import MultiModalMixin from '@/mixins/MultiModalMixin'


export default {
    name:'BasicModal',
    mixins: [MultiModalMixin],
    computed: {
        ...mapState('BasicModal', ['isShow'])
    },
    methods: {
        ...mapMutations('BasicModal', ['hide']),
        ...mapActions('multiModal', ['DifficultySet'])
    }
}
</script>

<style lang="scss">
@import '@/assets/sass/modal.scss';
@import '@/assets/sass/ExplanationButton.scss';


//     .okButton {
//         width: 100px;
//         height: 80px;
//         border-color: #842F00;
//         border-radius: 5px;
//         font-size: 50px;
//         color: #842F00;
//         background-color : hsl(40, 100%, 78%);
//     }
// }


</style>