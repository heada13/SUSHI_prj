<template>
  <div class="br_easeAndBirth">
    <!-- <v-btn @click="getSushi">ボタン</v-btn> -->
    <div class="el_ease" :style="styles">
      {{sushiease}}
    </div>
    <!-- <v-btn @click="getSushiOwner">ボタン2</v-btn> -->
    <div class="el_birth">
      <div class="el_sinceBirth">生まれてから</div>
      <span class="el_aliveDay">
        {{calcAliveTime}}
      </span>
      <span class="el_date">日目</span>
    </div>
  </div>
</template>

<script>
import web3js from '@/plugins/web3.js' 
import Artifacts from '../../build/contracts/SushiToken.json'
export default {
  data (){
    return{
      web3:web3js,
      contract:Artifacts,
      stoken:null,
      sushiease:null,
      // caldtoken:null
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
    
    const sushiTokenAddress = "0xC433767C0C08B6Abc7cB45e09430AED9ed59b254";
    let sushiCreate = new web3js.eth.Contract(this.contract.abi, sushiTokenAddress);
    this.sushiContract = sushiCreate;
    // let account = accounts[0]
    console.log(sushiCreate,"sushi contract");
    await this.sushiContract.methods.sushis(0).call().then((sushi) => {
          this.stoken = sushi.birthTime;
          // console.log(sushi,"sushi token");
    });
    await this.sushiContract.methods.sushis(0).call().then((ease) => {
          this.sushiease = ease.difficulty;
          console.log(this.sushiease,"sushi ease");
    });
  },
  computed:{
    styles(){
      if(this.sushiease === "easy"){
        return {
          '--difficulty-color':'#28C700'
        }
      }
      else if(this.sushiease === "hard"){
        return {
          '--difficulty-color':'#FF5C00'
        }
      }
      else if(this.sushiease === "hell"){
        return {
          '--difficulty-color':'#CD0202'
        }
      }
      else{
        return {
          '--difficulty-color':'white'
        }
      }
    },
    calcAliveTime(){
      let calctoken = new Date(2021,8,7);
      // console.log(calctoken,"sushidate")
      let today = new Date();
      // let nowYear = today.getYear();
      // let nowMonth = today.getMonth();
      // let nowDay = today.getDate();
      // console.log(today,"today");
      let calcDay = Math.floor((today - calctoken)/86400000);
      console.log(calcDay,"calcday");
      return calcDay

    }

  },
  // methods:{
  //   getSushi: async function(){
  //       await this.sushiContract.methods.sushis(0).call().then((sushi) => {
  //         this.stoken = sushi.birthTime;
  //         console.log(sushi,"sushi token");
  //     })
  //     // console.log(token,"token")
  //   },
  //   getSushiOwner: async function(){
  //       // let abc = await this.sushiContract.methods["sushiIndexToOwner"](1).encodeABI();
  //       await this.sushiContract.methods.sushis(0).call().then((ease) => {
  //         this.sushiease = ease.difficulty;
  //         console.log(this.sushiease,"sushi ease");
  //       })
  //   }
  // }

}
</script>

<style>
:root{
  --difficulty-color:white;
}

.br_easeAndBirth{
  margin-left: 100px;
}

.el_ease{
  display: flex;
  justify-content: center;
  /* align-content: center; */
  vertical-align: text-bottom;
  color: white;
  /* padding: auto; */
  background-color: var(--difficulty-color);
  width: 150px;
  height: 60px;
  font-size: 30px;
  border-radius: 5px;
}

.el_sinceBirth{
  transform: translateY(10px);
}

.el_aliveDay{
  font-size: 50px;
}
.el_date{
  font-size: 30px;
}
</style>