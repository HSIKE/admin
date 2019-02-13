<template>
  <keep-alive>
    <div class="ArticleList" v-if="articleList.length">
      <h3 class="com-title">
        <i class="fa fa-pencil-square-o"></i>
        笔记列表
      </h3>
      <div class="list">
        <ul class="title clear">
          <li class="a-id item">Id</li>
          <li class="a-title item">标题</li>
          <li class="a-tag item">标签</li>
          <li class="a-type item">类型</li>
          <li class="a-pid item">pid</li>
          <li class="a-desc item">概述</li>
          <li class="a-time item">提交时间</li>
        </ul>
        <ul v-for="item in articleList" :key="`art${item.Id}`" class="detail clear">
          <li class="a-id item">{{ item.Id }}</li>
          <li class="a-title item">
            <router-link :to="`/updateArticle/${item.Id}`" exact>
              {{ item.title }}
            </router-link>
          </li>
          <li class="a-tag item">{{ item.tags }}</li>
          <li class="a-type item">{{ item.type }}</li>
          <li class="a-pid item">{{ item.pid }}</li>
          <li class="a-desc item">{{ item.description }}</li>
          <li class="a-time item">{{ timeFormat(item.time) }}</li>
        </ul>
      </div>
    </div>
  </keep-alive>
</template>

<script>
  import co from './coConfig'
  import Alert from './Alert';
  export default {
    name:"ArticleList",
    components: {Alert},
    data(){
      return{
        articleList:[]
      }
    },
    methods:{
      getArticleList(){
        this.$axios.get(`${co}/articles/articleList`)
            .then(resp=>{ this.articleList=resp.data })
      }
    },
    created(){
      this.getArticleList();
      console.log(new Date("2019-02-13T07:37:16.000Z").toLocaleString());
    },
    computed:{
      timeFormat(){
        return (time)=> {
          console.log(time);
          return new Date(time).toLocaleString()
        }
      }
    }
  }
</script>

<style scoped>
  .ArticleList{ background: white; }
  .com-title{
    height:40px;
    line-height: 40px;
    border-bottom: 1px solid #e3e3e3;
    padding:0 10px;
  }
  .com-title i{ margin-right: 10px; }
  .list{
    padding:15px 20px;
    width:100%;
    text-align: center;
  }
  .title,.detail{
    border-bottom: 1px solid #e3e3e3;
    border-left: 1px solid #e3e3e3;
  }
  .title{ border-top: 1px solid #e3e3e3 }
  .item{
    float: left;
    height:30px;
    line-height: 30px;
    border-right: 1px solid #e3e3e3;
    padding:0 10px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .title .item{
    height:40px;
    line-height: 40px;
  }
  .a-id{ width:6% }
  .a-title{ width:30% }
  .a-tag{ width:14% }
  .a-type{ width:10% }
  .a-pid{ width: 10% }
  .a-desc{ width:15% }
  .a-time{ width:15% }
</style>
