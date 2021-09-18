<template>
    <div class="ly_homeViewContainer">
        <div class="ly_status hp_padding">
            <Status/>
        </div>
        <div class="ly_main hp_padding">
            <img src="../assets/SUSHI.png" alt="sushi">
        </div>
        <div class="ly_command hp_padding">
            <EAB/>
        </div>
    </div>
</template>

<script>
import Vue from 'vue'
import Status from '@/components/Status.vue'
import EAB from '@/components/EaseAndBirth.vue'

export default Vue.extend({
    name: 'HomeView',
    components: {
        Status,
        EAB
    }
})
</script>

<style scoped>

.ly_homeViewContainer {
    height: 100%;
    width: 100%;
	display: flex;
	flex-direction: column; 
    /* align-items: center; */
}
.ly_status{
    height: 30%;
    /* width: 100%; */
}
.ly_main{
    display: flex;
    align-content: center;
    justify-content: center;
    /* width: 100%; */
    height: 40%;
}
.ly_command{
    width: 100%;
    height: 30%;
}
.hp_padding{
    padding-right: 20px;
    padding-left: 20px;
}
</style>