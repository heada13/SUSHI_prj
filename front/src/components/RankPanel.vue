<template>
  <div class="bl_rankPanel">
    <div class="el_title">
      SUSHIランク
    </div>
    <div class="el_rank">
      {{passRank}}
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
      sushiContract:null,
      // rank:null,
      contract:Artifacts
    }
  },
  props:{
    'passRank': {
      type: String,
      // required: true
  }
},
  async created(){
    const sushiTokenAddress ="0xE44543D7fe0d7531F313762F17ca94aa15244Fd1"
    let sushiCreate = new web3js.eth.Contract(this.contract.abi, sushiTokenAddress);
    this.sushiContract = sushiCreate;

    this.sushiContract.methods.sushis(0).call().then((sushi) => {
      this.rank = sushi.sushiRank;
    });
  },
  mounted:function(){
    // this.sushiContract.methods.sushis(0).call().then((sushi) => {
    //   this.rank = sushi.sushiRank;
    // });
  }

}
</script>

<style>
.bl_rankPanel{
  margin-top: 5px;
  margin-left: 20px;
  width: 200px;
  display: flex;
  flex-direction: column;
  align-content: center;
}

.el_title{
  text-align: center;
  padding: 5px 0px;
  /* margin-left: 20px; */
  /* border: 1mm solid rgba(50, 220, 118, 0.6); */
  border-radius: 5px;
  background-color: rgba(50, 220, 118, 0.6);
  color: white;
}

.el_rank{
  text-align: center;
  font-size: 100px;
  /* width: 100px; */
  /* height: 100px; */
  /* background-color: tomato; */
}

</style>