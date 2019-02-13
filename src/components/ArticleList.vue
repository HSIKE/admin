<template>
  <div class="ArticleList" v-if="articleList.length">
    <h3 class="com-title">
      <i class="fa fa-pencil-square-o"></i>
      文章列表
    </h3>
    <table class="list">
      <thead>
        <tr>
          <td>Id</td>
          <td>标题</td>
          <td>标签</td>
          <td>类型</td>
          <td>pid</td>
          <td>概述</td>
          <td>提交时间</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in articleList" :key="`art${item.Id}`">
          <td>{{ item.Id }}</td>
          <td>{{ item.title }}</td>
          <td>{{ item.tags }}</td>
          <td>{{ item.type }}</td>
          <td>{{ item.pid }}</td>
          <td>{{ item.description }}</td>
          <td>{{ timeFormat(item.time) }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
  import co from './coConfig'
  export default {
    name:"ArticleList",
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
      timeFormat(time){
        return ()=> {
          console.log(new Date(time).toLocaleString())
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
  }
  
</style>
