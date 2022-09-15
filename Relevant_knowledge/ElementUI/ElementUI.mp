# ElementUI

### 1.介绍

ElementUI是一套基于VUE2.0的桌面端组件库，ElementUI提供了丰富的组件帮助开发人员快速构建功能强大、风格统一的页面。

官网地址：http://element-cn.eleme.io/#/zh-CN

传智健康项目后台系统就是使用ElementUI来构建页面，在页面上引入 js 和 css 文件即可开始使用，如下：

```vue
<!--引入 element-ui 的样式，-->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 必须先引入vue，  后使用element-ui -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
    <!-- 引入element 的组件库-->
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
```

### 2 常用组件

#### 4.2.1 Container 布局容器

用于布局的容器组件，方便快速搭建页面的基本结构：

`<el-container>`：外层容器。当子元素中包含 `<el-header>` 或 `<el-footer>` 时，全部子元素会垂直上下排列，否则会水平左右排列

`<el-header>`：顶栏容器

`<el-aside>`：侧边栏容器

`<el-main>`：主要区域容器

`<el-footer>`：底栏容器

```html
<body>
  <div id="app">
    <el-container>
      <el-header>Header</el-header>
      <el-container>
        <el-aside width="200px">Aside</el-aside>
        <el-container>
          <el-main>Main</el-main>
          <el-footer>Footer</el-footer>
        </el-container>
      </el-container>
    </el-container>
  </div>
  <style>
    .el-header, .el-footer {
      background-color: #B3C0D1;
      color: #333;
      text-align: left;
      line-height: 60px;
    }

    .el-aside {
      background-color: #D3DCE6;
      color: #333;
      text-align: center;
      line-height: 200px;
    }

    .el-main {
      background-color: #E9EEF3;
      color: #333;
      text-align: center;
      line-height: 590px;
    }
  </style>
</body>
<script>
  new Vue({
    el:'#app'
  });
</script>
```

#### 4.2.2 Dropdown 下拉菜单

将动作或菜单折叠到下拉菜单中。

```html
<el-dropdown split-button size="small" trigger="click">
  个人中心
  <el-dropdown-menu>
    <el-dropdown-item >退出系统</el-dropdown-item>
    <el-dropdown-item divided>修改密码</el-dropdown-item>
    <el-dropdown-item divided>联系管理员</el-dropdown-item>
  </el-dropdown-menu>
</el-dropdown>
```

#### 4.2.3 NavMenu 导航菜单

为网站提供导航功能的菜单。

```html
<el-menu>
  <el-submenu index="1">
    <template slot="title">
      <i class="el-icon-location"></i>
      <span slot="title">导航一</span>
    </template>
    <el-menu-item>选项1</el-menu-item>
    <el-menu-item>选项2</el-menu-item>
    <el-menu-item>选项3</el-menu-item>
  </el-submenu>
  <el-submenu index="2">
    <template slot="title">
      <i class="el-icon-menu"></i>
      <span slot="title">导航二</span>
    </template>
    <el-menu-item>选项1</el-menu-item>
    <el-menu-item>选项2</el-menu-item>
    <el-menu-item>选项3</el-menu-item>
  </el-submenu>
</el-menu>
```

#### 4.2.4 Table 表格

用于展示多条结构类似的数据，可对数据进行排序、筛选、对比或其他自定义操作。

```html
<el-table :data="tableData" stripe>
  <el-table-column prop="date" label="日期"></el-table-column>
  <el-table-column prop="name" label="姓名"></el-table-column>
  <el-table-column prop="address" label="地址"></el-table-column>
  <el-table-column label="操作" align="center">
    <!--
		slot-scope：作用域插槽，可以获取表格数据
    	scope：代表表格数据，可以通过scope.row来获取表格当前行数据，scope不是固定写法
    -->
    <template slot-scope="scope">
      <el-button type="primary" size="mini" @click="handleUpdate(scope.row)">编辑</el-button>
      <el-button type="danger" size="mini"  @click="handleDelete(scope.row)">删除</el-button>
    </template>
  </el-table-column>
</el-table>
<script>
  new Vue({
    el:'#app',
    data:{
      tableData: [{
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-04',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1519 弄'
      }]
    },
    methods:{
      handleUpdate(row){
        alert(row.date);
      },
      handleDelete(row){
        alert(row.date);
      }
    }
  });
</script>
```

#### 4.2.5 Pagination 分页

当数据量过多时，使用分页分解数据。

```html
<!--
	current-change：内置的事件，当前页码改变时会触发，可以获取到改变之后的页码
-->
<el-pagination
               @current-change="handleCurrentChange"
               current-page="5"
               page-size="10"
               layout="total, prev, pager, next, jumper"
               :total="305">
</el-pagination>
<script>
  new Vue({
    el:'#app',
    methods:{
      handleCurrentChange(page){
        alert(page);
      }
    }
  });
</script>
```

