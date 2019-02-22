<template>
  <transition name="fade" appear>
    <div class="alert" v-if="isShow">
      <div class="alert-con">
        <div class="msgs">
          <p v-for="(msg,index) in alertMsg" :key="`msg${index}`"
              v-html="`${msg}`"></p>
        </div>
        <div class="close clear">
          <button class="disable" @click="off" v-if="turnOff">永久关闭</button>
          <button class="ok" @click="iKnow">我知道了</button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  export default {
    name:"Alert",
    computed:{
      isShow(){ return this.$root.store.state.isShow },
      alertMsg(){ return this.$root.store.state.alertMsg },
      turnOff(){ return this.$root.store.state.count >= 3 }
    },
    methods:{
      iKnow(){
        this.$root.store.hide.call(this.$root.store);
        setTimeout(()=>{
          this.$root.store.reset.call(this.$root.store)
        },500)
      },
      off(){ this.$root.store.off.call(this.$root.store) }
    }
  }
</script>

<style scoped>
  .alert{
    z-index: 3000;
    position: fixed;
    top:0;bottom:0;
    left:0;right:0;
    background: rgba(0, 0, 0, 0.09);
    cursor: default;
    color:#009999;
  }
  .alert-con{
    position: absolute;
    width:360px;
    opacity: 1;
    background: white;
    top:50%;left:50%;
    /*border:1px solid #0080ad;*/
    -webkit-box-shadow: 0 0 5px 1px rgba(0, 133, 255, 0.18);
    -moz-box-shadow: 0 0 5px 1px rgba(0, 133, 255, 0.18);
    box-shadow: 0 0 5px 1px rgba(0, 133, 255, 0.18);
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    -o-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
  }
  
  .msgs{
    font-size: 15px;
    line-height: 1;
    padding:10px 15px 0;
  }
  .msgs p{ padding:5px 0 }
  .close{
    height:30px;
    padding:3px 15px;
  }
  .close button{
    font-size: 14px;
    height:24px;
    padding:0 5px;
    cursor: pointer;
    color:#009999;
  }
  .close .disable{
    float: left;
    color:darkorange;
  }
  .close .disable:hover{ color:red }
  .close .ok{ float:right }
  .fade-enter,.fade-leave-to{
    opacity: 0;
  }
  .fade-enter-active,.fade-leave-active{
    -webkit-transition: opacity 0.5s;
    -moz-transition: opacity 0.5s;
    -ms-transition: opacity 0.5s;
    -o-transition: opacity 0.5s;
    transition: opacity 0.5s;
  }
</style>
