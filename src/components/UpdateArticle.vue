<template>
  <div class="addArticle" v-if="article">
    <h3 class="com-title">
      <i class="fa fa-file-o"></i>
      笔记修改
    </h3>
    <div class="content">
      <div class="title at-item">
        <span><i style="color: red">*&nbsp;</i>标题：</span>
        <input type="text" placeholder="文章标题" v-model.lazy="article.title">
      </div>
      <div class="description at-item">
        <span>概述：</span>
        <textarea v-model.lazy="article.description"></textarea>
      </div>
      <div class="tags at-item">
        <span><i style="color: red">*&nbsp;</i>标签：</span>
        <input type="text" placeholder="文章标签，使用“、”隔开" v-model.lazy="article.tags">
      </div>
      <div class="thumbnail at-item">
        <span><i style="color: red">*&nbsp;</i>封面：</span>
        <select v-model="cover">
          <option value="def">选择封面</option>
          <option value="css">css</option>
          <option value="css_1">css_1</option>
          <option value="css3">css3</option>
          <option value="css3_1">css3_1</option>
          <option value="js">js</option>
          <option value="es6">es6</option>
          <option value="es5-es6">es5-es6</option>
          <option value="html">html</option>
          <option value="html5">html5</option>
          <option value="jQuery">jQuery</option>
          <option value="vue">Vue</option>
          <option value="react">React</option>
          <option value="angular">Angular</option>
          <option value="node">node</option>
          <option value="npm">npm</option>
          <option value="mysql">mysql</option>
        </select>
        <img :src="getCover">
      </div>
      <ul class="others at-item">
        <li class="others-title"><i style="color: red">*&nbsp;</i>其他：</li>
        <li class="pid">
          <select v-model="article.pid">
            <option value="def">所属栏目</option>
            <option v-for="nav in navList"
                :key="`nav${nav.Id}`"
                :value="nav.value"
                v-if="nav.value"
                v-text="nav.navName">
            </option>
          </select>
        </li>
        <li class="type">
          <select v-model="article.type">
            <option value="def">类型</option>
            <option value="推荐">推荐</option>
            <option value="普通">普通</option>
          </select>
        </li>
      </ul>
      <div class="quillEditor">
        <span><i style="color: red">*&nbsp;</i>正文：</span>
        <quillEditor
            v-model="article.content"
            ref="editor"
            :options="editorOption">
        </quillEditor>
      </div>
      <div class="confirm">
        <button @click="submitArticle">上传
        </button><button @click="delArticle(article.Id)">删除</button>
      </div>
    </div>
  </div>
</template>

