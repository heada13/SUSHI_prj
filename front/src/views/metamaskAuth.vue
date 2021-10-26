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
        <!-- トークンmintボタン -->
        <v-btn @click="getToken">test</v-btn>
        <!-- <v-btn @click="soySauceAddCount">test1</v-btn> -->
        <!-- <v-btn @click="waterAddCount">test2</v-btn> -->
        
    </div>
</template>


<script>
// import Vue from 'vue'
// import { mapMutations } from 'vuex'
import StartMenu from '@/components/StartMenu.vue'
import StartButton from '@/components/StartButton.vue'
import ExplainGame from '@/components/ExplainGame.vue'
import web3js from '@/plugins/web3.js' 
import Artifacts from '../../build/contracts/SushiToken.json'
// const SushiCreate = contract(artifacts)
export default{
    name: "MetamaskAuth",
    components: {
        StartMenu,
        StartButton,
        ExplainGame,
        // Artifacts
    },
    data (){
        return {
            currentMenu: "StartMenu",
            showExplain: false,
            web3:web3js,
            contract:Artifacts,
            sushiContract:null,
            account:null,
            soySauceCount:0,
            waterCount:0
        }
    },
    async created() {
        // コンポーネントにimportした場合
        let accounts = await this.web3.eth.getAccounts();
        this.account = accounts[0];
        console.log(this.account,"account");

        // pluginからimportした場合
        // let accounts = await this.$web3.eth.getAccounts();
        // let account = accounts[0]
        // console.log(account,"account by plugin")

        // let accounts = await this.web3.eth.net.getId();
        

        // const sushiTokenAddress = "0xC433767C0C08B6Abc7cB45e09430AED9ed59b254";
        const sushiTokenAddress ="0xE44543D7fe0d7531F313762F17ca94aa15244Fd1"
        let sushiCreate = new web3js.eth.Contract(this.contract.abi, sushiTokenAddress);
        this.sushiContract = sushiCreate;
        // let account = accounts[0]
        console.log(sushiCreate,"sushi contract");
    },
    // mounted() {
    //     if (localStorage.soySauceCount) {
    //         this.soySauceCount = localStorage.soySauceCount;
    //     }
    //     if (localStorage.waterCount) {
    //         this.waterCount = localStorage.waterCount;
    //     }
        
    // },
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
        routeSetting(){
            this.$router.push('/setting')
        },

        displayModal(){
            this.showExplain = !this.showExplain;
        },

        getToken: async function(){
            // let ret = 
            await this.sushiContract.methods.createSushi(20210907,"aaaa")
                .send({from:this.account})
                .then(function(receipt){
                    console.log(receipt,"sucsess")
                })
                // function(error,result){
                    // console.log(result,"sucsess")
                // }
            // }
            // .then(function(value){
                // console.log(value,"getToken")
            // });
            // return ret
            // return this.sushiContract.methods.createSushi(0,20210907,0,"ddd","easy").call();
        },
        soySauceAddCount: function(){
            let addCount = this.soySauceCount++;
            localStorage.soySauceCount = addCount
        },
        waterAddCount: function(){
            let addCount = this.waterCount++;
            localStorage.waterCount = addCount
        }



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

.menuButton {
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