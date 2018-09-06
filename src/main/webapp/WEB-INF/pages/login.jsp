<%--
  Created by IntelliJ IDEA.
  User: 15471
  Date: 2018/8/17
  Time: 9:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../bootstrap-3.3.7/docs/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../bootstrap-3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../bootstrap-3.3.7/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../bootstrap/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<script type="text/javascript">
    $(document).ready(function () {
        $('.dropdown-toggle').dropdown();

    });
    function loginin() {
        document.getElementById("form1").submit();
    }

    //异步调用js实现
    // $(function(){
    //     var $btn=$(".btn");
    //     var username=$("#inputName").val();
    //     var password=$("#inputPassword").val();
    //     $btn.on(
    //         "click",function(){
    //             $.ajax({
    //                 url:"/loginAction",
    //                 data:username+password,
    //                 dataType:"json",
    //                 type:"post",
    //                 success:function(){
    //                     if(data==Fail){
    //                         alert("登陆失败！请重新输入")
    //                     }else{
    //                         alert("登陆成功！")
    //                     }
    //                 }
    //             })
    //         })
    // })
</script>
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
<h1 style= "margin-top:100px;" align="center">向CSDN致敬——技术连接你我</h1>

<c:if test="${!empty message}">
<div class="alert alert-warning" role="alert">
    <span class="glyphicon glyphicon-info-sign" aria-hidden="true" >${message}</span></a>
</div>
</c:if>
<div class="container">
<div  align="center" style="margin-top: 80px;background-color: #f5f5f5;height: auto;">
    <h1> 登 录 </h1>
    <h3><span class = "label label-default form-signin-heading" >技术博客系统</span></h3>
    <form class="form-signin" id="form1" action="/loginAction" method="post">
        <label for="nickname" class="sr-only">Nick Name</label>
        <input type="text" id="nickname" class="form-control text-center " placeholder="Nickname"  name="nickname" style="width: 400px;"required autofocus>
        <label for="password" class="sr-only">Password</label>
        <input type="password" id="password" class="form-control text-center " placeholder="Password"  name="password" style="width: 400px;margin-top: 5px" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住账号
            </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block " style="width: 400px;" type="submit" onclick="loginin();">登 入</button>
        <a href="/admin/users/add" class="text-info" style="margin-top: 5px">还没有账户，快去注册一个吧~</a>

    </form>
</div>
    <hr>
    <div>
        <footer>
            <p>&copy; 2018 Company, Inc.</p>
        </footer>
    </div>
</div> <!-- /container -->

<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../bootstrap-3.3.7/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="../bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../bootstrap-3.3.7/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
