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
<body>
<form method="post" action="addStudentInfo">
   <table>
       <tr><td><input type="text" name="studentID" required placeholder="请输入学号"></td></tr>
       <tr><td><input type="text" name="studentName" required placeholder="请输入姓名"></td></tr>
       <tr><td><input type="text" name="age" required placeholder="请输入年龄"></td></tr>
       <tr><td>男<input type="radio" name="sex" value="男" checked="true">&nbsp;&nbsp;&nbsp;&nbsp;女<input type="radio" name="sex" value="女"></td></tr>
       <tr><td>专业<select name="major">
               <option value="计算机科学">计算机科学</option>
               <option value="通信工程">通信工程</option>
               <option value="软件工程">软件工程</option>
               <option value="电子商务">电子商务</option>
               <option value="网络工程">网络工程</option>
           </select></td>
       </tr>
       <tr><td><input type="hidden" name="flag" value="1"></td></tr>
       <tr><td><input type="submit" value="提交" id="submit"></td></tr>
   </table>
</form>
</body>
</html>
