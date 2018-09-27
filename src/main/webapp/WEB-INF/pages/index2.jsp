<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 15471
  Date: 2018/8/16
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../bootstrap-3.3.7/docs/favicon.ico">

    <title>技术博客系统</title>

    <!-- bootstrap-3.3.7 core CSS -->
    <link href="../bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../bootstrap-3.3.7/docs/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../bootstrap-3.3.7/docs/examples/jumbotron/jumbotron.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../bootstrap-3.3.7/docs/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../bootstrap-3.3.7/docs/assets/js/ie-emulation-modes-warning.js"></script>

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
    function logout() {


    }
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
                    <c:if test="${!empty sessionScope.user}">
                        <ul class="dropdown-menu ">
                            <li><a href="/admin/users/show/${sessionScope.user.id}">资料</a></li>
                            <li><a href="/admin/blogs">博客</a></li>
                            <li><a href="#">收藏博客</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">推送</li>
                            <li role="presentation" ><a href="#">消息        <span class="badge">3</span></a></li>
                            <li role="presentation" ><a href="#">感兴趣的        <span class="badge">3</span></a></li>
                        </ul>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <ul class="dropdown-menu ">
                            <li class="dropdown-header">未登录？</li>
                            <li><a href="/login">已有账号，去登陆 &raquo;</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">还没有账号？</li>
                            <li><a href="/admin/users/add">去注册一个吧~</a></li>
                        </ul>
                    </c:if>
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
<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
    <div class="container">
        <c:if test="${empty sessionScope.user}">
        <h1>你好，参访者！</h1>
            <p>欢迎来到技术博客系统，在这里你能学习到更多的知识，充实自己，提升自己！ </p>
            <p><a class="btn btn-primary btn-lg" href="/login" role="button">去登陆 &raquo;</a></p>
        </c:if>
        <c:if test="${!empty sessionScope.user}">
            <h1>你好，${sessionScope.user.nickname}</h1>
            <p>欢迎登陆技术博客系统，点击<label >了解更多</label>来熟悉该系统吧！ </p>
            <p><a class="btn btn-primary btn-lg" href="/moreInfo" role="button">了解更多 &raquo;</a><a class="btn btn-danger btn-lg " onclick="" role="button" style="margin-left: 20px;" href="/logout">登出，再会！</a></p>

        </c:if>

    </div>
</div>

