<template>
  <div id="admin">
    <div class="header">
      <div class="home">
        <a href="" target="_blank" title="返回首页">
          <i class="fa fa-home"></i>
        </a>
        <span>后台管理系统</span>
      </div>
    </div>
    <div class="main">
      <div class="side">
        <SideMenu/>
      </div>
      <div class="container">
        <div class="wrapper">
          <router-view></router-view>
        </div>
      </div>
    </div>
    <Alert/>
  </div>
</template>

<script>
  import SideMenu from "./components/SideMenu";
  import Alert from "./components/Alert";
  export default {
    name: 'Admin',
    components:{ Alert, SideMenu },
  }
</script>

<style>
  @import "assets/css/font-awesome.min.css";
  @import "assets/css/public.css";
  @import "assets/css/admin.css";
</style>
