import Vue from 'vue'
import Admin from './Admin'
import router from './router'
import axios from 'axios'

axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded';
Vue.prototype.$axios=axios;

router.beforeEach((to,from,next)=>{
  console.log(to,from);
  next();
})

new Vue({
  el: '#admin',
  router,
  components: { Admin },
  template: '<Admin/>'
});