<div class="container">





    <div class="page-header">
    <h2>精选博客</h2>
        <c:if test="${empty sessionScope.user}">
        <div class="alert alert-warning" role="alert">
        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>没有用户登陆，请先登录。</a>
        </div>
        </c:if>
    <div class="row">
        <%--<c:forEach items="${blogList}" var="blog">--%>
            <%--<div class="col-sm-4 " >--%>
                <%--<div class="panel panel-default ">--%>
                    <%--<div class="panel-heading">--%>
                        <%--<h3 class="panel-title">${blog.title}  <a class="badge">By:${blog.userByUserId.nickname}</a></h3>--%>
                    <%--</div>--%>
                    <%--<div class="panel-body " style="height: auto">--%>
                            <%--<p style="text-indent:2em;"> ${desc.get(blog.id)}</p>--%>
                    <%--</div>--%>
                    <%--<div class="panel-footer ">--%>
                            <%--<a href="/admin/blogs/show/${blog.id}" type="button" class="btn btn-sm btn-success col-xs-3">详情</a>--%>
                            <%--<a href="/admin/blogs/update/${blog.id}" type="button" class="btn btn-sm btn-warning col-xs-3 ">标记</a>--%>
                            <%--<a href="/admin/blogs/delete/${blog.id}" type="button" class="btn btn-sm btn-danger col-xs-offset-3">不感兴趣</a>--%>

                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</c:forEach>--%>


                <div class="col-sm-4">
                    <c:forEach items="${blogs1}" var="blog1">

                    <div class="panel panel-default ">
                    <div class="panel-heading">
                        <h3 class="panel-title">${blog1.title}  <a class="badge" style="background-color: #000000">By:${blog1.userByUserId.nickname}<img src="../img/visit.png" style="width: 20px;height: 20px;margin-left: 10px;" >220</a>
                        </h3>
                    </div>
                    <div class="panel-body " style="height: auto">
                    <p style="text-indent:2em;"> ${desc.get(blog1.id)}</p>
                    </div>
                        <div class="panel-footer ">
                            <div class="row"  >

                                <a href="/admin/blogs/show/${blog1.id}" type="button" class="btn btn-sm btn-success col-xs-3" style="width: 80px ;margin-left: 50px">详情</a>
                                <a href="/admin/blogs/update/${blog1.id}" type="button" class="btn btn-sm btn-warning col-xs-3 " style="width: 80px;margin-left: 10px">标记</a>
                                <a href="/admin/blogs/delete/${blog1.id}" type="button" class="btn btn-sm btn-danger col-xs-3" style="width: 80px;margin-left: 10px">不感兴趣</a>
                            </div>
                        </div>
                    </div>

                    </c:forEach>
                    </div>
                <div class="col-sm-4">
                    <c:forEach items="${blogs2}" var="blog2">

                            <div class="panel panel-default ">
                                <div class="panel-heading">
                                    <h3 class="panel-title">${blog2.title}  <a class="badge" style="background-color: #000000">By:${blog2.userByUserId.nickname}<img src="../img/visit.png" style="width: 20px;height: 20px;margin-left: 10px;" ></a>
                                </h3>
                                </div>
                                <div class="panel-body " style="height: auto">
                                    <p style="text-indent:2em;"> ${desc.get(blog2.id)}</p>
                                </div>
                                <div class="panel-footer ">
                                <div class="row"  >

                                    <a href="/admin/blogs/show/${blog2.id}" type="button" class="btn btn-sm btn-success col-xs-3" style="width: 80px ;margin-left: 50px">详情</a>
                                    <a href="/admin/blogs/update/${blog2.id}" type="button" class="btn btn-sm btn-warning col-xs-3 " style="width: 80px;margin-left: 10px">标记</a>
                                    <a href="/admin/blogs/delete/${blog2.id}" type="button" class="btn btn-sm btn-danger col-xs-3" style="width: 80px;margin-left: 10px">不感兴趣</a>
                                </div>
                                </div>

                            </div>

                    </c:forEach>
                </div>


                <div class="col-sm-4">
                    <c:forEach items="${blogs3}" var="blog3">

                            <div class="panel panel-default ">
                                <div class="panel-heading">
                                    <h3 class="panel-title">${blog3.title}  <a class="badge" style="background-color: #000000">By:${blog3.userByUserId.nickname}<img src="../img/visit.png" style="width: 20px;height: 20px;margin-left: 10px;" >110</a>
                                    </h3>
                                </div>
                                <div class="panel-body " style="height: auto">
                                    <p style="text-indent:2em;"> ${desc.get(blog3.id)}</p>
                                </div>
                                <div class="panel-footer ">
                                    <div class="row"  >

                                        <a href="/admin/blogs/show/${blog3.id}" type="button" class="btn btn-sm btn-success col-xs-3" style="width: 80px ;margin-left: 50px">详情</a>
                                        <a href="/admin/blogs/update/${blog3.id}" type="button" class="btn btn-sm btn-warning col-xs-3 " style="width: 80px;margin-left: 10px">标记</a>
                                        <a href="/admin/blogs/delete/${blog3.id}" type="button" class="btn btn-sm btn-danger col-xs-3" style="width: 80px;margin-left: 10px">不感兴趣</a>
                                    </div>
                            </div>
                            </div>

                    </c:forEach>
                </div>


    </div>

        <p><a class="btn btn-default" href="/login2" role="button">更多&raquo;</a></p>
        <%--</c:if>--%>



    </div>

<div>
    <footer>
        <p>&copy; 2018 Company, Inc.</p>
    </footer>
</div>
</div> <!-- /container -->

<!-- bootstrap-3.3.7 core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../bootstrap-3.3.7/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="../bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../bootstrap-3.3.7/docs/assets/js/ie10-viewport-bug-workaround.js"></script>


</body>
</html>

