
<script>
// import { Bar } from 'vue-chartjs'
import { Doughnut, mixins} from 'vue-chartjs'
const { reactiveProp } = mixins

export default {
    extends: Doughnut,
    props: [
      "chartData", 
      // "datacollection",
      "options",
    ],
    mixins: [reactiveProp],
    mounted() {
      this.renderChart(this.chartData, this.options);
      // this.renderChart(this.datacollection, this.options);
    },
    methods:{
      updateChart(){
        this.renderChart(this.chartData, this.options);
        // this.renderChart(this.datacollection, this.options);
      }
    },
    watch: {
      props () {
        this.render(this.chartData, this.options)
      }
  },

}
</script>

<style>

</style>