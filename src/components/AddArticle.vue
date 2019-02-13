<template>
  <div class="addArticle" v-if="navList.length">
    <h3 class="com-title">
      <i class="fa fa-file-o"></i>
      新增笔记
    </h3>
    <form>
      <div class="title at-item">
        <span><i style="color: red">*&nbsp;</i>标题：</span>
        <input type="text" placeholder="文章标题" v-model.lazy="title">
      </div>
      <div class="description at-item">
        <span>概述：</span>
        <textarea v-model.lazy="description"></textarea>
      </div>
      <div class="tags at-item">
        <span><i style="color: red">*&nbsp;</i>标签：</span>
        <input type="text" placeholder="文章标签，使用“，”隔开" v-model.lazy="tags">
      </div>
      <div class="thumbnail at-item">
        <span>缩略图：</span>
        <input type="file" accept="image/*">
      </div>
      <ul class="others at-item">
        <li class="others-title"><i style="color: red">*&nbsp;</i>其他：</li>
        <li class="pid">
          <select v-model="pid">
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
          <select v-model="type">
            <option value="def">类型</option>
            <option value="recommend">推荐</option>
            <option value="hot">热门</option>
            <option value="normal">普通</option>
          </select>
        </li>
      </ul>
      <div class="quillEditor">
        <span><i style="color: red">*&nbsp;</i>正文：</span>
        <quill-editor
            v-model="content"
            ref="editor"
            :options="editorOption">
        </quill-editor>
      </div>
      <div class="confirm">
        <button type="reset" @click="submitArticle"><!--@click="submitArticle"-->
          上传
        </button><button type="reset" @click="clearEditor">
          重置
        </button>
      </div>
    </form>
  </div>
</template>

<script>
  import { quillEditor } from 'vue-quill-editor';
  import 'quill/dist/quill.core.css';
  import 'quill/dist/quill.snow.css';
  import 'quill/dist/quill.bubble.css';
  import co from './coConfig';
  import qs from 'qs';
  export default {
    name: "AddArticle",
    components:{ quillEditor },
    data(){
      // 富文本编辑器配置
      const modules={
        toolbar:[
          ['bold','italic',{'align':[]},'underline','strike','image'],
          ['blockquote','code-block','link'],
          [{'header':[1,2,3,4,5,6,false]},{'font':[]},{'size':[]}],
          [{'color':[]},{'background':[]}]
        ]
      };
      return{
        editorOption:{ modules },
        content:'',
        title:'',
        description:'',
        tags:'',
        thumbnail:'',
        pid:'def',
        type:'def',
        navList:[]
      }
    },
    methods:{
      clearEditor(){ this.content='' },
      submitArticle(){
        let article=this.valueCheck();
        //console.log(article);
        if (article){
          this.$axios({
            url:`${co}/articles/addArticle`,
            method:'post',
            data:qs.stringify(article)
          }).then(resp=>{
            //console.log(resp);
            article=null;
            this.clearEditor();
          });
        }
      },
      getNavList(){
        this.$axios.get(`${co}/navs/navList`)
            .then(resp=>{
              //console.log(resp);
              this.navList=resp.data;
            });
      },
      valueCheck(){
        let title=this.title.replace(/\s/g,'');
        let desc=this.description.trim() || '暂无描述...';
        let tags=this.tags.replace(/\s/g,'');
        let thumbnail='';
        let pid=this.pid;
        let type=this.type;
        let content=this.content;
        let author='HSIKE';
        if (!title) {
          alert('文章标题不能为空！');
          return null;
        }
        if (!tags){
          alert('文章标签不能为空！');
          return null;
        }
        if (!pid || pid==='def'){
          alert('选择文章所属栏目！');
          return null;
        }
        if (!type || type==='def'){
          alert('选择文章类型！');
          return null;
        }
        if (!content) {
          alert('文章内容不能为空！');
          return null;
        }
        return { title, desc, tags, thumbnail, pid, type, content, author }
      }
    },
    created(){ this.getNavList(); }
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
  form{ padding:15px 20px; }
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
