<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/17
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/main_left.css" type="text/css" rel="stylesheet">
    <style type="text/css" rel="stylesheet">
        body{
            background-color: #2e6da4
        }
        a{
            text-decoration: none;
        }
    </style>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<ul class="nav nav-pills nav-stacked">
    <li><a href="addStudentInfo.jsp" target="main_right">添加学生信息</a></li>
    <li><a href="modifyStudentInfo.jsp?pageSize=10&currentPage=1" target="main_right">修改学生信息</a></li>
    <li><a href="queryStudentInfo.jsp" target="main_right">查询学生信息</a></li>
    <li><a href="deleteStudentInfo.jsp?pageSize=10&currentPage=1" target="main_right">删除学生信息</a></li>
    <li><a href="exitServlet" target="_top">退出</a></li>
</ul>
</body>
</html>
