<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户锁定及解锁</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>板块专区</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Main Style Sheet -->
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <!--<link href="css/signin.css" rel="stylesheet">-->
    <!-- Modernizr -->
    <script src="<c:url value="/js/vendor/modernizr-2.6.2.min.js" />"></script>

    <script src="<c:url value="/js/vendor/respond.min.js" />"></script>


</head>
<body>


<header role="banner">
    <nav role="navigation" class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<c:url value="/index.html"/> "><img src="<c:url value="/img/logo.png"/>" alt="ThisUsCommunity'" width="200px"></a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <%--<li><a href="<c:url value="/index.html"/> "><span class="glyphicon glyphicon-home"></span>主页</a></li>--%>
                    <c:if test="${!empty USER_CONTEXT.userName}">
                        <li>
                            <a href="<c:url value="/login/doLogout.html"/>"><span class="glyphicon glyphicon-remove">${USER_CONTEXT.userName}(${USER_CONTEXT.credit}),注销${USER_CONTEXT.userType}</a>
                        </li>
                    </c:if>
                    <c:if test="${empty USER_CONTEXT.userName}">
                        <li><a href="<c:url value="/login.jsp"/>"><span class="glyphicon glyphicon-upload"></span>登录</a></li>
                        <li><a href="<c:url value="/register.jsp"/>"><span class="glyphicon glyphicon-plus"></span>注册</a></li>
                    </c:if>
                    <li><a href="<c:url value="/index.html"/>"><span class="glyphicon glyphicon-list-alt"></span>社区内容</a></li>
                    <c:if test="${USER_CONTEXT.userType==2}">
                        <li>
                            <a href="<c:url value="/forum/addBoardPage.html"/>"><span class="glyphicon glyphicon-edit"></span>新建版块</a>
                        </li>
                        <li>
                            <a href="<c:url value="/forum/setBoardManagerPage.html"/>"><span class="glyphicon glyphicon-user"></span>管理员设置</a>
                        </li>
                        <li  class="active">
                            <a href="<c:url value="/forum/userLockManagePage.html"/>"><span class="glyphicon glyphicon-lock"></span>用户锁定/解锁</a>
                        </li>
                    </c:if>
                </ul>
                <form class="navbar-form navbar-left" role="search" action="<c:url value="/forum/searchTopic.html"/>">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="topicName">
                    </div>
                    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                </form>
            </div><!--/.nav-collapse -->
        </div><!--/.container -->
    </nav>
</header>


<form action="<c:url value="/forum/userLockManage.html"/> " method="post" >
    <table border="1px" width="100%">
        <tr>
            <td width="20%">用户</td>
            <td width="80%"><select name="userName">
                <option>请选择</option>
                <c:forEach var="user" items="${users}">
                    <option value="${user.userName}">${user.userName}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td width="20%">锁定/解锁</td>
            <td width="80%">
                <input type="radio" name="locked" value="1" />锁定
                <input type="radio" name="locked" value="0" />解锁
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="保存">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>



</body>
</html>
