<p align="center">
  <a href="http://nav.untview.top/">
    <img src="pubilc/assets/image/logo.png" width="80" />
  </a>
  <br />
  <b>耕云导航</b>
  <p align="center">一款基于Vue3、Vite、Naive-UI和ThinkPHP6.0的前后台分离的简洁</p>
  <p align="center"> 自适应开源导航网站，包含多种页面布局和卡片模式，优化内容提升用户体验。</p>
  <p align="center">
    <a href="README.md">
      <img src="https://img.shields.io/badge/lang-%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87-red.svg?longCache=true&style=flat-square">
    </a>
  </p>
</p>

<br />
<br />

## 使用须知

- 本人开发能力不是很牛，哪些很厉害的大神不要用了再喷！！！
- 耕云导航目前为v1.0.0版本，后会继续更新增加新功能；也欢迎大家提出宝贵建议。



## 仓库

#### Github
- 前台源码
[gengyun-nav](https://gitee.com/song-xiansen/gengyun-nav)
- 后台源码
[gengyun-nav-system](https://gitee.com/song-xiansen/gengyun-nav-system)
- 服务端源码
[gengyun-nav-server](https://gitee.com/song-xiansen/gengyun-nav-server)


#### Gitee
- 前台源码
[gengyun-nav](https://gitee.com/song-xiansen/gengyun-nav)
- 后台源码
[gengyun-nav-system](https://gitee.com/song-xiansen/gengyun-nav-system)
- 服务端源码
[gengyun-nav-server](https://gitee.com/song-xiansen/gengyun-nav-server)



## 服务端搭建 部署

运行环境要求PHP7.1+，兼容PHP8.0。 [THINKPHP6.0](./README_TP)

``` bash
# 下载
git clone  https://gitee.com/song-xiansen/gengyun-nav-server.git

cd gengyun-nav

# SQL数据导入 
将sql文件夹中的data.sql 导入到数据库

# 配置数据库
打开文件夹config/database.php 配置
# 数据库名
'database' => 'test'
# 用户名
'username' => 'test'
#  密码
'password' => 'test12345'

```



## 更新日志
[CHANGELOG](https://gitee.com/song-xiansen/gengyun-nav-server/releases)


## 建议
如果有任何功能上的建议可通过 [issue](https://gitee.com/song-xiansen/gengyun-nav-server/issues) 发起, Thank you.

## 微信公众号
关注 `耕云计划` 微信公众号，第一时间了解最新信息。

<img src="pubilc/assets/image/weixin-gzh.jpg" width="120" />

## 赞赏
如果你觉得这个项目帮助到了你，赏一杯奶茶给作者吧 🫰🫰🫰。<br/>
开源不易, 有了您的赞助, 我们会做的更好~

<img src="pubilc/assets/image/appreciate.jpg" width="400" />

## 协议
[MIT](./LICENSE)