<template>
  <div class="bl_explainButtonContainer">
    <div class="el_buttonName">
      <slot name="explainBtnText">設定説明ボタン</slot>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>
.bl_explainButtonContainer{
  display: flex;
  justify-content: center;
  width: 200px;
  /* align-content: center; */
  margin-top: 10px;
  background-color: transparent;
  border-radius: 5px;
  border: 1px solid #28C700;
  color: #28C700;
}
.el_buttonName{
  padding: 10px 30px;
  /* height: 40px; */
}
</style>