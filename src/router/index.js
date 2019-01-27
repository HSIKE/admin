import Vue from 'vue'
import Router from 'vue-router'
import Content from "../components/Content";
import SiteSetting from '../components/SiteSetting';
import UserData from '../components/UserData';
import Password from '../components/Password';
import Users from '../components/Users';

Vue.use(Router);

export default new Router({
  mode:'history',
  routes: [
    {
      path:'/',
      name:'home',
      component:Content
    },
    {
      path:'/website',
      name:'siteSetting',
      component:SiteSetting
    },
    {
      path:'/user',
      name:'userData',
      component:UserData
    },
    {
      path:'/password',
      name:'password',
      component:Password
    },
    {
      path:'/users',
      name:'users',
      component:Users
    }
  ],
  linkActiveClass:'active',
  linkExactActiveClass:'ex-active'
})
