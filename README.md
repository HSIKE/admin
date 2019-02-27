网站后台管理界面

基于 Vue-cli 3.0

安装使用的模块：

        axios v0.18.0
        qs v6.6.0
        quill v1.3.6
        vue-quill-editor v3.0.6
        vue-router v3.0.1
        
webpack打包配置项的修改：

1、 /config/index.js:

        index: path.resolve(__dirname, '../admin/index.html'),
        assetsRoot: path.resolve(__dirname, '../admin'),
        assetsSubDirectory: 'static',
        assetsPublicPath: '/admin/',   

2、 /build/utils.js 的 cssLoaders:

        if (options.extract) {
          return ExtractTextPlugin.extract({
            use: loaders,
            fallback: 'vue-style-loader',
            // 增加下面这行
            publicPath:'../../'
          })
        } else {
          return ['vue-style-loader'].concat(loaders)
        }

最终打包生成项目根目录下的 admin 文件夹，将整个文件夹拷贝到后台的public文件夹下
