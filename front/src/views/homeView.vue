<template>
    <div class="homeView">
        <h1>main</h1>
    </div>
</template>

<script>
import Vue from 'vue'
export default Vue.extend({
    name: 'homeView'
})
</script>

<style scoped>

.homeView {
    height: 100vh;
	display: flex;
	flex-direction: column; 
    align-items: center;
}

</style>