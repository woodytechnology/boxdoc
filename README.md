# 简介

本项目为巫迪采集网关的文档

## 环境搭建

需要依赖nodejs和npm系统,具体安装方法可以参考[菜鸟教程](https://www.runoob.com/nodejs/nodejs-install-setup.html)

1. 安装gitbook

 ``` shell
npm install gitbook-cli -g
```

2.  Clone 代码

 ``` shell
git clone https://github.com/woodytechnology/boxdoc.git
```

3. 进入代码目录

 ``` shell
cd boxdoc
```

4. 安装gitbook 依赖

 ``` shell
gitbook install
```

5. 预览文档,默认地址为 *http://localhost:4000*

 ``` shell
gitbook serve
```

6. 编译文档,文档输出在*_book/*文件夹下

 ``` shell
gitbook build
```

7. 使用,部署在任意静态文件服务器即可提供web文档,或直接使用浏览器打开html文件(可能会有部分功能缺失)