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
          <li class="a-pid item">分类</li>
          <li class="a-desc item">概述</li>
          <li class="a-time item">提交时间</li>
        </ul>
        <ul v-for="item in articleList" :key="`art${item.Id}`" class="detail clear">
          <li class="a-id item">{{ item.Id }}</li>
          <li class="a-title item">
            <router-link :to="`/updateArticle/${item.Id}`" exact :title="item.title">
              {{ item.title }}
            </router-link>
          </li>
          <li class="a-tag item" :title="item.tags">{{ item.tags }}</li>
          <li class="a-type item">{{ item.type }}</li>
          <li class="a-pid item">{{ item.pid }}</li>
          <li class="a-desc item" :title="item.description">{{ item.description }}</li>
          <li class="a-time item" :title="timeFormat(item.time)">{{ timeFormat(item.time) }}</li>
        </ul>
        <div class="control">
          <button>下一页</button>
          <button>上一页</button>
        </div>
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
      getArticleList(page){
        this.$axios.get(`${co}/articles/articleList?page=${page || 1}`)
            .then(resp=>{ this.articleList=resp.data })
      }
    },
    created(){
      this.getArticleList();
    },
    computed:{
      timeFormat(){ return (time)=> new Date(time).toLocaleString() }
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
    padding:0 5px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .title .item{
    height:40px;
    line-height: 40px;
  }
  .a-id{ width:5% }
  .a-title{ width:30% }
  .a-tag{ width:15% }
  .a-type{ width:6% }
  .a-pid{ width:6% }
  .a-desc{ width:25% }
  .a-time{ width:13% }
</style>
