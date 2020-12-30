<template>
    <div id=auth>
        <h1>SUSHIゲーム(仮)</h1>
        <img alt="SHUSHI" src="../assets/SUSHI.png">
        <div class="authButton">
            <button class="startButton" v-on:click="routeMain">スタート</button>
            <button class="explanationGame" v-on:click="explanationGameModal">SUSHIゲームとは</button>
        </div>
        <!-- entranceButtonはmetamask接続確認後に表示する -->
        <div class="entranceButton">
            <button class="continueButton" >続きから</button>
            <button class="beginButton" @click="basicModalShow">最初から</button>
        </div>
        <Basic-Modal></Basic-Modal>
        <div id="overlay" v-show="showContent">
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
import BasicModal from '@/components/standardValue.vue'

export default{
    name: "metamaskAuth",
    components: {
        BasicModal
    },
    data (){
        return {
            showContent: false
        }
    },
    methods: {
        ...mapMutations('basicModal', {
            basicModalShow: 'show'
        }),
        routeMain(){
            this.$router.push('/main')
        },
        explanationGameModal (){
            this.showContent = true
        },
        closeModal (){
            this.showContent = false
        }
    }
}
</script>

<style scoped>

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

.explanationGame{
    width: 200px;
    height: 70px;
    margin: 50px;
    border-color: #28C700;
    border-radius: 5px;
    font-size: 100%;
    color: #28C700;
    background-color:rgba(0,0,0,0);
}

#overlay{
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