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
                <img
                v-if="soyIsActive"
                class="soySaucePng" 
                src="@/assets/soysauce.png" 
                alt="soy">
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
                <RankPanel
                :passRank="rank"/>
            </div>
            <div class="ly_command">
                <!-- <EAB/> -->
                <div @click="soySauceButtonClick('soy')">
                    <Feeding
                    :background-color="soySauceBackgroundColor">
                        <template v-slot:feedingItem>
                            醤油
                        </template>
                    </Feeding>
                </div>
                <div @click="waterButtonClick('water')">
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
import RankPanel from '@/components/RankPanel.vue'
import web3js from '@/plugins/web3.js' 
import Artifacts from '../../build/contracts/SushiToken.json'


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
            web3:web3js,
            account:null,
            contract:Artifacts,
            sushiContract:null,
            rank:null,
            // soySauceButton:true,
            // waterButton:true,
            buttonActive:true
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
        RankPanel,
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
        Counter: function(feed){
            // 醤油カウントをインクリする前に、醤油＋水＝合計の条件を満たしているかチェック
            if(this.buttonActive){
                if( this.soySauceCount + this.waterCount < this.totalCount ){
                    if(feed=='soy'){
                        this.soySauceCount++;
                        localStorage.setItem('soySauceCount', this.soySauceCount);
                    }else if(feed=='water'){
                        this.waterCount++;
                        localStorage.setItem('soySauceCount', this.waterCount);
                    }
                    // localStorage.soySauceCount = this.soySauceCount;
                    // localStorage.setItem('soySauceCount', this.soySauceCount);
                    
                    console.log("soy count!!")
                }else{
                    //進化時は醤油ボタンをロックする
                    this.buttonActive = false;
                    this.evolution();
                    console.log("not count!!")             
                }
                // console.log(localStorage.soySauceCount,"soy count")
            }else{
                console.log("button false")
            }
        },
        soySauceflashTrigger: function(){
            this.$refs.child1.flash();
        },
        waterflashTrigger: function(){
            this.$refs.child2.flash();
        },
        soySauceButtonClick: function(feed){
            this.soySauceflashTrigger();
            this.Counter(feed);
            this.soyFeedAction();
        },
        waterButtonClick: function(feed){
            this.waterflashTrigger();
            this.Counter(feed);
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
        waterFeedAction: function(){
            this.waterIsActive = !this.waterIsActive;
        },
        resetCounter: function(){
            this.soySauceCount = 0;
            localStorage.setItem('soySauceCount', this.soySauceCount);
            this.waterCount = 0;
            localStorage.setItem('waterCount',this.waterCount);
        },
        testArweave:function(){
            //アドレスを動的に変更できるようにする
            this.sushiContract.methods.tokenURI(0).call().then((res) => {
                console.log(res,"sushiImgURL res")
                console.log(typeof(res),"sushiImgURL types")
                return res
                // return String(res)
                // fetch('https://arweave.net/JOlCyl8iljqCNxuDHdX-E5yNns73gU0pSn_oEcSHal0').
            }).then((data) => {
                // let tmpdata = 'https://arweave.net/JOlCyl8iljqCNxuDHdX-E5yNns73gU0pSn_oEcSHal0'
                // let tmpdata = data
                console.log(data,"data")
                // console.log(tmpdata,"tmpdata")
                fetch(data).
                then((response)=> {
                    console.log("arweave",response)
                    return response.blob();
                    
                }).then(blob => {
                    const url = (window.URL || window.webkitURL).createObjectURL(blob)
                    this.arweaveimg = url;
                });
            })

            
        },
        evolution: async function(){
            var comp = this;
            this.sushiContract.methods.evoloveSushi("maguro","bbbb")
            .send({from:this.account})
                .then(function(receipt){
                    console.log(receipt,"evolve sucsess")
                })
                .then(function(resolve){
                    // 進化処理後にカウンターをリセット
                    comp.resetCounter();

                    // 進化処理後にsushiランクを再取得
                    comp.getSushiRank();

                    // 進化処理後にsushiイメージを再取得
                    comp.testArweave();
                    console.log(resolve);
                })
                .then(function(resolve){
                    // 進化処理の最後に、ボタンのロックを解除 
                    comp.buttonActive = true;
                    console.log(resolve);
                })
                .catch(function(e){
                    // トランザクション中断でボタンをアンロック
                    comp.buttonActive = true;
                    console.log(e,"e");
                })
        },
        getSushiRank:function(){
            this.sushiContract.methods.sushis(0).call().then((sushi) => {
                this.rank = sushi.sushiRank;
            });
        },

    },
    async created() {
        let accounts = await this.web3.eth.getAccounts();
        this.account = accounts[0];
        const sushiTokenAddress ="0xE44543D7fe0d7531F313762F17ca94aa15244Fd1"
        let sushiCreate = new web3js.eth.Contract(this.contract.abi, sushiTokenAddress);
        this.sushiContract = sushiCreate;
        await this.testArweave();
        await this.getSushiRank();
        
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
    /* background-color: teal; */
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