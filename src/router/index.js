import Vue from 'vue'
import Router from 'vue-router'
import Content from "../components/Content";
import SiteSetting from '../components/SiteSetting';
import UserData from '../components/UserData';
import Password from '../components/Password';
import Users from '../components/Users';
import AddNav from "../components/AddNav";
import AddArticle from "../components/AddArticle";
import ArticleList from "../components/ArticleList";
import UpdateArticle from "../components/UpdateArticle";
import ErrorPage from '../components/ErrorPage';

Vue.use(Router);

export default new Router({
  mode:'history',
  base:'admin',
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
      path:'/userList',
      name:'users',
      component:Users
    },
    {
      path:'/addNav',
      name:'addNav',
      component:AddNav
    },
    {
      path:'/addArticle',
      name:'addArticle',
      component:AddArticle
    },
    {
      path:'/articleList',
      name:'articleList',
      component:ArticleList
    },
    {
      path:'/updateArticle/:Id',
      name:'updateArticle',
      component:UpdateArticle
    },
    {
      path:'*',
      name:'error',
      component:ErrorPage
    }
  ],
  linkActiveClass:'active',
  linkExactActiveClass:'ex-active',
})
