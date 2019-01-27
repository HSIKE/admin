import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import config from '@/config'
//导入、在Vue中注册vuex
Vue.use(Vuex);

let store=new Vuex.Store({});

let getWebsite=()=>axios.get(`${config.server}/users/getInformation`),
    getTopNav=()=>axios.get(`${config.server}/api/getTopNav`);
axios.all([getWebsite(),getTopNav()])
    .then(axios.spread((website,topNavs)=>{
      //console.log(website);
      //console.log(topNavs);
      website.data.logo=
          `${config.server}/${website.data.logo.replace(/public\\/,'')}`;
      let state={
        websiteInfo:website.data,
        navInfo:topNavs.data
      };
      store.replaceState(state)
    }));
export default store;
