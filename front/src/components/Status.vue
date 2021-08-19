<template>
 <div class="bl_status">
   <div class="bl_freshness">
      <Freshness/>
   </div>
   <div class="bl_salinity">
     <Salinity/>
   </div>
   <div class="bl_price">
     <Price/>
   </div>
    
 </div>
   
</template>

<script>
import Freshness from '@/components/Freshness.vue'
import Salinity from '@/components/Salinity.vue'
import Price from '@/components/Price.vue'

export default {
    components:{
        Freshness,
        Salinity,
        Price
    }

}
</script>

<style>
.bl_status{
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  height: 100%;
  width: 100%;
  position: static;
  /* background: rgb(134, 127, 127); */
  /* justify-content: center; */
  /* align-content: center; */
}

.bl_freshness{
  width: 100%;
  /* height: 40%; */
  /* display: flex; */
  /* align-content: center; */
}
.bl_salinity{
  width: 30%;

}
.bl_price{
  width: 70%;
  background-color: rgb(223, 142, 20);
}
</style>