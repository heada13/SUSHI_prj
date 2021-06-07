<template>
    <div id=auth>
        <h1>SUSHIゲーム(仮)</h1>
        <img alt="SHUSHI" src="../assets/SUSHI.png">
        <div @click="changeCurrentMenu('StarButton')">
            <StartMenu v-show="currentMenu=='StartMenu'">
            </StartMenu>
            <StartButton v-show="currentMenu=='StarButton'">
            </StartButton>
        </div>
        <!-- entranceButtonはmetamask接続確認後に表示する -->
        <!-- <Basic-Modal></Basic-Modal>
        <button @click="DifficultySet">DifficultySet</button>
        <button @click="showSushiSelect">showSushiSelect</button> -->
        <div @click="displayModal()">
            SUSHIゲームとは
        </div>
        <ExplainGame
        v-show="showExplain"
        :display-modal="displayModal"/>
    </div>
</template>


<script>
// import Vue from 'vue'
// import { mapMutations } from 'vuex'
import StartMenu from '@/components/StartMenu.vue'
import StartButton from '@/components/StartButton.vue'
import ExplainGame from '@/components/ExplainGame.vue'

export default{
    name: "MetamaskAuth",
    components: {
        StartMenu,
        StartButton,
        ExplainGame
    },
    data (){
        return {
            currentMenu: "StartMenu",
            showExplain: false
        }
    },
    methods: {
        // ...mapMutations('BasicModal', {
        //     BasicModalShow: 'show'
        // }),
        // ...mapActions('multiModal', ['DifficultySet', 'showSushiSelect'])
        // ,
        changeCurrentMenu(menu){
            this.currentMenu = menu
        },
        routeMain(){
            this.$router.push('/main')
        },
        displayModal(){
            this.showExplain = !this.showExplain;
        },
    }
}
</script>

<style lang="scss">

#auth {
    height: 100vh;
	display: flex;
	flex-direction: column; 
    align-items: center;

    h1 {
        color: #842F00;
        font-size: 50px;
        font-family: Doppio One;
    }

    img {
        width: 200px;
        height: auto; 
    }
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

#content{
    z-index:2;
    width:50%;
    padding: 1em;
    background:#fff;
}


</style>