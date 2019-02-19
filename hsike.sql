﻿# Host: 127.0.0.1  (Version 5.0.87-community-nt)
# Date: 2019-02-20 00:20:13
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文章';

#
# Data for table "articles"
#

INSERT INTO `articles` VALUES (1,'普通','JavaScript','HSIKE','JavaScript中的简单数据类型（基本数据类型）','JS中的数据类型分为2种：基本数据类型 和 引用数据类型。而在《JavaScript高级程序设计 第三版》中，将其分为 简单数据类型（基本数据类型） 和 复杂数据类型。其中，简单数据类型包括：Undefined、Null、Boolean、Number 和 String（ES6新增了Symbol）。','数据类型','test ava','<blockquote><strong>简单数据类型</strong></blockquote><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">1、Undefined类型：只有一个值——undefined，在声明变量时 未对其进行初始化，这个变量的值即为 undefined</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">var und；\nconsole.log(und);// undefined \n</pre><p><br></p><p>2、Null类型：只有一个值——null，空</p><pre class=\"ql-syntax\" spellcheck=\"false\">var nul=null;\nconsole.log(typeof nul);// \"object\"\n</pre><p>\t<span class=\"ql-font-serif\">在逻辑上，null 为一个空对象指针，表示一个空的对象引用。故在使用 \"typeof\" 操作符进行数据类型检测时返回值为 \"object\"</span></p><p><br></p><p>3、Boolean类型：布尔值，包含2个值：true 和 false，表示逻辑上的 真 或 假</p><pre class=\"ql-syntax\" spellcheck=\"false\">var tru=true;\nvar fal=false;\n</pre><p><br></p><p>4、Number类型：数值，包含：整数int、浮点数float、非数值NaN</p><p>\t①整数：ES中定义的数值字面量包含 十进制整数、八进制整数 和 十六进制整数</p><pre class=\"ql-syntax\" spellcheck=\"false\">var num1=10; // 十进制的整数10\n\n// 八进制整数的第一位数字必须是 0\nvar num2=020; // 八进制的16\nvar num3=08; // 无效的八进制数值，被解析为十进制的8\n\n// 十六进制的前2位必须是 0x\nvar num4=0xF; // 十六进制的15\nvar num5=0xf; // 十六进制的15 十六进制数字中的字母（a-f）不区分大小写\n</pre><p><br></p><p>\t②浮点数：即小数</p><pre class=\"ql-syntax\" spellcheck=\"false\">var flo=1.0001;\n</pre><p><br></p><p>\t③非数值：NaN，\"Not a Number\" 的缩写，NaN是一个特殊值，用于表示一个本来要返回数值的操作数为返回数值的情况（防止抛出错误）。它有以下2个特点：</p><p>a、任何涉及 NaN 的操作都会返回 NaN</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(NaN + 1); // NaN\n</pre><p>b、NaN 不与任何值相等，包括 NaN 本身</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(NaN == NaN); // false\n</pre><p>\t<span class=\"ql-font-serif\">为此，JS中定义了 isNaN() 函数，用来检测传入其中的参数是否为 \"非数值\"，并返回 true/false</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(isNaN(1)); // false\nconsole.log(isNan(\'str\')); // true\n</pre><p><br></p><p>\t<span class=\"ql-font-serif\">值得注意的是，当向 isNaN() 函数中传入 Boolean 的 true 或 false 后</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(isNaN(true)); // false\nconsole.log(isNaN(false)); // false\n</pre><p>\t<span class=\"ql-font-serif\">2个输出结果都为 false，这是因为 Boolean 值的 true 和 false 可以被转换为数字的 1 和 0，而其他不能被转换为数字的值则被视为 NaN。</span></p><p><br></p><p>JS中还提供了3个函数，把非数值转换为数值：Number()（转换字符串时较为复杂且不够合理，一般不会使用）、parseInt()、parseFloat()</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(parseInt(true)); // 1\nconsole.log(parseInt(\'true123\')); // NaN\nconsole.log(parseInt(\'123true321\')); // 123 只转换字符串中开头的数字部分\nconsole.log(parseInt(\'0xf\')); // 15\nconsole.log(parseInt(\'070\')); // 70\nconsole.log(parseInt(\'070\',8)); // 56  第二个参数表示将传入的数字作为八进制数值进行解析\n\n// parseFloat()同理\nconsole.log(parseFloat(\'1.23.123\')); // 1.23\n</pre><p><br></p><p>5、String类型：字符串，由 0 或 多个 Unicode 字符组成的字符序列</p><pre class=\"ql-syntax\" spellcheck=\"false\">var str=\'this is a string\'; // 可以使用单引号也可以使用双引号\n</pre><p>\t<span class=\"ql-font-serif\">JS中的字符串是不可变的，一旦创建就无法修改，每次修改变量中保存的字符串类型值时，都是先销毁原来的字符串，然后用一个包含新值的字符串填充该变量。</span></p><p><br></p><blockquote><strong>简单数据类型特点</strong></blockquote><p>与 复杂数据类型（引用数据类型）不同的是，<span style=\"background-color: rgb(255, 255, 255);\">JS中所有简单数据类型值的引用都是独一无二的，</span>当把变量 <span style=\"background-color: rgb(255, 255, 255);\">a </span>的简单数据类型值赋予 变量b 时，变量b 中保存的实际是 变量a 的一个副本，修改其中某个变量的值并不会影响另一个。</p><pre class=\"ql-syntax\" spellcheck=\"false\">var a=\'variable\';\nvar b=a; // \'variable\'\na=\'value changed\';\nconsole.log(b); // \'variable\'\n</pre>','2019-02-20 00:15:59'),(2,'推荐','JavaScript','HSIKE','JavaScript中的数组（Array）','数组（Array）是JavaScript中极为常用的一种数据类型，其本质就是一组数据的集合。在JS中，数组有以下特点：1、数组定义时无需指定数据类型；2、数组定义时可以无需指定数组长度；3、数组可以存储任何数据类型的数据。','数组、数组方法','','<blockquote><strong>数组的创建</strong></blockquote><p><br></p><p>1、使用 Array 构造函数 <u>指定值</u> 创建：</p><pre class=\"ql-syntax\" spellcheck=\"false\">var arr1=new Array(\'1\', \'2\');// 将创建一个包含 \'1\'、\'2\' 2个元素的数组 \n</pre><p>2、创建 <u>指定长度</u> 数组：</p><pre class=\"ql-syntax\" spellcheck=\"false\">var arr2=new Array(2);// 将创建一个长度为2的数组，但2个元素都为 undefined\n</pre><p>3、字面量形式创建：</p><pre class=\"ql-syntax\" spellcheck=\"false\">var arr3=[\'1\',\'2\'];// 将创建一个包含 \'1\'、2\' 2个元素的数组 \n</pre><p>\t<span class=\"ql-font-serif\">以上3种创建数组方式中，推荐使用第3种——字面量形式创建。</span></p><p><br></p><p>\t注意：在JS中，每创建一个数组都会在内存中生成一个 <u>独一无二的地址</u> 对应所创建的数组；因此，即使2个数组中包含的元素完全一样，这2个数组也不全等（===）。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr1===arr3);// false\n</pre><p><br></p><blockquote><strong>数组的属性</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">数组的常用属性有：length，表示数组的 长度</em></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.length);// \n</pre><p>此外，还有数组的 索引，表示数据在 数组中所处的位置，可以此访问数组中指定位置的元素：</p><pre class=\"ql-syntax\" spellcheck=\"false\">for (var index=0;index&lt;arr3.length;index++) console.log(\'index:\',index,\'value:\',arr[index]);\n// 将输出：\n// 0:\'1\'\n// 1:\'2\'\n</pre><p>\t<span class=\"ql-font-serif\">数组的索引是从 0 开始的，而不是 1，表示数组的 第一个 元素。</span></p><p><br></p><blockquote><strong>数组的常用方法</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">包括：concat()、join()、pop()、push()、shift()、unshift、slice()、splice()等</em></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">1、contact()：</span><span style=\"color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);\">连接多个数组或在数组末尾加入新的元素，并返回拼接后的结果。不会修改原数组。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.concat(\'3\',[\'4\']);// [\'1\',\'2\',\'3\',\'4\']\nconsole.log(arr3);// [\'1\',\'2\']\n</pre><p><br></p><p>2、join(seperator)：将数组内元素拼接成字符串，并以传入的分隔符seperator 隔开，seperator可选，缺省时以 \",\" 隔开。不会修改原数组。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.join(\'||\'));// \"1||2\"\n</pre><p><br></p><p>3、pop()：<span style=\"background-color: rgb(255, 255, 255); color: rgb(0, 0, 0);\">删除并返回数组的最后一个元素。修改原数组。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.pop()); // \'2\'\nconsole.log(arr3); // \'1\'\n</pre><p><br></p><p>4、push()：向数组末尾加入一个或多个元素，并返回操作后的数组长度。修改原数组。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.push(\'3\',\'4\');// 3\nconsole.log(arr3);// [\'1\',\'3\',\'4\']\n</pre><p>\t<span class=\"ql-font-serif\">注意：如果使用push()方法将一个数组加入到另一个数组的末尾，并不会像concat()方法一样将目标数组进行解构后将其内元素一一插入原数组末尾，而是直接将目标数组作为元素插入原数组中。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">arr3.push(\'5\',[\'6\']);\nconsole.log(arr3);// [\'1\',\'3\',\'4\',\'5\',[\'6\']]\n</pre><p><br></p><p>5、shift()：删除并返回数组的第一个元素。修改原数组。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.shift());// \'1\'\nconsole.log(arr3);// [\'3\',\'4\',\'5\',[\'6\']]\n</pre><p><br></p><p>6、unshift()：在数组头部开始插入一个或多个元素，并返回操作后的数组长度。修改原数组。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.unshift([\'0\']));// 5\nconsole.log(arr3);// [\'0\',\'3\',\'4\',\'5\',[\'6\']]\n</pre><p><br></p><p>7、slice(start,end)：截取并返回数组中从索引为start（包含）和 索引为 end（不包含）之间的所有元素组成的数组。不修改原数组。</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.slice(1,3));// [\'3\',\'4\']\n</pre><p>\t<span class=\"ql-font-serif\">其中，end为可选，若缺省则表示截取至数组的最后一个元素（包含）；start可以是负数，表示从数组的末尾开始的第 n 个位置开始截取（-1表示数组最后一个元素）。</span></p><p><br></p><p>8、splice(start, count, newEle)：删除并返回数组中从索引为start的元素开始、数量为count的元素，并插入一个或多个新元素。修改原数组</p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log(arr3.splice(2,3,\'7\')); // [\'4\',\'5\',[\'6\']]\ncconsole.log(arr3);// [\'0\',\'3\',\'7\']\n</pre><p>\t<span class=\"ql-font-serif\">其中，newEle为可选，表示只删除数组中的某个片段，而不插入新的元素；start可以为负，表示从数组的末尾开始；count可以为0，表示不删除原数组中的元素，而在 </span><u class=\"ql-font-serif\" style=\"color: rgb(92, 0, 0);\">指定位置后</u><span class=\"ql-font-serif\"> 插入新的元素。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">arr3.splice(2,1); // 删除arr3中索引为2的元素，即 \'7\'\narr3.splice(0,0,\'8\'); // [\'0\',\'8\',\'3\']\n</pre><p><br></p><p>除了此以外，数组还有：reverse()--数组元素顺序颠倒、sort()--数组排序、toString()--转换为字符串等方法。</p>','2019-02-19 22:29:27'),(3,'推荐','CSS','HSIKE','CSS样式权重、选择器优先级的比较','CSS：Cascading Style Sheets 重叠样式表，其包含三大特征：\n1、继承，即子类元素继承父类元素的样式；\n2、优先级，不同类别样式的权重比较，优先级较高的样式覆盖优先级低的；\n3、重叠，当权重相同时，后者覆盖前者（重叠）的样式。这里主要介绍CSS样式优先级中 选择器的优先级。','样式权重、选择器优先级','','<p>之前曾经简单介绍过CSS中常用的一些选择器的使用：<span class=\"ql-size-small\"> // 这里放链接</span></p><p><br></p><p>但使用过程中经常发生意料之外的效果，标签并未按照预期的效果显示，这很可能就是由于选择器的优先级引起的样式覆盖。</p><p><br></p><p><span class=\"ql-size-small\">如：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;p class=\"p\"&gt; This is p1 &lt;/p&gt; &lt;!-- p1 --&gt;\n&lt;p class=\"p\"&gt; This is p2 &lt;/p&gt; &lt;!-- p2 --&gt;\n&lt;p&gt; This is p3 &lt;/p&gt; &lt;!-- p3 --&gt;\n</pre><p><span class=\"ql-size-small\">文档中有一些类名为“p”的标签，一开始将它们的字体颜色设为 red：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">.p{ color:red }\n</pre><p><span class=\"ql-size-small\">后来又想将所有 p 标签的字体颜色都设置为 green：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">p{ color:green }\n</pre><p>\t却发现在浏览器中，只有 p3 的字体颜色为 green，p1 及 p2 的字体颜色都为 red，这就是选择器的优先级引起的样式覆盖。</p><p><br></p><blockquote><strong>选择器的优先级</strong></blockquote><p><br></p><p>几种常用选择器的优先级比较：</p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div&gt;\n  &lt;p class=\"p\" id=\"p1\"&gt; This is a paragraph &lt;/p&gt;\n&lt;/div&gt;\n</pre><p>\t默认字体颜色为：黑色。</p><p><span class=\"ql-size-small\">设置样式：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">/* 标签选择器 */\np{ color:red }\n</pre><p>\t此时字体颜色为：red。</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* 后代选择器（可以理解为2个标签选择器） */\ndiv p{ color:blue }\t\n</pre><p>\t此时字体颜色为：blue。</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* 类选择器 */\n.p{ color:green }\n</pre><p>\t此时字体颜色为：green。</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* 后代选择器 + 类选择器 */\ndiv .p{ color:orange }\n</pre><p>\t此时字体颜色为：orange。</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* id选择器 */\n#p1{ color:yellow }\n</pre><p>\t此时字体颜色为：yellow。</p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255);\">以上，可以清晰的看出几种常用选择器的优先级，即：id选择器 &gt; 类选择器 &gt; 标签选择器。</span></p><p><br></p><p>因此可以将这些选择器分别对应不同的 “位”，综合它们出现的次数用来计算 它们对应的样式的优先级：</p><p><br></p><p>\t\t\t\t0\t\t\t\t\t\t\t\t 0 \t\t\t\t\t\t\t0</p><p>\tid选择器出现次数\t类选择器出现次数\t标签选择器出现次数</p><p><br></p><p>\t把以上各种选择器出现次数 <u>拼接</u> 成（不是简单的三个十进制数字相加）的数字最为样式最后的 权重值，比较这个值的大小即可得<span style=\"background-color: rgb(255, 255, 255);\">出</span>重复设置的样式中标签最后呈现的 样式。</p><p><br></p><p>\t在上例中\"p\"的权重值为\"0 0 1\"，\"div p\" 的 权重值为\"<span style=\"background-color: rgb(255, 255, 255);\">0 0 2</span>\"，\".p\" 的权重值为\"0 1 0\"，\"div .p\"的权重值为\"0 1 1\"，\"#p1\"的权重值为\"1 0 0\"，故 id选择器 \"#p1\" 中设置的样式为标签最后呈现的样式。</p><p><br></p><blockquote><strong>样式的权重</strong></blockquote><p><br></p><p>除以上几种选择器设置样式外，还可以在标签上定义内联（行内）样式：</p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div&gt; \n  &lt;p class=\"p\" id=\"p1\" style=\"color:pink\"&gt; This is a paragraph &lt;/p&gt;\n&lt;/div&gt;\n</pre><p>\t此时字体颜色为：pink。正常情况下，内联样式的权重高于外部设置样式。</p><p><br></p><p>继承父标签样式：</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* 设置父标签样式，子标签继承 */\ndiv{ color:purple }\n</pre><p>\t在未单独设置 p 标签字体颜色时，其字体颜色为：purple。</p><pre class=\"ql-syntax\" spellcheck=\"false\">/* !important，更改 标签选择器中的设置 */\np{ color:red !important }\n</pre><p>\t此时字体颜色变回：red。带有\"!important\"字样的样式权重高于其他方式设置的样式，当\"!important\"发生冲突时，则需要再次比较优先级。滥用\"!important\"将会导致样式混乱，应尽量避免使用。</p>','2019-02-19 16:37:11'),(4,'推荐','CSS','HSIKE','标签类型、盒子模型及边界重叠','简单介绍HTML中根据元素（标签）在文档中的位置特性进行标签类型分类、标签的盒子模型和特殊情况下的标签的边界重叠现象及其解决方法。','盒子模型、标签类型、边界重叠','','<blockquote><strong class=\"ql-size-large\">HTML标签类型</strong></blockquote><p><br></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">根据标签在文档中的位置特性可将元素（标签）分为三类：</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span style=\"color: rgb(68, 68, 68);\" class=\"ql-size-large\">1、</span><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">块级元素（block）：可以设定宽高，默认宽度为父元素宽度；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span style=\"color: rgb(68, 68, 68);\" class=\"ql-size-large\">2、</span><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">行内元素（inline）：宽高由标签所包含的内容决定，设置无效，默认为0；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span style=\"color: rgb(68, 68, 68);\" class=\"ql-size-large\">3、</span><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\" class=\"ql-size-large\">行级块元素（inline-block）：</span><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">也称块级行元素，默认宽高由内容决定，但也可设置；</span></p><p><br></p><p><span class=\"ql-size-large\">块级元素在文档中会独占一整行（一行只能显示一个块级元素），即使其内容宽度小于标签宽度，而行内元素和行级块元素在内容 宽度小于标签宽度时，多个这种元素会并排在同一行显示。</span></p><p><br></p><p><span class=\"ql-size-large\">标签可以通过设定样式 { display: block / inline / inline-block } 转化为指定类型，将行级块元素转换为块级元素之后，其将独占一行但默认宽度不会变（有内容尺寸决定）；而将行内元素转换为块级元素后，其显示效果将与普通块级元素一致。</span></p><p><br></p><blockquote><strong class=\"ql-size-large\">标签盒子模型：</strong></blockquote><p><em class=\"ql-size-large\" style=\"color: rgb(136, 136, 136);\">HTML标签本身为一个容器，可被理解为一个盒子，在文档中具有分层结构 ，即盒子模型</em></p><p><br></p><p><span class=\"ql-size-large\">一、盒子分层，标签盒子从内到外可分为4层：</span></p><p><br></p><p><span class=\"ql-size-large\">\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">1、内容 content：</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">存放标签内容的区域，标签的宽高即 content 尺寸；</span></p><p><br></p><p><span style=\"color: rgb(68, 68, 68);\">\t</span><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">2、内边距 padding：也叫内补白，在内容层与边框层之间增加隔离区域，控制内容层与边框层之间的距离（可以没有边框）；</span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\"> </span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">\t3、边框 border：设置标签四周的边框 { border:边框粗细 显示类型 颜色 } （样式值顺序不固定） 某些标签自带边框，如：input、button等</span></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\"> 显示类型 ：solid 实线 dotted 圆点虚线 dashed 矩形虚线；</span></p><p><br></p><p><span class=\"ql-size-large\" style=\"color: rgb(68, 68, 68);\">\t4、外边距 margin：也叫外补白，在边框外增加隔离区域，用来控制当前标签与周围内容的间距。</span></p><p><br></p><p>\t<span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255);\">设置</span><span class=\"ql-size-large\">行内元素的padding-top、padding-bottom时，元素盒子中存在这些样式，但显示效果不会发生变化（与文档中上下文行框重叠）；而行内元素的 margin-top、margin-bottom 则无法设置，这些样式不会存在与元素盒子中。</span></p><p><br></p><p><span class=\"ql-size-large\">二、盒子类型 box-sizing，盒子类型有2种：</span></p><p><br></p><p>\t<span class=\"ql-size-large\">1、IE盒模型 border-box：标签设定</span><span style=\"background-color: rgb(255, 255, 255);\">的</span> <span class=\"ql-size-large\">width / height 包含 border、padding 以及 content；标签同时设置了（或默认包含）width / height、border、padding，会压缩 content 的尺寸以保持其在文档中所占空间与 width / height 一致；</span></p><p>\t</p><p><span style=\"color: rgb(68, 68, 68);\"> </span>\t<span style=\"color: rgb(68, 68, 68);\" class=\"ql-size-large\">2、</span><span style=\"color: rgb(68, 68, 68); background-color: rgb(255, 255, 255);\">标准盒模型 content-box：</span><span style=\"background-color: rgb(255, 255, 255);\">width / height 仅包含 content；标签同时包含 width / height、border、padding时，其在文档中所占据的空间会比 width / height 大；</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255);\" class=\"ql-size-small\">如：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;input type=\"text\" placeholder=\"输入框\"&gt;&lt;!-- input默认为标准盒模型 --&gt;\n&lt;button type=\"button\"&gt;按钮&lt;/button&gt;&lt;!-- button默认为IE盒模型 --&gt;\n</pre><p><span class=\"ql-size-small\">对2个标签设定同样的样式：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">input,button{\n  width:200px;\n  height:100px;\n}\n/* 2个标签设置的高度都为100px，但显示效果为 input 比 button 高一点点 */\n</pre><p><br></p><blockquote><strong class=\"ql-size-large\">边界重叠</strong></blockquote><p><br></p><p><span class=\"ql-size-large\">1、父子标签边界重叠：</span></p><p><br></p><p>\t<span class=\"ql-size-large\">父标签与子标签都在同一垂直方向上设定 margin 且父标签未在该方向上设定 padding 和 border 时，就会发生margin重叠现象，将取所设的 margin 值中较大的一个作为整体的 margin 。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"parent\"&gt;\n  &lt;div class=\"child\"&gt;&lt;/div&gt;\n&lt;/div&gt;\n</pre><p><span class=\"ql-size-small\">设置样式：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">.parent{\n  width:500px;\n  height:500px;\n  background-color:red;\n}\n.child{\n  width:200px;\n  height:200px;\n  background-color:green;\n  margin-top:100px;\n}\n</pre><p>\t<span class=\"ql-size-large\">child 的 margin-top 本应该让 child 在距离 parent 顶部 100px 的位置显示，而实际情况是 parent 和 child 的顶部重合在一起，child “拖着” parent 一起向下移动了100px，这是因为 parent 顶部未设置任何 “阻挡”，使得父子标签的顶部边界重合在了一起。若要实现预期的效果，可以设置 parent 的 border-top、padding-top 阻止边界重叠。</span></p><p><br></p><p><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255);\">2、兄弟相邻标签边界重叠：</span></p><p><br></p><p><span class=\"ql-size-large\">\t2个兄弟关系（相邻）的标签在垂直方向上设定的 margin 发生了相遇（一个 margin-bottom、一个 margin-top）且2个标签中间无内容或者没有高度的空标签时，将会发生边界重叠，重叠后取2个标签设定的 margin 值中较大的一个作为2个标签间的距离。</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"box1\"&gt;&lt;/div&gt;\n&lt;div class=\"box2\"&gt;&lt;/div&gt;\n</pre><p><span class=\"ql-size-small\">设置样式：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">.box1 {\n    background:red;\n    width:400px;\n    height:400px;\n    /* box1下边距50像素 */\n    margin-bottom:50px;\n}\n.box2 {\n    background:green;\n    width:300px;\n    height:300px;\n    /* box2上边距100像素 */\n    margin-top:100px;\n}\n/* box1下边距50px box2上边距100px，中间间距本应为150px，而实际发生边界重叠只取较大的100px */\n</pre><p>\t<span class=\"ql-size-large\">此时可以在2个标签中间增加一个 { height: 1px } 的空元素，或者将需要间隔的距离设置到一个标签的某个方向上以达到想要的显示效果。</span></p>','2019-02-19 14:32:01'),(5,'推荐','CSS','HSIKE','CSS选择器的简单使用','简单介绍CSS中常用的一些选择器，如 标签选择器、类选择器、id选择器、属性选择器、子代与后代选择器、通配符选择器等的使用方法，及多种选择器组合使用。','选择器','','<blockquote><strong class=\"ql-size-large\">CSS选择器</strong></blockquote><p><em class=\"ql-size-large\" style=\"background-color: rgb(253, 252, 248); color: rgb(136, 136, 136);\">在 CSS 中，选择器是一种模式，用于选择需要添加样式的元素。</em></p><p><br></p><blockquote><strong class=\"ql-size-large\" style=\"background-color: rgb(253, 252, 248);\">常用选择器</strong></blockquote><p><br></p><p><span class=\"ql-size-large\">1、标签选择器：使用标签名选择文档中元素</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">p{ color:red }\ndiv{ font-size: 20px }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">把文档中所有 p 标签的文字颜色设为 red，所有 div 的字体大小设为 20px。</span></p><p><br></p><p><span class=\"ql-size-large\">2、类</span><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255);\">（class）</span><span class=\"ql-size-large\">选择器（.className）：通过</span><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 255);\">标签设置的类名选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"red\"&gt;div with a className \"red\"&lt;/div&gt;\n&lt;p class=\"red\"&gt;p with a className \"red\"&lt;/p&gt;\n\n.red{ color:red }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">把文档中所有含有 “red” 类名的标签（与标签名称无关）中文字的颜色设为 red。</span></p><p><br></p><p><span class=\"ql-size-large\">3、id选择器（#id）：通过标签设置的 id 选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div id=\"div\"&gt;div with id \"div\"&lt;/div&gt;\n\n#div{ height:200px; background: red }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">将文档中 id 为 “div” 的标签高度设为 200px，背景颜色设为 red。</span></p><p>\t<span class=\"ql-size-large ql-font-serif\">注意：在 css 中，id 为唯一标识，因此不能为多个标签设置同一个 id。</span></p><p><br></p><p><span class=\"ql-size-large\">4、属性选择器（[propName=\"propValue\"]）：通过标签的属性选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div prop=\"pro\"&gt;test div&lt;/div&gt;\n&lt;p prop=\"pro\"&gt;test p&lt;/p&gt;\n\n[prop=\"pro\"]{ color:red }\n</pre><p>\t<span class=\"ql-font-serif ql-size-large\">div、p标签中的文字颜色将被设为 red。</span></p><p><span class=\"ql-font-serif ql-size-large\">注：class、id 也是标签的属性，因此</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">.className{ style } / #id{ style }   也可以写成  [class=\"className\"]{ style } / [id=\"id\"]{ style }\n</pre><p><br></p><p><span class=\"ql-size-large\">5、伪类选择器（:state）：选择处于某种状态的标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;input type=\"text\"&gt;\n&lt;button&gt;button&lt;/button&gt;\n\n:focus{ border:5px solid red }\n:active{ color:green }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">:focus 选择处于 “获得焦点” 状态的标签，:active 选择处于 “激活” 状态（被点击时）的标签，并为其设置样式，但一般只有表单元素及锚（a）标签才有这些状态。</span></p><p><br></p><p><span class=\"ql-size-large\">6、通配符选择器（*）：选择文档中所有的标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;p&gt; p &lt;/p&gt;\n&lt;a href=\"#\"&gt; a &lt;/a&gt;\n&lt;p class=\"p2\"&gt; another p &lt;/p&gt;\n\n*{ color:green }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">页面中所有标签的字体颜色都将被设置为 green。</span></p><p><br></p><p><span class=\"ql-size-large\">7、子代与后代选择器：选择嵌套标签中的子代或者后代标签</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"div\"&gt;\n  &lt;div class=\"test\"&gt;\n    &lt;div&gt; child div &lt;/div&gt;\n  &lt;/div&gt;\n&lt;/div&gt;\n        \n.div&gt;div{ border-top:5px solid red }\n.div div{ border-bottom:10px solid green } \n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">selector1&gt;selector2 选择 selector1 内的 selector2 标签，但 selector2 必须直接嵌套在 selector1 下，.div&gt;div 只会给 .test 设置顶部边框，而 .div div 将会为 .div 内部嵌套的所有 div设置底边框。</span></p><p><br></p><p><span class=\"ql-size-large\">8、选择器组合使用：使用多种选择器选择</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">&lt;div class=\"txt\"&gt; test div &lt;/div&gt;\n&lt;p class=\"txt\"&gt; test p &lt;/div&gt;\n&lt;p class=\"txt\"&gt;\n  &lt;div class=\"txt&gt; another p &lt;/div&gt;\n&lt;/p&gt;\n&lt;div class=\"parent\"&gt;\n  &lt;div class=\"child\"&gt; child div &lt;/div&gt;\n  &lt;p class=\"child\"&gt; child p &lt;/p&gt;\n&lt;/div&gt;\n\n\np.txt{ border:5px solid red }\np .txt{ color:red }\n\n.parent p.child{ color: green }\n</pre><p>\t<span class=\"ql-size-large ql-font-serif\">p.txt （无空格）选择的是 类名中包含 “txt” 的 p 标签，而 p .txt （有空格）选择的是 嵌套 在 </span><span style=\"background-color: rgb(255, 255, 255);\">p 标签内且</span><span class=\"ql-font-serif ql-size-large\">类名中包含 “txt” 的后代标签</span></p><p><br></p><p><strong class=\"ql-size-large\">注意：使用css选择器为文档中标签设置样式时，要注意选择器的优先级引起的样式覆盖！</strong></p>','2019-02-19 14:27:18'),(6,'推荐','JavaScript','HSIKE','JavaScript对象属性的特性','ES5定义只有内部采用的特性时，描述了JS中对象属性的一些特性，包括:属性的值——value、属性是否可写——writable、属性是否可枚举——enumerable、属性是否可配置——configurable，以及对这些特性的简单操作。','对象、对象属性特性','','<blockquote><strong>操作属性特征：Object.defineproperty()</strong></blockquote><p><br></p><p>虽然ES5中描述了属性的 [[value]]、[[writable]]、[[enumerable]]、[[configurable]] 这些特征，但由于<span style=\"background-color: rgb(255, 255, 255);\">定义这些特性是为了实现JavaScript引擎用的，因此在JavaScript中不能直接访问、修改它们（规范把他们放在了两对方括号中[[ ]]）。</span></p><p><br></p><p><span style=\"background-color: rgb(255, 255, 255);\">如果要修改属性默认的特性，就必要要使用ES5的Object.defineProperty( obj, propName, descriptor )方法。这个方法接收三个参数：obj 属性所在的对象、propName 需要修改的属性名、descriptor 描述符对象。其中，描述符对象的属性必须为四个特性中的一个或多个（配置多个属性时使用 Object.defineproperties()方法）。</span></p><p><br></p><blockquote><strong class=\"ql-size-large\">属性的值：value</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">可以理解为访问对象属性</em><em style=\"color: rgb(136, 136, 136); background-color: rgb(255, 255, 255);\">时</em><em style=\"color: rgb(136, 136, 136);\">返回</em><em style=\"color: rgb(136, 136, 136); background-color: rgb(255, 255, 255);\">的</em><em style=\"color: rgb(136, 136, 136);\">结果，默认为 undefined </em></p><p><br></p><p><span class=\"ql-size-small\">JS中可以像这样修改对象的属性：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">var example={ name:\'nameA\' };\nexample.name=\'nameB\';\n</pre><p><span class=\"ql-size-small\">也可以：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">Object.defineproperty( example, \'name\', { value: \'nameC\' });\nconsole.log(example.name); // \'nameC\'\n</pre><p><br></p><blockquote><strong>属性是否可写：writable</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">配置属性的值是否可以被修改，默认为 true</em></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">Object.defineproperty( example, \'name\', { writable:false });\n// 此时 example 的 name 属性将不可写 运行以下：\nexample.name=\'nameD\';\nconsole.log( example.name ); // \'nameC\'\n// 修改 example.name 的操作被忽略，但在严格模式下将会报错\n</pre><p><br></p><blockquote><strong>属性是否可枚举：enumerable</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">配置属性是否可枚举（一般用于 for in 循环枚举对象属性，或者 Object.keys( obj ) 以数组形式输出对象的可枚举属性），默认为 true</em></p><p><br></p><p><span class=\"ql-size-small\">枚举 example的属性：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">console.log( Object.keys( example ) ); // [\'name\']\n</pre><p><span class=\"ql-size-small\">将 example.name 设置为 不可枚举：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">Object.defineproperty( example, \'name\', { enumerable:false } );\nconsole.log( Object.keys( example ) ); // []\n</pre><p><br></p><blockquote><strong>属性是否可配置：configurable</strong></blockquote><p><em style=\"color: rgb(136, 136, 136);\">设置属性是否可以被修改，默认为 true</em></p><p><br></p><p><span class=\"ql-size-small\" style=\"color: rgb(68, 68, 68);\">正常情况下，我们可以通过 delete 来删除对象的某个属性：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">delete example.name;\nconsole.log( example ); // {}\n</pre><p><span class=\"ql-size-small\">另一个例子：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">var example2={ name: \'name2\' };\n// 将其 name 属性设置为不可配置：\nObject.defineproperty( example2, \'name\', { configurable:false });\n</pre><p><span class=\"ql-size-small\">尝试删除 example2.name:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">delete example2.name;\nconsole.log( example2 ); // { name:\'name2\' }\n// 可以看到 name 属性并未被删除，在严格模式下执行该代码将导致报错\n</pre><p><span class=\"ql-size-small\">尝试将其改回为可配置：</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">try{ Object.defineproperty( example2, \'name\', { configurable:true } )\ncatch(e){ console.log(e) } // 捕获异常：Cannot redefine property: name\n</pre><p> \t该操作为 <u style=\"color: rgb(92, 0, 0);\">不可逆</u><span style=\"color: rgb(68, 68, 68);\"> ，将属性的 [[configurable]] 设置为 false 后，企图再次将其设置为 true 将导致报错（这里使用 try catch 语句捕获错误，避免报错导致后面代码无法执行）</span></p><p><br></p><p>\t但是，尽管此时 example2 的 name 属性不可配置，但当其 writable 属性为 true （可写）时，依然可以对其 name 属性进行修改：</p><pre class=\"ql-syntax\" spellcheck=\"false\">example.name=\'name3\';\nconsole.log( example.name ); // \'name3\'\n</pre><p><br></p><p>\t在ES6之前，JS中没有 “常量” 的概念，但是通过设置属性的 configurable:false 和 writable:false 可以定义一个 属性不可变、不可删除的 “变量”。</p>','2019-02-19 14:23:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文章分类导航';

#
# Data for table "navs"
#

INSERT INTO `navs` VALUES (1,'CSS','CSS','0'),(2,'HTML','HTML','0'),(3,'JavaScript','JavaScript','0'),(4,'框架','框架','0'),(5,'Vue','Vue','4'),(6,'React','React','4'),(7,'Angular','Angular','4'),(8,'类库','类库','0'),(9,'BootStrap','Bootstrap','8'),(10,'jQuery','jQuery','8'),(11,'后端','后端','0'),(12,'Node','Node','11'),(13,'MySQL','MySQL','11');

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

INSERT INTO `users` VALUES (1,'HSIKE','HS123.hsike..','893008093@qq.com','http://127.0.0.1:3000/img/avatars/1550028891612.png','admin','blocked','2019-02-19 09:32:07');

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

