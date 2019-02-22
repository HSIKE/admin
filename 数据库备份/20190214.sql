# Host: 127.0.0.1  (Version 5.0.87-community-nt)
# Date: 2019-02-14 17:28:33
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "articles"
#

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `Id` int(11) NOT NULL auto_increment,
  `type` varchar(255) default NULL COMMENT '文章类型（推荐？）',
  `pid` varchar(255) default NULL COMMENT '所属分类(导航)',
  `author` varchar(255) default NULL COMMENT '作者',
  `title` varchar(255) default NULL COMMENT '文章标题',
  `description` varchar(10000) default '' COMMENT '文章描述',
  `tags` varchar(255) default NULL COMMENT '文章标签',
  `thumbnail` varchar(255) default NULL COMMENT '缩略图',
  `content` longtext COMMENT '文章内容',
  `time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章';

#
# Data for table "articles"
#

INSERT INTO `articles` VALUES (1,'推荐','js','HSIKE','test','test des','te','test ava','test con','2019-02-14 09:42:00'),(2,'推荐','js','HSIKE','sss',NULL,'sss','','<p>ssss</p>','2019-02-14 09:10:22'),(3,'推荐','css','HSIKE','CSS选择器优先级',NULL,'css，选择器，优先级','','<p>内容不重要，以后可以改</p>','2019-02-14 09:10:25'),(4,'普通','css','HSIKE','标签类型、盒子模型即边界重叠','HTML中的标签类型与其对应的盒子模型以及特殊情况下的边界重叠现象','html、盒子模型、css、标签','','<blockquote><strong class=\"ql-size-large\">HTML标签类型</strong></blockquote><p><br></p><p><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\">根据标签在文档中的位置特性可将元素（标签）分为三类：</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">1、</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\" class=\"ql-size-large\">块级元素（block）：可以设定宽高，默认宽度为父元素宽度；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">2、</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\" class=\"ql-size-large\">行内元素（inline）：宽高由标签所包含的内容决定，设置无效，默认为0；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">3、</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\" class=\"ql-size-large\">行级块元素（inline-block）：</span><span style=\"background-color: rgb(255, 255, 255); font-size: 19.5px; color: rgb(68, 68, 68);\">也称块级行元素，默认宽高由内容决定，但也可设置；</span></p><p><br></p><p>\t<span class=\"ql-size-large\">块级元素在文档中会独占一整行（一行只能显示一个块级元素），即使其内容宽度小于标签宽度，而行内元素和行级块元素在内容 宽度小于标签宽度时，多个这种元素会并排在同一行显示。</span></p><p><br></p><p>\t<span class=\"ql-size-large\">标签可以通过设定样式 { display: block / inline / inline-block } 转化为指定类型，将行级块元素转换为块级元素之后，其将独占一行但默认宽度不会变（有内容尺寸决定）；而将行内元素转换为块级元素后，其显示效果将与普通块级元素一致。</span></p><p><br></p><blockquote><strong class=\"ql-size-large\">标签盒子模型：</strong></blockquote><p>\t<em class=\"ql-size-large\" style=\"color: rgb(136, 136, 136);\">HTML标签本身为一个容器，可被理解为一个盒子，在文档中具有分层结构 ，即盒子模型</em></p><p><br></p><p><span class=\"ql-size-large\">一、盒子分层，标签盒子从内到外可分为4层：</span></p><p><br></p><p><span class=\"ql-size-large\">\t</span>\t<span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">1、内容 content：</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\" class=\"ql-size-large\">存放标签内容的区域，标签的宽高即 content 尺寸；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span>\t<span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68);\" class=\"ql-size-large\">2、内边距 padding：也叫内补白，在内容层与边框层之间增加隔离区域，控制内容层与边框层之间的距离（可以没有边框）；</span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">\t\t\t  </span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">\t</span>\t<span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">3、边框 border：设置标签四周的边框  { border:边框粗细 显示类型 颜色 } （样式值顺序不固定）   某些标签自带边框，如：input、button等</span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">   \t\t显示类型 ：solid 实线   dotted 圆点虚线  dashed 矩形虚线；</span></p><p><br></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">\t</span>\t<span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">4、外边距 margin：也叫外补白，在边框外增加隔离区域，用来控制当前标签与周围内容的间距。</span></p><p><br></p><p>\t\t<span style=\"background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">设置</span><span class=\"ql-size-large\">行内元素的padding-top、padding-bottom时，元素盒子中存在这些样式，但显示效果不会发生变化（与文档中上下文行框重叠）；而行内元素的 margin-top、margin-bottom 则无法设置，这些样式不会存在与元素盒子中。</span></p><p><br></p><p><span class=\"ql-size-large\">二、盒子类型 box-sizing，盒子类型有2种：</span></p><p><br></p><p>\t\t<span class=\"ql-size-large\">1、IE盒模型 border-box：标签设定</span><span style=\"background-color: rgb(255, 255, 255); font-size: 19.5px;\">的</span> <span class=\"ql-size-large\">width / height 包含 border、padding 以及 content；标签同时设置了（或默认包含）width / height、border、padding，会压缩 content 的尺寸以保持其在文档中所占空间与 width / height 一致；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">2、</span><span style=\"background-color: rgb(255, 255, 255); color: rgb(68, 68, 68); font-size: 19.5px;\">标准盒模型 content-box：</span><span style=\"background-color: rgb(255, 255, 255); font-size: 19.5px;\">width / height 仅包含 content；标签同时包含 width / height、border、padding时，其在文档中所占据的空间会比 width / height 大；</span></p><p><br></p><h5><span style=\"background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">如：</span></h5><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;input type=\"text\" placeholder=\"输入框\"&gt;&lt;!-- input默认为标准盒模型 --&gt;\n&lt;button type=\"button\"&gt;按钮&lt;/button&gt;&lt;!-- button默认为IE盒模型 --&gt;\n</pre><h5><span class=\"ql-size-large\">对2个标签设定同样的样式：</span></h5><pre class=\"ql-syntax\" spellcheck=\"false\">input,button{\n  width:200px;\n  height:100px;\n}\n/* 2个标签设置的高度都为100px，但显示效果为 input 比 button 高 */\n</pre><p><br></p><blockquote><strong class=\"ql-size-large\">边界重叠</strong></blockquote><p><br></p><p><span class=\"ql-size-large\">1、父子标签边界重叠：</span></p><p>\t<span class=\"ql-size-large\">父标签与子标签都在同一垂直方向上设定 margin 且父标签未在该方向上设定 padding 和 border 时，就会发生margin重叠现象，将取所设的 margin 值中较大的一个作为整体的 margin 。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"parent\"&gt;\n  &lt;div class=\"child\"&gt;&lt;/div&gt;\n&lt;/div&gt;\n</pre><h4>设置样式：</h4><pre class=\"ql-syntax\" spellcheck=\"false\">.parent{\n  width:500px;\n  height:500px;\n  background-color:red;\n}\n.child{\n  width:200px;\n  height:200px;\n  background-color:green;\n  margin-top:100px;\n}\n</pre><p>\t<span class=\"ql-size-large\">child 的 margin-top 本应该让 child 在距离 parent 顶部 100px 的位置显示，而实际情况是 parent 和 child 的顶部重合在一起，child “拖着” parent 一起向下移动了100px，这是因为 parent 顶部未设置任何 “阻挡”，使得父子标签的顶部边界重合在了一起。若要实现预期的效果，可以设置 parent 的 border-top、padding-top 阻止边界重叠。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">2、兄弟标签边界重叠：</span></p><p><span class=\"ql-size-large\">\t2个兄弟关系（相邻）的标签在垂直方向上设定的 margin 发生了相遇（一个 margin-bottom、一个 margin-top）且2个标签中间无内容或者没有高度的空标签时，将会发生边界重叠，重叠后取2个标签设定的 margin 值中较大的一个作为2个标签间的距离。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"box1\"&gt;&lt;/div&gt;\n&lt;div class=\"box2\"&gt;&lt;/div&gt;\n</pre><h4>样式：</h4><pre class=\"ql-syntax\" spellcheck=\"false\">.box1 {\n    background:red;\n    width:400px;\n    height:400px;\n    /* box1下边距50像素 */\n    margin-bottom:50px;\n}\n.box2 {\n    background:green;\n    width:300px;\n    height:300px;\n    /* box2上边距100像素 */\n    margin-top:100px;\n}\n/* box1下边距50px box2上边距100px，中间间距本应为150px，而实际发生边界重叠只取较大的100px */\n</pre><p>\t<span class=\"ql-size-large\">此时可以在2个标签中间增加一个 { height: 1px } 的空块级元素，或者将需要间隔的距离设置到一个标签的某个方向上。</span></p><p>\t</p><p><br></p><p><br></p>','2019-02-14 13:28:55'),(5,'普通','css','HSIKE','CSS选择器的简单使用','css中常用的一些选择器的简单用法','css、选择器','','<blockquote><strong class=\"ql-size-large\">CSS选择器</strong></blockquote><p><em style=\"color: rgb(136, 136, 136); background-color: rgb(253, 252, 248);\" class=\"ql-size-large\">在 CSS 中，选择器是一种模式，用于选择需要添加样式的元素。</em></p><p><br></p><p><br></p><blockquote><strong class=\"ql-size-large\" style=\"background-color: rgb(253, 252, 248);\">常用选择器</strong></blockquote><p><br></p><p><strong class=\"ql-size-large\">CSS中常用的选择器有：</strong></p><p><br></p><p><span class=\"ql-size-large\">1、标签选择器：使用标签名选择文档中元素</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">p{ color:red }\ndiv{ font-size: 20px }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">把文档中所有 p 标签的文字颜色设为 red，所有 div 的字体大小设为 20px。</span></p><p><br></p><p><span class=\"ql-size-large\">2、类</span><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255);\">（class）</span><span class=\"ql-size-large\">选择器（.className）：通过</span><span style=\"background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">标签设置的类名选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"red\"&gt;div with a className \"red\"&lt;/div&gt;\n&lt;p class=\"red\"&gt;p with a className \"red\"&lt;/p&gt;\n\n.red{ color:red }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">把文档中所有含有 “red” 类名的标签（与标签名称无关）中文字的颜色设为 red。</span></p><p><br></p><p><span class=\"ql-size-large\">3、id选择器（#id）：通过标签设置的 id 选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div id=\"div\"&gt;div with id \"div\"&lt;/div&gt;\n\n#div{ height:200px; background: red }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">将文档中 id 为 “div” 的标签高度设为 200px，背景颜色设为 red。</span></p><p>\t<span class=\"ql-font-serif ql-size-large\">注意：在 css 中，id 为唯一标识，因此不能为多个标签设置同一个 id。</span></p><p><br></p><p><span class=\"ql-size-large\">4、属性选择器（[propName=\"propValue\"]）：通过标签的属性选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div prop=\"pro\"&gt;test div&lt;/div&gt;\n&lt;p prop=\"pro\"&gt;test p&lt;/p&gt;\n\n[prop=\"pro\"]{ color:red }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">div、p标签中的文字颜色将被设为 red。</span></p><p>\t<span class=\"ql-size-large ql-font-serif\">注：class、id 也是标签的属性，因此</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">.className{ style } / #id{ style }   也可以写成  [class=\"className\"]{ style } / [id=\"id\"]{ style }\n</pre><p><br></p><p><span class=\"ql-size-large\">5、伪类选择器（:state）：选择处于某种状态的标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;input type=\"text\"&gt;\n&lt;button&gt;button&lt;/button&gt;\n\n:focus{ border:5px solid red }\n:active{ color:green }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">:focus 选择处于 “获得焦点” 状态的标签，:active 选择处于 “激活” 状态（被点击时）的标签，并为其设置样式，但一般只有表单元素及锚（a）标签才有这些状态。</span></p><p><br></p><p><span class=\"ql-size-large\">6、通配符选择器（*）：选择文档中所有的标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;p&gt; p &lt;/p&gt;\n&lt;a href=\"#\"&gt; a &lt;/a&gt;\n&lt;p class=\"p2\"&gt; another p &lt;/p&gt;\n\n*{ color:green }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">页面中所有标签的字体颜色都将被设置为 green。</span></p><p><br></p><p><span class=\"ql-size-large\">7、子代与后代选择器：选择嵌套标签中的子代或者后代标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"div\"&gt;\n  &lt;div class=\"test\"&gt;\n    &lt;div&gt; child div &lt;/div&gt;\n  &lt;/div&gt;\n&lt;/div&gt;\n        \n.div&gt;div{ border-top:5px solid red }\n.div div{ border-bottom:10px solid green } \n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">selector1&gt;selector2  选择 selector1 内的 selector2 标签，但 selector2 必须直接嵌套在 selector1 下，.div&gt;div 只会给 .test 设置顶部边框，而 .div div 将会为 .div 内部嵌套的所有 div设置底边框。</span></p><p><br></p><p><span class=\"ql-size-large\">8、选择器组合使用：使用多种选择器选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"txt\"&gt; test div &lt;/div&gt;\n&lt;p class=\"txt\"&gt; test p &lt;/div&gt;\n&lt;p class=\"txt\"&gt;\n  &lt;div class=\"txt&gt; another p &lt;/div&gt;\n&lt;/p&gt;\n&lt;div class=\"parent\"&gt;\n  &lt;div class=\"child\"&gt; child div &lt;/div&gt;\n  &lt;p class=\"child\"&gt; child p &lt;/p&gt;\n&lt;/div&gt;\n\n\np.txt{ border:5px solid red }\np .txt{ color:red }\n\n.parent p.child{ color: green }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">p.txt （无空格）选择的是 类名中包含 “txt” 的 p 标签，而 p .txt （有空格）选择的是 嵌套 在 </span><span style=\"background-color: rgb(255, 255, 255); font-family: Georgia, &quot;Times New Roman&quot;, serif; font-size: 19.5px;\">p 标签内且</span><span class=\"ql-size-large ql-font-serif\">类名中包含 “txt” 的后代标签</span></p><p><br></p><p><span class=\"ql-size-large\">使用css选择器为文档中标签设置样式时，要注意选择器的优先级引起的样式覆盖！</span></p><p><br></p>','2019-02-14 15:11:05');

#
# Structure for table "comments"
#

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `Id` int(11) NOT NULL auto_increment,
  `pid` varchar(255) default NULL COMMENT '所属文章的Id',
  `userName` varchar(255) default NULL COMMENT '用户名',
  `email` varchar(255) default NULL COMMENT '邮箱',
  `headPic` varchar(255) default NULL COMMENT '头像',
  `content` longtext COMMENT '内容',
  `time` timestamp NULL default NULL COMMENT '发布时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

#
# Data for table "comments"
#


#
# Structure for table "navs"
#

DROP TABLE IF EXISTS `navs`;
CREATE TABLE `navs` (
  `Id` int(11) NOT NULL auto_increment,
  `navName` varchar(255) default NULL COMMENT '类名',
  `value` varchar(255) default NULL COMMENT '索引关键字',
  `pid` varchar(255) default NULL COMMENT '父类的Id，顶层为0',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文章分类导航';

#
# Data for table "navs"
#

INSERT INTO `navs` VALUES (1,'CSS','css','0'),(2,'HTML','html','0'),(3,'JavaScript','js','0'),(4,'框架',NULL,'0'),(5,'Vue','  vue','4'),(6,'React','  react','4'),(7,'Angular','  angular','4'),(8,'类库',NULL,'0'),(9,'BootStrap','  bs','8'),(10,'jQuery','  jq','8');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `Id` int(11) NOT NULL auto_increment,
  `userName` varchar(255) default NULL COMMENT '用户名',
  `password` varchar(255) default NULL COMMENT '密码',
  `email` varchar(255) default NULL COMMENT '邮箱',
  `headPic` varchar(255) default NULL COMMENT '头像路径',
  `type` varchar(255) default NULL COMMENT '类型(普通？管理员？)',
  `state` varchar(255) default NULL COMMENT '状态(禁言？)',
  `time` timestamp NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '资料更新时间',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'HSIKE','HS123.hsike..','893008093@qq.com','http://127.0.0.1:3000/img/avatars/1550028891612.png','admin','','2019-02-13 11:34:51');

#
# Structure for table "website"
#

DROP TABLE IF EXISTS `website`;
CREATE TABLE `website` (
  `Id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL COMMENT '网站标题',
  `keywords` varchar(255) default NULL COMMENT '网站关键字',
  `description` longtext COMMENT '网站描述',
  `logo` varchar(255) default NULL COMMENT '网站logo',
  `icon` varchar(255) default NULL COMMENT '网站图标',
  `icp` varchar(255) default NULL COMMENT '备案信息',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站基本信息';

#
# Data for table "website"
#

