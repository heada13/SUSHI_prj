<template>
    <transition name="fade">
        <div class="stanValue" v-if="isShow">
            <div class="modal__bg"></div>
            <div class="modal__content">
                <span>基準値を入力して、OKボタンを押して下さい。</span>
                <!-- <input v-model="value">円/SUSHI
                <button class="explanationValue" v-on:click="explanationValueModal">基準値とは</button>
                <button class="okButton" v-on:click="ok">OK</button> -->
            </div>
        </div>
    </transition>
</template>

<script>
import { mapState, mapMutations } from 'vuex'

export default {
    name:'BasicModal',
    computed: {
        ...mapState('basicModal', ['isShow'])
    },
    methods: {
        ...mapMutations('basicModal', ['hide'])
    }
}
</script>