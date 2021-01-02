<template>
    <div id=auth>
        <h1>SUSHIゲーム(仮)</h1>
        <img alt="SHUSHI" src="../assets/SUSHI.png">
        <div class="authButton">
            <button class="startButton" v-on:click="routeMain">スタート</button>
            <button class="explanationButton" v-on:click="ExplanationGameModal">SUSHIゲームとは</button>
        </div>
        <!-- entranceButtonはmetamask接続確認後に表示する -->
        <div class="entranceButton">
            <button class="continueButton" >続きから</button>
            <button class="beginButton" @click="BasicModalShow">最初から</button>
            <Multi-modal-view></Multi-modal-view>
        </div>
        <!-- <Basic-Modal></Basic-Modal>
        <button @click="DifficultySet">DifficultySet</button>
        <button @click="showSushiSelect">showSushiSelect</button> -->
        <div id="overlay1" v-show="showContent">
            <div id="content">
                <p>SUSHIゲームについての説明</p>
                <p><button v-on:click="closeModal">close</button></p>
            </div>
        </div>
    </div>
</template>


<script>
// import Vue from 'vue'
import { mapMutations } from 'vuex'
// import BasicModal from '@/components/StandardValue.vue'
import MultiModalView from '@/components/MultiModalView.vue'

export default{
    name: "MetamaskAuth",
    components: {
        // BasicModal,
        MultiModalView
    },
    data (){
        return {
            showContent: false
        }
    },
    methods: {
        ...mapMutations('BasicModal', {
            BasicModalShow: 'show'
        }),
        // ...mapActions('multiModal', ['DifficultySet', 'showSushiSelect'])
        // ,
        routeMain(){
            this.$router.push('/main')
        },
        ExplanationGameModal (){
            this.showContent = true
        },
        closeModal (){
            this.showContent = false
        }
    }
}
</script>

<style lang="scss">
@import '@/assets/sass/ExplanationButton.scss';

#auth {
    height: 100vh;
	display: flex;
	flex-direction: column; 
    align-items: center;
}

#auth h1 {
    color: #842F00;
    font-size: 50px;
    font-family: Doppio One;
}

#auth img {
    width: 200px;
    height: auto; 
}

.startButton {
    width: 250px;
    height: 100px;
    border-color: #842F00;
    border-radius: 5px;
    font-size: 50px;
    color: #842F00;
    background-color : hsl(40, 100%, 78%);
}

.beginButton {
    width: 250px;
    height: 100px;
    border-color: #842F00;
    border-radius: 5px;
    font-size: 50px;
    color: #842F00;
    background-color : hsl(40, 100%, 78%);
}

.continueButton {
    width: 250px;
    height: 100px;
    border-color: #842F00;
    border-radius: 5px;
    font-size: 50px;
    color: #842F00;
    background-color : hsl(40, 100%, 78%);
}

#overlay1{
    /* 要素を重ねた時の順番 */
    z-index:1;

    /* 画面全体を覆う設定 */
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background-color:rgba(0,0,0,0.5);

    /* 画面の中央に要素を表示させる設定 */
    display: flex;
    align-items: center;
    justify-content: center;
}

#content{
    z-index:2;
    width:50%;
    padding: 1em;
    background:#fff;
}


</style>