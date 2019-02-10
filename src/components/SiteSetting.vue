<template>
  <ul class="site" v-if="siteInfo">
    <li class="head">
      <h3><i class="fa fa-cog"></i>网站设置</h3>
    </li>
    <li class="item title">
      <span>网站标题:</span>
      <input type="text" v-model.lazy="siteInfo.title">
    </li>
    <li class="item keywords">
      <span>关键词:</span>
      <input type="text" v-model.lazy="siteInfo.keywords">
    </li>
    <li class="item description">
      <span>网站描述:</span>
      <textarea v-model.lazy="siteInfo.description"></textarea>
    </li>
    <li class="item icp">
      <span>ICP:</span>
      <input type="text" v-model.lazy="siteInfo.icp">
    </li>
    <li class="confirm">
      <button class="submit" type="button" @click="setSiteInfo">保存</button>
      <button class="cancel">取消</button>
    </li>
  </ul>
</template>

<script>
  import qs from 'qs';
  import config from './coConfig';
  export default {
    name: 'SiteSetting',
    data(){ return { siteInfo:null } },
    methods:{
      getSiteInfo(){
        this.$axios.get(`${config}/getSiteInfo`)
            .then(resp=>{ this.siteInfo=resp.data[0] })
      },
      setSiteInfo(){
        this.$axios({
          url:config+'/setSiteInfo',
          method:'post',
          data:qs.stringify(this.siteInfo),
        }).then(resp=>console.log(resp.data));
      }
    },
    created() {
      this.getSiteInfo();
    }
  }
</script>

<style scoped>
  @import "../assets/css/siteSetting.css";
</style>
