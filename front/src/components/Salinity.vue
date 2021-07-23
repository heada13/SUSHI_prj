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
    /* transform: translateX(40%); */

}
.salinityPercentage{
    font-size: 5rem;
    transform: translateY(-10%);
}
.persentage{
    font-size: 3rem;
}
</style>