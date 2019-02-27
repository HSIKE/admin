<template>
  <div class="error">
    <div class="err-box">
      <p>
        对不起，<br/>
        您访问的页面不存在！
      </p>
      <button @click="$router.back()">返回之前页面</button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'ErrorPage'
  }
</script>

<style scoped>
  .error{
    height:100%;
    background: white;
    color:#888;
  }
  .err-box{
    text-align: center;
    position: relative;
    top:50%;
    left:50%;
    -webkit-transform: translate(-50%,-50%);
    -moz-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    -o-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
  }
  p{
    margin-bottom: 30px;
  }
  button{
    font-size: 15px;
    cursor: pointer;
    color:#099;
  }
  button:hover{
    color:darkorange;
  }
</style>
