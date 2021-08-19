<template>
  <div class="bl_standardContainer">
    <div class="el_priceStandard_text">基準値を入力して、OKボタンを押してください。</div>
    <div class="el_priceInputField">
      <input
      v-model="inputPrice"
      class="el_priceInput">
      <span>/円</span>  
    </div>
    <div class="el_explainBtnSlot">
      <slot name="explainBtn"></slot>
    </div>
  </div>
</template>

<script>

export default {
    components: {
    },
    data() {
      return {
        showExplain:false,
        inputPrice:"100"
      }
    },
    methods:{
        displayModal(){
          this.showExplain = !this.showExplain;
        },
    }

}
</script>

<style>
.bl_standardContainer{
    display: flex;
    justify-content: center;
    flex-direction: column;
    flex-flow: wrap;
    border-radius: 5px;
}

.el_priceInputField{
  display: flex;
  align-items: flex-end;
  justify-content: center;
  width: 100%;
  margin-top: 20px;
}

.el_priceInput{
  width: 150px;
  height: 30px;
  font-size: 20px;
}

.el_explainBtnSlot{
  margin: 20px;
}
</style>