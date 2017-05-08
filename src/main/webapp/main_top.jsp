<%@ page import="model.UserInfo" %><%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/17
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        UserInfo userInfo = (UserInfo) session.getAttribute("user");
        String username = "";
        if (userInfo != null) {
            username = userInfo.getUsername();
        }
    %>
    <script type="text/javascript"></script>
</head>
<body style="background-color: #2e6da4">
<marquee>欢迎<%=username%>登陆学生管理系统</marquee>
</body>
</html>
