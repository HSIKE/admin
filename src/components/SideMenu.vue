<template>
  <div class="side-menu">
    <h3 class="head">网站配置</h3>
    <ul class="list">
      <li class="item">
        <div class="title" @click="toggleFold($event)">
          <span class="icon">
            <i class="fa fa-cogs" aria-hidden="true"></i>
          </span>设置
        </div>
        <ul class="links">
          <router-link class="link" to="/website" tag="li">
            站点设置
          </router-link>
          <li class="links-item">
            <div class="title" @click="toggleFold($event)">
              用户设置
            </div>
            <router-link class="link" to="/user" tag="div">
              基本资料
            </router-link>
            <router-link class="link" to="/password" tag="div">
              修改密码
            </router-link>
          </li>
        </ul>
      </li>
      <li class="item">
        <router-link class="title" to="/users" tag="div">
          <span class="icon">
            <i class="fa fa-users"></i>
          </span>用户管理
        </router-link>
      </li>
      <li class="item">
        <div class="title" @click="toggleFold($event)">
          <span class="icon">
            <i class="fa fa-th"></i>
          </span>网站导航
        </div>
        <ul class="links">
          <router-link class="link" to="/navList" tag="li">
            导航列表
          </router-link>
          <router-link class="link" to="/addNav" tag="li">
            添加导航
          </router-link>
        </ul>
      </li>
      <li class="item">
        <div class="title" @click="toggleFold($event)">
          <span class="icon">
            <i class="fa fa-files-o"></i>
          </span>我的笔记
        </div>
        <ul class="links">
          <router-link class="link" to="/articles" tag="li">
            笔记管理
          </router-link>
          <router-link class="link" to="/addArticle" tag="li">
            新增笔记
          </router-link>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script>
  export default {
    name:"SideMenu",
    methods:{
      toggleFold(e){e.target.parentElement.classList.toggle('open')},
    }
  }
</script>

<style scoped>
  @import "../assets/css/side-menu.css";
</style>
