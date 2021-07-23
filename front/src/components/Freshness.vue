<template>
  <div class="bl_hpContainer">
      <div class="el_hpText">
          鮮度{{currentHp}}/100
      </div>
      <div class="el_hpGage">
          <div class="el_currentHp" :style="styles">
          </div>
      </div>
  </div>
</template>

<script>
export default {
    name: "Freshness",
    data (){
        return{
            scale:0.75,
        }
    },
    computed: {
        styles () {
            return {
                '--hpp-scale': this.scale,
            }
        },
        currentHp(){
            let cHp = this.scale*100
            return cHp

        }
    }

}
</script>

<style>
:root {
  --hpp-scale: 0;
}

.bl_hpContainer{
    display: flex;
    flex-direction: column;
    box-sizing: border-box;
    margin: 30px 100px 0 100px;
    border-radius: 10px;
    height: 70%;
    width: 80%;
    background-color: rgb(211, 211, 211);
    align-content: center;
    justify-content: center;
    position: relative;

}
.el_hpGage{
    display: flex;
    position: relative  ;
    /* top: 20%; */
    left: 20px;
    width: 95%;
    /* transform: translateY(-30%); */
    height: 80px;
    margin-bottom: 10px;
    background-color: white;
    border-radius: 50px;
    overflow: hidden;
    align-content: center;

}
.el_currentHp{
    width: 100%;
    animation: hpGage 1s;
    animation-fill-mode: forwards;
    background-color: white;
    height: 100%;
    left: 0;
    position: relative;
}
@keyframes hpGage {
  from {
      /* background-color: white; */
      transform: scaleX(0);
      transform-origin: left;
      }
  to {
      background-color: rgb(55, 231, 99);
      transform: scaleX(var(--hpp-scale));
      transform-origin: left;
      }
}
.el_hpText{
    width: 100%;
    padding-left: 50px;
}
</style>