<template>
  <div class="el_waterCounte" :style="styles">
      <span class="el_counterText">水をあげた回数</span>
      <span class="el_counter">{{panelData}}</span>
      <span class="el_counterText">回</span>
  </div>
</template>

<script>
import { gsap,Power3 } from 'gsap'

export default {
  props:{
    panelData:{
      type:Number
    },
    backgroundColor:{
      type:String
    },
  },
  computed:{
    styles () {
      return {
        '--back-color': this.backgroundColor,
      }
    }
  },
  methods: { // アニメーションの宣言はここ
    flash () {
        gsap.fromTo(
          '.el_waterCounte', 
          {
            opacity:0,
            // x:0,
            // width:"50%",
            backgroundColor:"#transparent", 
            ease:Power3.easeOut
            // backgroundColor:"rgba(255, 0, 0, 0.2)",
          },
          {
            opacity:1,
            // x:0,
            // width:"100%",
            backgroundColor:this.backgroundColor,
            duration:1
          })
        console.log("flash!")
    },
  }

}
</script>

<style>
:root {
  --back-color: white;
}

.el_waterCounte{
    display: flex;
    align-items: center;
    margin: 10px 10px;
    width: 90%;
    height: 100px;
    border: 3px solid;
    border-color: var(--back-color);
    background-color: var(--back-color);
    /* border: 4px solid; */
    /* border-image: linear-gradient(to right, var(--back-color) 0%, white 100%); */
    /* border-image-slice: 1; */
    /* background: linear-gradient(0deg,var(--back-color),white); */
    border-radius:10px;
    position: relative;
    /* animation: ripple 0.2s 1 ease-out; */
}

.el_counterText{
    font-size: 30px;
    transform: translateY(13px);
}

.el_counter{
    padding-right: 5px;
    padding-left: 20px;
    font-size: 70px;
}

</style>