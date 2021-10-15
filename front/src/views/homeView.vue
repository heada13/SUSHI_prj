<template>
    <div class="ly_homeViewContainer">
        <div class="ly_status hp_padding">
            <SoySauceCounterPanel
            :panel-data="soySauceCount"
            :background-color="soySauceBackgroundColor"
            ref="child1"/>
            <WaterCounterPanel
            :panel-data="waterCount"
            :background-color="waterBackgroundColor"
            ref="child2"/> 
        </div>
        <div class="ly_main hp_padding">
            <transition v-on:enter="soyenter">
            <!-- <div v-if="soyIsActive"> -->
                <img
                v-if="soyIsActive"
                class="soySaucePng" 
                src="@/assets/soysauce.png" 
                alt="soy">
            <!-- </div> -->
            </transition>
            <!-- <div v-if="waterIsActive"> -->
            <transition v-on:enter="waterenter">
                <img
                v-if="waterIsActive"
                class="waterPng" 
                src="@/assets/water.png" 
                alt="water">
            </transition>
            <!-- </div> -->
            <div class="el_sushiImage">
                <img
                :src="arweaveimg"
                alt="sushi"
                />
            </div>
        </div>
        <div class="el_footer">
            <div class="el_sushiRank">

            </div>
            <div class="ly_command">
                <!-- <EAB/> -->
                <div @click="soySauceButtonClick">
                    <Feeding
                    :background-color="soySauceBackgroundColor">
                        <template v-slot:feedingItem>
                            醤油
                        </template>
                    </Feeding>
                </div>
                <div @click="waterButtonClick">
                    <Feeding
                    :background-color="waterBackgroundColor">
                        <template v-slot:feedingItem>
                            水
                        </template>
                    </Feeding>  
                </div>
            </div>
        </div>
    </div>
</template>

<script>
// import EAB from '@/components/EaseAndBirth.vue'
// import Chart from '@/components/Chart.vue'
import Feeding from '@/components/FeedingButton.vue'
import SoySauceCounterPanel from '@/components/SoySauceCounterPanel.vue'
import WaterCounterPanel from '@/components/WaterCounterPanel.vue'
// import Arweave from 'arweave';
const velocity = require('velocity-animate')

