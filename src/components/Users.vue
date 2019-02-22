<template>
  <div class="userList">
  
  </div>
</template>

<script>
  import co from './coConfig';
  export default {
    name: 'Users',
    data(){
      return{
        userList:[],
        page:1
      }
    },
    methods:{
      showAlert(msg){ this.$root.store.state.show.call(this.$root.store,msg) },
      getUserList(){
        this.$axios.get(`${co}/users/userList?page=${this.page}`)
            .then(resp=>{
              if(Array.isArray(resp.data)){
                this.userList=resp.data;
                if(resp.data.length===0) this.store.show('没有了...');
              }else this.store.show('服务器错误...');
            }).catch(err=> this.store.show(err));
      },
      nextPage(){
        if(this.userList.length<20) this.showAlert('没有更多了...');
        else{
          this.page++;
          this.getUserList();
        }
      },
      prevPage(){
        if(this.page===1) this.showAlert('已经是第一页了');
        else{
          this.page--;
          this.getUserList()
        }
      }
    },
    created(){
      //console.log(this.$root.getList);
      this.getUserList()
    }
  }
</script>

<style scoped>

</style>
