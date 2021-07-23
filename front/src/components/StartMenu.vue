<template>
    <div class="menuButton">
        スタート
    </div>
</template>

<script>
export default {
    props:{
        changeHeight: {
            type:Function
        }
    },
    methods:{
        changeCurrentMenu(){
            return "StartButton"
        }
    }

}
</script>

<style>

.startButton {
    width: 250px;
    height: 100px;
    border-color: #842F00;
    border-radius: 5px;
    font-size: 50px;
    color: #842F00;
    background-color : hsl(40, 100%, 78%);
}

</style>