<template>
    <v-container>
        <v-row>
            <v-col>
                <div class="button">
                    <button class="menuButton" @click="goHome">続きから</button>
                </div>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <div>
                    <button class="menuButton">最初から</button>
                </div>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
// import HomeView from '@/views/HomeView.vue'

export default {
    name:"StartButton",
    components:{
        // HomeView
    },
    date(){
        return{

        }
    },
    methods:{
        goHome: function(){
            this.$router.push('/main')
        }
    }

}
</script>

<style>
.button{
    padding-bottom: 20px;
}


</style>