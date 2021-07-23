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
      </div>
  </div>
</template>

<script>
export default {
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