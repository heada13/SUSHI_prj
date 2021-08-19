<template>
  <div class="el_priceContainer">
      <div class="el_basePrice">
        <span class="el_basePriceTitle">
            基準値
        </span>
        <span class="el_basePriceValue">{{basePrice}}</span>
      </div>
      <div class="el_marketPrice">
          <span class="el_marketPriceTitle">
              市況
          </span>
          <span class="el_marketPriceValue">{{marketPrice}}</span>
          <span>{{tableData}}</span>
      </div>
  </div>
</template>

<script>
// const axiosBase = require('axios').create()
// import axios from 'axios'
// const axios = axiosBase({
//   baseURL: 'http://127.0.0.1:5000/', // バックエンドB のURL:port を指定する
//   headers: {
//     'Content-Type': 'application/json',
//     'X-Requested-With': 'XMLHttpRequest'
//   },
//   responseType: 'json'  
// }); 
export default {
    data () {
        return {
        tableData: null,
        selectedCoin:'bitcoin'
        }
    },
    props:{
        basePriceValue:{
            type:String,
            default:"0"
        },
        marketPriceValue:{
            type:String,
            default:"0"
        }
    },
    computed:{
        basePrice(){
            return this.basePriceValue
        },
        marketPrice(){
            return this.marketPriceValue
        }
    },
    mounted () {
        this.updataTableData()
    },
    methods: {
        updataTableData: function () {
            this.$axios.get('/main/'+this.selectedCoin)
            .then(response => (this.tableData = response.data))
            .catch(error => console.log(error))
        }
            // this.tableData = response.data
    }

}
</script>

<style>
.el_priceContainer{
    display: flex;
    flex-direction: column;
}
.el_basePrice{
    height: 30%;
}
.el_marketPrice{
    height: 70%;
}

</style>