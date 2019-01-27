import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'

axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded';
Vue.prototype.$axios=axios;

new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
});
