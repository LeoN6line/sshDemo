<%--
  Created by IntelliJ IDEA.
  User: 15471
  Date: 2018/8/14
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>注册</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- Fixed navbar -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">技术博客系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <ul class="nav navbar-nav " role="tablist">
                <li  class="active"><a href="/index2">主页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的 <span class="caret"></span></a>

                        <ul class="dropdown-menu ">
                            <li class="dropdown-header">未登录？</li>
                            <li><a href="/login">已有账号，去登陆 &raquo;</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">还没有账号？</li>
                            <li><a href="/admin/users/add">去注册一个吧~</a></li>
                        </ul>

                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于 <span class="caret"></span></a>
                    <ul class="dropdown-menu ">
                        <li><a href="#">设置</a></li>
                        <li><a href="#">帮助与反馈</a></li>
                        <li role="separator" class="divider"></li>
                        <li class="dropdown-header">新版本</li>
                        <li role="presentation" ><a href="#">新功能        <span class="badge">NEW!</span></a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<div class="container ">
    <h1 style= "margin-top:100px;" align="center">向CSDN致敬——技术连接你我</h1>

    <div  align="center" style="margin-top:80px;background-color: #f5f5f5;height: auto;">
        <h1> 注 册 </h1>
        <h3><span class = "label label-default form-signin-heading" >技术博客系统</span></h3>
    <form:form action="/admin/users/addP" method="post" commandName="user" role="form" >


            <label for="nickname" class="sr-only">昵称:</label>
            <input type="text" class="form-control text-center" id="nickname" name="nickname" placeholder="Enter Nickname:" style="width: 400px;margin-top: 5px" />


            <label for="firstName" class="sr-only">姓:</label>
            <input type="text" class="form-control text-center" id="firstName" name="firstName" placeholder="Enter FirstName:" style="width: 400px;margin-top: 5px"/>


            <label for="lastName" class="sr-only">名:</label>
            <input type="text" class="form-control text-center" id="lastName" name="lastName" placeholder="Enter LastName:" style="width: 400px;margin-top: 5px"/>


            <label for="password" class="sr-only">密码:</label>
            <input type="text" class="form-control text-center" id="password" name="password" placeholder="Enter Password:" style="width: 400px;margin-top: 5px"/>

        <div class="form-group">
            <button type="submit" class="btn btn-lg btn-success" style="width: 400px;margin-top: 10px">提交</button>
            <p><a href="/login" class="text-info" style="margin-top: 5px">已经有账号了，我要登陆~</a>git</p>
        </div>
    </form:form>
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
