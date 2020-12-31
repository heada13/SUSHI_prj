<template>
    <transition name="fade">
        <div class="overlay">
            <div class="stanValue" v-if="isShow">
                <div class="modal__bg"></div>
                <div class="modal__content">
                    <span>基準値を入力して、OKボタンを押して下さい。</span>
                    <input v-model="value">円/SUSHI
                    <button class="explanationValue" v-on:click="explanationValueModal">基準値とは</button>
                    <button class="okButton" v-on:click="ok">OK</button>
                </div>
            </div>
        </div>
    </transition>
</template>

<script>
import { mapState, mapMutations } from 'vuex'

export default {
    name:'BasicModal',
    computed: {
        ...mapState('BasicModal', ['isShow'])
    },
    methods: {
        ...mapMutations('BasicModal', ['hide'])
    }
}
</script>

<style lang="scss">
@import '../assets/modal.scss';

.stanValue {
    height: 50vh;
	display: flex;
	flex-direction: column; 
    align-items: center;
    .modal__bg {
        position:fixed;
        top:0;
        left:0;
        width:100%;
        height:100%;
        background-color:rgba(0,0,0,0.5);
    }
    .okButton {
        width: 100px;
        height: 80px;
        border-color: #842F00;
        border-radius: 5px;
        font-size: 50px;
        color: #842F00;
        background-color : hsl(40, 100%, 78%);
    }
}


</style>