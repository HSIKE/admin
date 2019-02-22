import Vue from 'vue'
import Admin from './Admin'
import router from './router'
import axios from 'axios'

axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded';
Vue.prototype.$axios=axios;

const store={
  disabled:Boolean(localStorage.getItem('alertDisabled')) || false,// 是否被禁用
  state:{
    isShow:false, // 是否显示
    alertMsg:[], // 弹窗警告内容
    count:0 // 显示次数，判断是否提示用户禁用弹窗
  },
  show(msg){ // 显示
    if(!this.disabled){
      this.state.isShow=true;
      this.state.count++;
      if(msg)
        Array.isArray(msg)
        ? this.state.alertMsg.concat(msg)
        : this.state.alertMsg.push(msg);
      if(this.state.count >= 3)
        this.state.alertMsg.push('','<span style="color:darkorange">↓↓↓ 觉得这个提示很烦？点击永久关闭可以禁用</span>')
    }
  },
  hide(){ this.state.isShow=false }, // 隐藏
  reset(){ this.state.alertMsg=[] }, // 清空
  off(){ // 禁用
    this.state.isShow=false;
    setTimeout(()=>{ this.state.alertMsg=[] },500);
    this.disabled=true;
    localStorage.setItem('alertDisabled','true');
  }
};

new Vue({
  el: '#admin',
  router,
  data:{ store },
  components: { Admin },
  template: '<Admin/>'
});
