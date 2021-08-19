<template>
    <div class="md_modal">
        <div class="bl_settingMenu">
            <div class="el_settingComponent">
                <PriceStandard
                v-if="settingStatus==0">
                    <template v-slot:explainBtn>
                        <div @click="displayModal()">
                            <ExplainButton>
                                <template v-slot:explainBtnText>
                                基準値とは
                                </template>
                            </ExplainButton>
                        </div>
                    </template>
                </PriceStandard>
                <SelectDifficulty
                v-if="settingStatus==1">
                    <template v-slot:explainBtn>
                        <div @click="displayModal()">
                            <ExplainButton>
                                <template v-slot:explainBtnText>
                                難易度とは
                                </template>
                            </ExplainButton>
                        </div>
                    </template>
                </SelectDifficulty>
                <SelectSushi
                v-if="settingStatus==2"/>
            </div>
            <div class="el_nextButton" @click="nextSetting">
                <OkButton/>
            </div>
        </div>
        <!-- <div class="el_explain"> -->
            <ExplainGame
            v-show="showExplain"
            :display-modal="displayModal"/>
        <!-- </div> -->
    </div>
</template>

<script>
import PriceStandard from '@/components/PriceStandard.vue'
import SelectDifficulty from '@/components/SelectDifficulty.vue'
import SelectSushi from '@/components/SelectSushi.vue'
import ExplainButton from '@/components/ExplainButton.vue'
import ExplainGame from '@/components/ExplainGame.vue'
import OkButton from '@/components/OkButton.vue'


export default {
    name:"InitialSetting",
    components:{
        PriceStandard,
        SelectDifficulty,
        SelectSushi,
        ExplainButton,
        ExplainGame,
        OkButton
    },
    data (){
        return {
            settingStatus: 0,
            showExplain:false,
        }
    },
    methods:{
        nextSetting(){
            if(this.settingStatus<2){
                this.settingStatus++;
            }
        },
        displayModal(){
            this.showExplain = !this.showExplain;
        },

    }

}
</script>

<style>
.md_modal{
    display: flex;
    justify-content: center;
    position: fixed;
    z-index: 9998;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5) !important;
    /* display: table; */
    transition: opacity 0.3s ease;
}
.bl_settingMenu{
    display: flex;
    justify-content: center;
    flex-direction: column;
    height: 50vh;
    /* min-height: 300px; */
    width: 500px;
    background-color: #DBFFD6;
    /* align-content: space-around; */
    margin-top: 100px;
    border-radius: 5px;
}
.el_settingComponent{
    display: flex;
    justify-content: center;
    /* border-radius: 5px; */
}
.el_nextButton{
    display: flex;
    justify-content: center;
    margin-top: 20px;
}
</style>