<script>
  import { quillEditor } from 'vue-quill-editor';
  import 'quill/dist/quill.core.css';
  import 'quill/dist/quill.snow.css';
  import qs from 'qs';
  
  export default {
    name: "UpdateArticle",
    components:{ quillEditor },
    data(){
      // 富文本编辑器配置
      const modules={
        toolbar:[
          ['bold','italic',{'align':[]},'underline','strike','image'],
          ['blockquote','code-block','link'],
          [{'list':'ordered'},{'list':'bullet'}],
          [{'header':[1,2,3,4,5,6,false]},{'font':[]},{'size':[]}],
          [{'color':[]},{'background':[]}]
        ]
      };
      return{
        editorOption:{ modules },
        article:null,
        navList:[],
        cover:'def'
      }
    },
    computed:{
      getCover(){ return `http://47.100.12.224/img/covers/${this.cover}.jpg` }
    },
    methods:{
      showAlert(msg){ this.$root.store.show.call(this.$root.store,msg) },
      submitArticle(){ // 提交文章
        let article=this.valueCheck();
        if (article){ // 排空处理
          this.$axios({
            url:`${this.$root.cors}/articles/updateArticle`,
            method:'post',
            data:qs.stringify(Object.assign(article,{cover:this.getCover})),
          }).then(resp=>{
            let data=resp.data;
            this.showAlert((typeof data)==='string' ? data : '数据库访问出错，检查后台接口配置');
            article=null;
          }).catch(err=>this.showAlert('可能是服务器定期重启，稍后再试'));
        }
      },
      getNavList(){ // 获取分类信息
        this.$axios.get(`${this.$root.cors}/navs/navList`)
            .then(resp=>{
              let data=resp.data;
              if(Array.isArray(data)) this.navList=data;
              else this.showAlert('天啦，出bug啦，赶紧点那边的联系方式让人来修吧~')
            }).catch(err => this.showAlert('可能是服务器正在定期重启，等下刷新试试？'));
      },
      delArticle(Id){
        this.$axios({
          url:`${this.$root.cors}/articles/delArticle`,
          method: 'post',
          data: qs.stringify({ Id })
        }).then(resp=>{
          if((typeof resp.data)==='string'){
            this.showAlert(resp.data);
            this.$router.push('/articleList')
          }else this.showAlert('数据库访问出错，检查后台接口配置');
        }).catch(err=> this.showAlert('可能是服务器定期重启，稍后再试'))
      },
      valueCheck(){ // 提交文章前数据检查，确保数据合法
        let title=this.article.title.replace(/\s/g,'');
        let description=this.article.description;
        let tags=this.article.tags.replace(/\s/g,'');
        let cover=this.article.cover;
        let pid=this.article.pid;
        let type=this.article.type;
        let content=this.article.content;
        let alertMsg=[];
        if (!title) alertMsg.push('文章标题不能为空！');
        if(!description) alertMsg.push('文章描述不能为空！');
        if (!tags) alertMsg.push('文章标签不能为空！');
        if(cover==='def') alertMsg.push('封面不能为空');
        if (pid==='def') alertMsg.push('选择文章所属栏目！');
        if (type==='def') alertMsg.push('选择文章类型！');
        if (!content) alertMsg.push('文章内容不能为空！');
        if (alertMsg.length){
          this.showAlert(alertMsg);
          return null;
        }
        return this.article;
      },
      getArticle(){
        console.log(this.$root.cors);
        this.$axios.get(`${this.$root.cors}/articles/getArticle?Id=${this.$route.params.Id}`)
            .then(resp=>{
              let art=resp.data;
              if(Array.isArray(art)){
                if(art.length){
                  this.article=art[0];
                  this.cover=
                      art[0].cover
                      ? art[0].cover.replace('http://47.100.12.224/img/covers/','').replace('.jpg','')
                      : 'def'
                }
              }
                // art.length ? this.article=art[0] : this.showAlert('未查找到相关文章');
              else this.showAlert('数据库访问出错，检查后台接口配置');
            }).catch(err => this.showAlert('可能是服务器定期重启，稍后再试'));
      }
    },
    created(){
      this.getNavList();
      this.getArticle();
    }
  }
</script>

<style scoped>
  .addArticle{ background: white; }
  .com-title{
    height:40px;
    line-height: 40px;
    border-bottom: 1px solid #e3e3e3;
    padding:0 10px;
  }
  .com-title i{ margin-right: 10px; }
  .content{ padding:15px 20px; }
  .at-item{ margin-bottom: 20px }
  .at-item span{
    display: inline-block;
    vertical-align: top;
    height:40px;
    line-height: 40px;
    width:30%;
    text-align: right;
  }
  .at-item input{
    margin:5px 10px;
    height:30px;
    padding:0 10px;
    font-size: 14px;
    border:1px solid #e3e3e3;
    width:40%;
    color:#666;
  }
  .at-item input::-webkit-input-placeholder{
    font-size: 12px;
    color:#999;
  }
  .at-item input:focus{ border-color: deepskyblue }
  .at-item textarea{
    margin-left:10px;
    border:1px solid #e3e3e3;
    width:40%;
    padding:5px 10px;
    height:60px;
    line-height: 20px;
    color:#666;
  }
  .at-item textarea:focus{ border-color: deepskyblue; }
  .thumbnail{
    position: relative;
  }
  .thumbnail select{
    width:40%;
    text-align: center;
    text-align-last: center;
    height:30px;
    margin:5px 10px;
    border:1px solid #e3e3e3;
  }
  .thumbnail img{
    position: absolute;
    right: 5%;
    width:20%;
    max-width: 200px;
    z-index: 1000;
  }
  .others li{
    display: inline-block;
    vertical-align: top;
  }
  .others-title{
    width:30%;
    text-align: right;
  }
  .others li{ height:40px; }
  .pid,.type{
    width:20%;
    margin-left: 10px;
    border:1px solid #e3e3e3;
  }
  .pid select,.type select{
    width:100%;
    text-align: center;
    text-align-last: center;
    height: 100%;
  }
  .quillEditor{
    padding:0 5%;
    max-width: 1000px;
    margin:0 auto 20px;
  }
  .quillEditor span{
    display: block;
    margin-bottom: 10px;
  }
  .confirm{ text-align: center; }
  .confirm button{
    height: 30px;
    background: #009999;
    color:white;
    padding:0 15px;
    margin-right: 15px;
    cursor: pointer;
    border-radius: 3px;
  }
  .confirm button:active{
    background: #00a6a6;
    color: #ededed;
  }
</style>