#### 4.2.6 Message 消息提示

常用于主动操作后的反馈提示。

```html
<el-button :plain="true" @click="open1">消息</el-button>
<el-button :plain="true" @click="open2">成功</el-button>
<el-button :plain="true" @click="open3">警告</el-button>
<el-button :plain="true" @click="open4">错误</el-button>
<script>
  new Vue({
    el: '#app',
    methods: {
      open1() {
        this.$message('这是一条消息提示');
      },
      open2() {
        this.$message({
          message: '恭喜你，这是一条成功消息',
          type: 'success'
        });
      },
      open3() {
        this.$message({
          message: '警告哦，这是一条警告消息',
          type: 'warning'
        });
      },
      open4() {
        this.$message.error('错了哦，这是一条错误消息');
      }
    }
  })
</script>
```

#### 4.2.7 Tabs 标签页

分隔内容上有关联但属于不同类别的数据集合。

```html
<h3>基础的、简洁的标签页</h3>
<!--
	通过value属性来指定当前选中的标签页
-->
<el-tabs value="first">
  <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
  <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
  <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
  <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
</el-tabs>
<h3>选项卡样式的标签页</h3>
<el-tabs value="first" type="card">
  <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
  <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
  <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
  <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
</el-tabs>
<h3>卡片化的标签页</h3>
<el-tabs value="first" type="border-card">
  <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
  <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
  <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
  <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
</el-tabs>
<script>
  new Vue({
    el: '#app'
  })
</script>
```

#### 4.2.8 Form 表单

由输入框、选择器、单选框、多选框等控件组成，用以收集、校验、提交数据。在 Form 组件中，每一个表单域由一个 Form-Item 组件构成，表单域中可以放置各种类型的表单控件，包括 Input、Select、Checkbox、Radio、Switch、DatePicker、TimePicker。

```html
<!--
	rules：表单验证规则
-->
<el-form ref="form" :model="form" :rules="rules" label-width="80px">
  <!--
  	prop：表单域 model 字段，在使用 validate、resetFields 方法的情况下，该属性是必填的
  -->
  <el-form-item label="活动名称" prop="name">
    <el-input v-model="form.name"></el-input>
  </el-form-item>
  <el-form-item label="活动区域" prop="region">
    <el-select v-model="form.region" placeholder="请选择活动区域">
      <el-option label="区域一" value="shanghai"></el-option>
      <el-option label="区域二" value="beijing"></el-option>
    </el-select>
  </el-form-item>
  <el-form-item label="活动时间">
    <el-col :span="11">
      <el-date-picker type="date" placeholder="选择日期" v-model="form.date1" style="width: 100%;"></el-date-picker>
    </el-col>
    <el-col class="line" :span="2">-</el-col>
    <el-col :span="11">
      <el-time-picker type="fixed-time" placeholder="选择时间" v-model="form.date2" style="width: 100%;"></el-time-picker>
    </el-col>
  </el-form-item>
  <el-form-item label="即时配送">
    <el-switch v-model="form.delivery"></el-switch>
  </el-form-item>
  <el-form-item label="活动性质">
    <el-checkbox-group v-model="form.type">
      <el-checkbox label="美食/餐厅线上活动" name="type"></el-checkbox>
      <el-checkbox label="地推活动" name="type"></el-checkbox>
      <el-checkbox label="线下主题活动" name="type"></el-checkbox>
      <el-checkbox label="单纯品牌曝光" name="type"></el-checkbox>
    </el-checkbox-group>
  </el-form-item>
  <el-form-item label="特殊资源">
    <el-radio-group v-model="form.resource">
      <el-radio label="线上品牌商赞助"></el-radio>
      <el-radio label="线下场地免费"></el-radio>
    </el-radio-group>
  </el-form-item>
  <el-form-item label="活动形式">
    <el-input type="textarea" v-model="form.desc"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即创建</el-button>
  </el-form-item>
</el-form>
<script>
  new Vue({
    el: '#app',
    data:{
      form: {
        name: '',
        region: '',
        date1: '',
        date2: '',
        delivery: false,
        type: [],
        resource: '',
        desc: ''
      },
      //定义校验规则
      rules: {
        name: [
          { required: true, message: '请输入活动名称', trigger: 'blur' },
          { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'blur' }
        ],
        region: [
          { required: true, message: '请选择活动区域', trigger: 'change' }
        ]
      }
    },
    methods:{
      onSubmit() {
        console.log(this.form);
        //validate：对整个表单进行校验的方法，参数为一个回调函数。
        //该回调函数会在校验结束后被调用，并传入两个参数：是否校验成功和未通过校验的字段。
        this.$refs['form'].validate((valid) => {
          if (valid) {
            alert('submit!');
          } else {
            console.log('error submit!!');
            return false;
          }
        });
      }
    }
  })
</script>
```

