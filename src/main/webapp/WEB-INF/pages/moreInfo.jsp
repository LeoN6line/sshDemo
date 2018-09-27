<%--
  Created by IntelliJ IDEA.
  User: 15471
  Date: 2018/9/11
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>更多信息</title>


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


     <!-- Custom styles for this template -->
    <link href="../css/carousel.css" rel="stylesheet">
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
                            <li><a href="/admin/users/show/${sessionScope.user.id}">资料</a></li>
                            <li><a href="/admin/blogs">博客</a></li>
                            <li><a href="#">收藏博客</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">推送</li>
                            <li role="presentation" ><a href="#">消息        <span class="badge">3</span></a></li>
                            <li role="presentation" ><a href="#">感兴趣的        <span class="badge">3</span></a></li>
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
<!-- Carousel
    ================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="../img/slide1.jpg" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>欢迎阅读系统介绍!</h1>
                    <p>技术博客系统是XX工作室内部博客交流系统，用于工作室的内部博客分享，技术讨论。同时向<code><a href = "https://bbs.csdn.net/home">CSDN</a></code>、<code><a href = "https://www.cnblogs.com/">博客园</a></code>、<code><a href = "https://www.oschina.net/">开源中国</a></code>等博客论坛致敬。</p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="../img/slide2.jpg" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>技术博客系统与同你一起探索未来！</h1>
                    <p>加入技术博客系统，积极交流，提升自己，创造一个和谐的CODE环境。</p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide" src="../img/slide3.jpg" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>技术无处不在，而“我”也无处不在</h1>
                    <p>有技术的地方就有技术博客系统，技术无处不在，而“我”也无处不在。</p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->

<div class="container">
<div align="center">
    <h2>部分功能</h2>
</div>
    <hr>
    <div class="row">
    <div class="col-sm-8" style="margin-top: 40px">
        <div class="well">
            <p>这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍</p>
        </div>
    </div>
    <div class="col-sm-4">
        <img src="../img/slide3.jpg" class="img-thumbnail">

    </div>
    </div>
    <div class="row">
    <div class="col-sm-4">
        <img src="../img/slide2.jpg" class="img-thumbnail">
    </div>
    <div class="col-sm-8" style="margin-top: 75px">
        <div class="well">
            <p>这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍</p>
        </div>
    </div>
    </div>
    <div class="row">
    <div class="col-sm-8" style="margin-top: 75px">
        <div class="well">
            <p>这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍这里是功能介绍</p>
        </div>
    </div>
    <div class="col-sm-4">
        <img src="../img/slide1.jpg" class="img-thumbnail">

    </div>
    </div>
    <div align="center">
        <h2>版本新功能</h2>

        <hr>

        <h4 > <p>1.增加博客标记功能</p>
             <p>2.增加了博客不感兴趣功能</p>
             <p>3.修复了部分bug</p>
             <p>4.杀了个程序员祭天</p>
            </h4>


    </div>

    <hr>
    <div>
        <footer>
            <p>&copy; 2018 Company, Inc.</p>
        </footer>
    </div>


</div>
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
