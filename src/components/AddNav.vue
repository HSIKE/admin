<template>
  <ul class="addNav">
    <li class="head">
      <h3><i class="fa fa-plus"></i>添加导航</h3>
    </li>
    <li class="item navName">
      <span>导航名称:</span>
      <input type="text">
    </li>
    <li class="item linkAdd">
      <span>链接地址:</span>
      <input type="text" placeholder="以'/'开头">
    </li>
    <li class="item keyword">
      <span>关键字:</span>
      <input type="text">
    </li>
    <li class="item navName">
      <span>分类:</span>
      <select>
        <option>顶层导航</option>
      </select>
    </li>
  </ul>
</template>

<script>
  export default {
    name: "AddNav"
  }
</script>

<style scoped>

</style>