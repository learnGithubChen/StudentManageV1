<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/18
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="css/addStudentInfo.css" type="text/css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<body>
<div>
    <form role="form" method="post" action="addStudentInfo" class="form-horizontal">
        <div class="form-group">
            <label>学号</label>
            <input type="text" name="studentID" placeholder="请输入学号">
        </div>
        <div class="form-group">
            <label>姓名</label>
            <input type="text" name="studentName" placeholder="请输入姓名">
        </div>
        <div class="form-group">
            <label>年龄</label>
            <input type="text" name="age" required placeholder="请输入年龄">
        </div>
        <div class="form-group">
            <label>男&nbsp;&nbsp;<input type="radio" name="sex" value="男"></label>&nbsp;&nbsp;&nbsp;&nbsp;
            <label>女&nbsp;&nbsp;<input type="radio" name="sex" value="女"></label>
        </div>
        <div class="form-group">
            <label>专业</label>
            <select name="major" class="form-control">
                <option value="计算机科学">计算机科学</option>
                <option value="通信工程">通信工程</option>
                <option value="软件工程">软件工程</option>
                <option value="电子商务">电子商务</option>
                <option value="网络工程">网络工程</option>
            </select>
        </div>
        <input type="hidden" name="flag" value="1">
        <div class="form-group">
            <button type="submit" class="btn btn-primary" id="submit">添加</button>
        </div>
    </form>
</div>
</body>
</html>
