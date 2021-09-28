<template>
  <div class="bl_buttonLayout" :style="styles">
    <slot name="feedingItem">
      醤油か水
    </slot>
  </div>
</template>

<script>
export default {
  props:{
    backgroundColor:{
      type:String
    }
  },
  computed:{
    styles () {
      return {
        '--back-color': this.backgroundColor,
      }
    },
  }

}
</script>

<style>
:root {
  --back-color: white;
}

.bl_buttonLayout{
  display: flex;
  justify-content: center;
  align-items: center;
  height: 70px;
  width: 150px;
  margin:5px 20px;
  /* border-color: white; */
  background-color: var(--back-color);
  /* box-shadow: 0 10px 25px 0 rgba(0, 0, 0, .5); */
  box-shadow: 0 0 3px 0 rgba(0,0,0,.12), 0 2px 3px 0 rgba(0,0,0,.22);
	transition: .1s;
  border-radius: 50px;
  color:white;
  font-size: 30px;
  
}

@keyframes ripple {
  0% {
    opacity: 1;
    transform: scale(0.0);
  }
  100% {
    opacity: 0;
    transform: scale(1.0);
  }
}


.bl_buttonLayout:hover{
  box-shadow: 0 15px 30px -5px rgba(0,0,0,.15), 0 0 5px rgba(0,0,0,.1);
	transform: translateY(-4px);
}

.bl_buttonLayout:active{
  background-color: white;
  color: var(--back-color);
  animation: ripple 0.2s 1 ease-out;
}
</style>