export default {
    name: 'HomeView',
    data() {
        return {
            soySauceCount:0,
            waterCount:0,
            totalCount:10,
            soySauceBackgroundColor:'#842F00',
            waterBackgroundColor:'#8DBAFF',
            arweaveimg:"",
            soyIsActive:false,
            waterIsActive:false,
            soyInterval: null,
            waterInterval: null,
            // datacollection: null,
            // chartItems: {
            //     // labels: [
            //     //     'Red',
            //     //     'Blue',
            //     //     'Yellow'
            //     // ],
            //     datasets: [{
            //         label: 'My First Dataset',
            //         data: [
            //             0,
            //             0,
            //             10
            //         ],
            //         backgroundColor: [
            //         'rgb(255, 99, 132)',
            //         'rgb(54, 162, 235)',
            //         'rgb(255, 205, 86)'
            //         ],
            //         hoverOffset: 3,
            //         borderWidth: 1,
            //         aspectRatio:1
            //     }]
            // },
            // chartOptions: {
            //     maintainAspectRatio: false,
            //     responsive:true,
            //     rotation: -1.0 * Math.PI,
            //     circumference: Math.PI,
            // }   
        }
    },

    components: {
        // Status,
        // EAB
        // Chart,
        Feeding,
        // CounterPanel,
        SoySauceCounterPanel,
        WaterCounterPanel,
    },
    beforeMount(){
        // 画面表示時にlocalstorageから醤油と水のカウントを取得
        // なければストレージを作る
        if(localStorage.soySauceCount){
            this.soySauceCount = Number(localStorage.soySauceCount);
        }
        else{
            localStorage.soySauceCount = 0;
        }

        if(localStorage.waterCount){
            this.waterCount = Number(localStorage.waterCount);
        }
        else{
            localStorage.waterCount = 0;
        }
    },
    methods:{
        // beforeEnter: function (el) {
        //     el.style.opacity = 0
        //     el.style.transformOrigin = 'left'
        // },
        // enter: function (el, done) {
        //     velocity(el, { opacity: 1, fontSize: '1.4em' }, { duration: 300 })
        //     velocity(el, { fontSize: '1em' }, { complete: done })
        // },
        soyenter: function (el) {
            velocity(el,{
                duration:100,
                translateY: '200px',
                // opacity: 0
            });
            if(this.soyIsActive){
                this.soyIsActive = !this.soyIsActive;
            }
            // if(this.waterIsActive){
            // this.waterIsActive = !this.waterIsActive
            // }
        },
        waterenter: function (el) {
            velocity(el,{
                duration:100,
                translateY: '200px',
                // opacity: 0
            });
            if(this.waterIsActive){
                this.waterIsActive = !this.waterIsActive;
            }
        },
        // fillData() {
        //     this.datacollection = {
        //         // chartItems: {
        //         // labels: [
        //         //     'Red',
        //         //     'Blue',
        //         //     'Yellow'
        //         // ],
        //         datasets: [{
        //             label: 'My First Dataset',
        //             data: [
        //                 this.getSoyCount(),
        //                 this.getWaterCount(),
        //                 10
        //             ],
        //             backgroundColor: [
        //             'rgb(255, 99, 132)',
        //             'rgb(54, 162, 235)',
        //             'rgb(255, 205, 86)'
        //             ],
        //             hoverOffset: 3,
        //             borderWidth: 1,
        //             aspectRatio:1
        //         }],
        //         // chartOptions: {
        //         //     maintainAspectRatio: false,
        //         //     responsive:true,
        //         //     rotation: -1.0 * Math.PI,
        //         //     circumference: Math.PI,
        //         // }   
        //     }
        // },
        soySauceCounter: function(){
            // 醤油カウントをインクリする前に、醤油＋水＝合計の条件を満たしているかチェック
            if( this.soySauceCount + this.waterCount < this.totalCount ){
                this.soySauceCount++;
                localStorage.soySauceCount = this.soySauceCount;
                console.log("soy count!!")
            }else{
                console.log("not count!!")                
            }
            console.log(localStorage.soySauceCount,"soy count")
        },
        waterCounter: function(){
            if(this.soySauceCount + this.waterCount < this.totalCount){
                this.waterCount++;
                localStorage.waterCount = this.waterCount;
                console.log("water count!!")
            }
            console.log(localStorage.waterCount,"water count")
        },
        soySauceflashTrigger: function(){
            this.$refs.child1.flash();
        },
        waterflashTrigger: function(){
            this.$refs.child2.flash();
        },
        soySauceButtonClick: function(){
            this.soySauceflashTrigger();
            this.soySauceCounter();
            this.soyFeedAction();
        },
        waterButtonClick: function(){
            this.waterflashTrigger();
            this.waterCounter();
            this.waterFeedAction();
        },
        soyFeedAction: function(){
            this.soyIsActive = !this.soyIsActive;
            // this.soyInterval=setInterval(() => {
            //     // animation stop
            //     this.soyIsActive = false
            //     // clear interval
            //     clearInterval(this.soyInterval)
            //     this.soyInterval = null
            // }, 700)
        },
        // waterFeedAction: function(){
        //     this.waterIsActive = true;
        //     setInterval(() => {
        //         // animation stop
        //         this.waterIsActive = false
        //         // clear interval
        //         // clearInterval(this.waterInterval)
        //         this.waterInterval = null
        //     }, 700)
        // },
        waterFeedAction: function(){
            this.waterIsActive = !this.waterIsActive;
        },
        // ...mapMutations({
        //     click: 'click' // `this.click()`にマッピングされます
        // })
        testArweave:function(){
            fetch('https://arweave.net/JOlCyl8iljqCNxuDHdX-E5yNns73gU0pSn_oEcSHal0').
            then((res)=> {
                console.log("arweave",res)
                return res.blob();
                
            }).then(blob => {
                const url = (window.URL || window.webkitURL).createObjectURL(blob)
                this.arweaveimg = url;
            });
            // const Arweave = require('arweave');
            // console.log("Arweave",Arweave)
            // const arweave = Arweave.init({
                // host: 'localhost',
                // port: 8080,
                // protocol: 'http'
                // host: 'arweave.net',
                // port: 443,
                // protocol: 'https'
            // });
            // arweave.transactions.getStatus('bNbA3TEQVL60xlgCcqdz4ZPHFZ711cZ3hmkpGttDt_U').then(res => {
            // console.log(res);
            // })
            // console.log(arweave)
        },
    },
    async created() {
        await this.testArweave();
        // fetch('https://arweave.net/JOlCyl8iljqCNxuDHdX-E5yNns73gU0pSn_oEcSHal0').
        //     then((res)=> {
        //         console.log("arweave",res)
        //         return res.blob();
                
        //     }).then(blob => {
        //         const url = (window.URL || window.webkitURL).createObjectURL(blob)
        //         this.arweaveimg = url;
        //     });
        // const Arweave = require('arweave');
        // const arweave = Arweave.init({
        //     host: '192.168.2.105',
        //     port: 1984,
        //     protocol: 'http'
        // });
        // // arweave.transactions.getStatus('bNbA3TEQVL60xlgCcqdz4ZPHFZ711cZ3hmkpGttDt_U').then(res => {
        // // console.log(res);
        // // })
        // console.log("arweave",arweave)
        // if (localStorage.soySauceCount) {
            // this.chartItems.datasets[0].data[0] = localStorage.soySauceCount;
        // }
        // if (localStorage.waterCount) {
            // this.chartItems.datasets[0].data[1] = localStorage.waterCount;
        // }
        // tokenのランクを読み取り、ランクに応じてtotalCountを変更する
        // this.sushiContract.methods.sushis(0).call().then((sushi) => {
            // this.stoken = sushi.birthTime;
        // console.log(sushi,"sushi token");
        // });

        // 画面表示時にlocalstorageから醤油と水のカウントを取得
        // this.soySauceCount = localStorage.soySauceCount;
        // this.waterCount = localStorage.waterCount;
    },
    // watch: {
    //     soySauceCount(newName) {
    //         localStorage.soySauceCount = newName;
    //     }
    // }
        
}
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
    display: flex;
    justify-content: center;
    flex-direction: column;
    position: relative;
    height: 30%;
    /* padding-top: 10px; */
    /* padding-right: 50px; */
    /* width: 100%; */
}

.ly_main{
    display: flex;
    align-content: center;
    justify-content: center;
    /* width: 100%; */
    height: 40%;
    position: relative;
}

.el_sushiRank{
    width: 30%;
    /* height: 100%; */
    background-color: teal;
}

.ly_command{
    display: flex;
    justify-content: center;
    flex-direction: row;
    width: 70%;
    /* height: 30%; */
}

.hp_padding{
    padding-right: 20px;
    padding-left: 20px;
}

.el_footer{
    display: flex;
    flex-direction: row;
    height: 30%;
}

.soySaucePng{
    position: absolute;
    right: 47%;
    height: 100px;
}

.waterPng{
    position: absolute;
    right: 47%;
    height: 100px;
    /* width: 100px; */
    /* visibility:hidden; */
    /* transform: translateX(200px); */
    /* animation-name: example; */
    /* animation-duration: 1s; */
}

img{
    height: 300px;
}

</style>