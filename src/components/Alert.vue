<template>
  <transition name="fade">
    <div class="alert" v-show="showAlert">
      <div class="box">
        <h4 class="title">提示</h4>
        <div class="con">
          提示内容
        </div>
        <div class="result">
          <button class="yes" @click="chooseYes">确定</button>
          <button class="no" @click="chooseNo">取消</button>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
  export default {
    name: 'Alert',
    props:['showAlert'],
    data(){
      return{
      }
    },
    methods:{
      chooseNo(){ this.$emit('hideAlert',false) },
      chooseYes(){ this.$emit('hideAlert',true) }
    }
  }
</script>

<style scoped>
  .alert{
    position: fixed;
    z-index: 2000;
    top:0;bottom:0;
    left:0;right:0;
    background: rgba(0, 0, 0, 0.19);
    opacity: 1;
    user-select: none;
  }
  .box{
    background:white;
    border-radius: 5px;
    position:absolute;
    width:400px;
    border:1px solid deepskyblue;
    top:50%;left:50%;
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    -o-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
  }
  .title{
    padding:0 20px;
    height:50px;
    line-height: 50px;
    color:deepskyblue;
    border-bottom: 1px solid deepskyblue;
  }
  .con{
    border-bottom: 1px solid deepskyblue;
    padding:15px 20px;
  }
  .result{
    text-align: right;
    padding:0 20px;
    height:40px;
    line-height: 40px;
  }
  button{
    height:24px;
    padding:0 10px;
    font-size: 14px;
    background: deepskyblue;
    color:white;
    border-radius: 3px;
    cursor: pointer;
    margin-left: 10px;
  }
  .fade-enter,
  .fade-leave-to{ opacity:0 }
  .fade-enter-active,
  .fade-leave-active{
    -webkit-transition: opacity .3s;
    -moz-transition: opacity .3s;
    -ms-transition: opacity .3s;
    -o-transition: opacity .3s;
    transition: opacity .3s;
  }
</style>
