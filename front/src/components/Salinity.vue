<template>
  <div class="bl_salinityContainer">
    <div class="el_salinityTitle">
        塩分濃度
    </div>
    <div class="salinityPercentage">
        {{salinity}}
        <span class="persentage">%</span>
    </div>
  </div>
</template>

<script>
export default {
    props: {
        salinityValue: {
            type:String,
            default:"0"

        }
    },
    computed:{
        salinity(){
            return this.salinityValue
        }
    }

}
</script>

<style>
.bl_salinityContainer{
    display: flex;
    flex-direction: column;
    padding-left: 100px;
    -webkit-text-stroke: 1px #fff;
    font-weight: bold;
    /* transform: translateX(40%); */

}
.el_salinityTitle{
    color: black;
    /* font-size: 2rem; */
}
.salinityPercentage{
    /* font-size: 5rem; */
    font-size: 50px;
    transform: translateY(-10%);
}
.persentage{
    font-size: 30px;
    /* font-size: 3rem; */
}
</style>