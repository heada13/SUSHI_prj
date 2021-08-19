<template>
  <div class="bl_difficultyContainer">
    <div class="el_selectDifficulty_text">育成難易度を選択して、OKボタンを押してください。</div>
    <div class="el_diffList">
      <ul>
        <li 
        v-for="diff in difficulty" :key="diff.id">
          <label class="el_buttonLabel">
              <input
              type="radio"
              :value="diff.difficult"
              v-model="selectedDifficulty"
              class="el_radioButton">
              <span class="el_difficultytList" :style="{background:diff.color}">
                {{diff.difficult}}
              </span>
          </label>
        </li>
      </ul>
    </div>
    <div class="el_explainBtnSlot">
      <slot name="explainBtn"></slot>
    </div>
  </div>
</template>

<script>

export default {
  data() {
    return {
      difficulty:[
        {id:"1",difficult:"EASY",color:"#28C700"},
        {id:"2",difficult:"HARD",color:"#FF5C00"},
        {id:"3",difficult:"HELL",color:"#CD0202"},
      ],
      selectedDifficulty:"EASY"
    }
  }
}
</script>

<style>
.el_selectDifficulty_text{
  padding-top: 10px;
}
ul{
  list-style-type: none;
}

li{
  margin-top: 10px;
  position: relative;
}
.el_diffList{
  display: flex;
  padding-left: 45px;
}

.el_radioButton{
  transform: translateY(-8px);
}

.el_difficultytList{
  display:inline-block;
  justify-content: center;
  text-align: center;
  padding-top: 10px;
  margin-left: 10px;
  width: 150px;
  height: 50px;
  border-radius: 5px;
  font-size: 30px;
}

.el_explainBtnSlot{
  display: flex;
  justify-content: center;
}

</style>