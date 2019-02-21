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
        <span>缩略图：</span>
        <input type="file" accept="image/*">
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
            <option value="热门">热门</option>
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
      </button>
      </div>
    </div>
    <!--<Alert :showAlert="showAlert" @hideAlert="hideAlert($event)"
           :alertMsg="alertMsg"/>-->
  </div>
</template>

<script>
  import { quillEditor } from 'vue-quill-editor';
  import 'quill/dist/quill.core.css';
  import 'quill/dist/quill.snow.css';
  import co from './coConfig';
  import qs from 'qs';
  
  export default {
    name: "UpdataArticle",
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
        navList:[]
      }
    },
    methods:{
      submitArticle(){ // 提交文章
        let article=this.valueCheck();
        if (article){ // 排空处理
          this.$axios({
            url:`${co}/articles/updateArticle`,
            method:'post',
            data:qs.stringify(article),
          }).then(resp=>{
            console.log(resp.data);
            alert(resp.data);
            article=null;
          });
        }
      },
      getNavList(){ // 获取分类信息
        this.$axios.get(`${co}/navs/navList`)
            .then(resp=>{ this.navList=resp.data });
      },
      valueCheck(){ // 提交文章前数据检查，确保数据合法
        let title=this.article.title.replace(/\s/g,'');
        let description=this.article.description;
        let tags=this.article.tags.replace(/\s/g,'');
        let pid=this.article.pid;
        let type=this.article.type;
        let content=this.article.content;
        let alertMsg=[];
        if (!title) alertMsg.push('文章标题不能为空！')
        if(!description) alertMsg.push('文章描述不能为空！')
        if (!tags) alertMsg.push('文章标签不能为空！')
        if (pid==='def') alertMsg.push('选择文章所属栏目！')
        if (type==='def') alertMsg.push('选择文章类型！')
        if (!content) alertMsg.push('文章内容不能为空！');
        if (alertMsg.length){
          alert(alertMsg);
          return null;
        }
        return this.article;
      },
      getArticle(){
        this.$axios.get(`${co}/articles/getArticle?Id=${this.$route.params.Id}`)
            .then(resp=>{
              let art=resp.data;
              Array.isArray(art) ? this.article=art[0] : alert(art);
            })
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
