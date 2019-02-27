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
          <li class="a-pid item" :title="item.pid">{{ item.pid }}</li>
          <li class="a-desc item" :title="item.description">{{ item.description }}</li>
          <li class="a-time item" :title="timeFormat(item.time)">{{ timeFormat(item.time) }}</li>
        </ul>
        <div class="control">
          <button @click="prevPage">上一页</button>
          <span v-html="page"></span>
          <button @click="nextPage">下一页</button>
        </div>
      </div>
    </div>
  </keep-alive>
</template>

<script>
  export default {
    name:"ArticleList",
    data(){
      return{
        articleList:[],
        page:1,
      }
    },
    methods:{
      getArticleList(){
        this.$axios.get(`${this.$root.cors}/articles/allArticles?page=${this.page}`)
            .then(resp=>{
              let data=resp.data;
              if(Array.isArray(data)){
                if(data.length) this.articleList=resp.data;
                else this.showAlert('没有了');
              }else this.showAlert('服务器错误！');
            }).catch(err => this.showAlert(err));
      },
      showAlert(msg){ this.$root.store.show.call(this.$root.store,msg) },
      nextPage(){
        if(this.articleList.length<20) this.showAlert('没有了');
        else{
          this.page++;
          this.getArticleList()
        }
      },
      prevPage(){
        if(this.page===1) this.showAlert('已经是第一页了！');
        else{
          this.page--;
          this.getArticleList();
        }
      }
    },
    created(){ this.getArticleList() },
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
    padding:15px 20px 5px;
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
  .control{
    margin-top: 5px;
    padding:5px 0;
    font-size: 14px;
  }
  .control span{
    display: inline-block;
    margin:0 5px;
  }
</style>
