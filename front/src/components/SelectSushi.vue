<template>
  <div class="bl_sushiContainer">
    <div class="el_selectDifficulty_text">あなたのSUSHIを選んでください。</div>
    <div class="el_selectContainer">
      <div v-for="charactor in charactorData" :key="charactor.id" class="el_imageCardContainer">
        <!-- <div class="el_imageCardConatiner"> -->
          <div class="el_imageCard">
            <div class="el_imageRadioButton">
              <input type="radio">
            </div>
            <!-- /.el_imageRadioButton -->
            <div class="el_sushiImage">
              <img
              height="100px"
              :src="charactor.image">
            </div>
            <!-- /.el_sushiImage -->
          </div>
          <!-- /.el_imageCard -->
      </div>
      <!-- /.el_imageCardConatiner -->
    </div>
    <!-- /.el_selectContainer -->
  </div>
  <!-- /.bl_standardContainer -->
</template>

<script>
export default {
  data(){
    return{
      charactorData:[
        {id:"1",image:require("@/assets/sushi1.png")},
        {id:"2",image:require("@/assets/sushi2.png")},
        {id:"3",image:require("@/assets/sushi3.png")},
        {id:"4",image:require("@/assets/sushi4.png")},
      ]
    }
  }

}
</script>

<style>
.bl_sushiContainer{
  display: flex;
  flex-direction: column;
  align-items: center;
}
.el_selectContainer{
  width: 50%;
  display: flex;
  flex-wrap: wrap;
}
.el_imageCardContainer{
  padding: 10px;  
}
.el_imageCard{
  display: flex;
  flex-direction: column;
  background-color: #FFD98E;
  border-radius: 5px;
  width: 100px;
}
.el_imageRadioButton{
  display: flex;
  justify-content: center;
  margin-top: 10px;
}
.el_sushiImage{
  display: flex;
  justify-content: center;
}
</style>