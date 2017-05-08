<%@ page import="model.StudentInfo" %><%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/18
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        StudentInfo studentInfo = (StudentInfo) session.getAttribute("studentInfo");

    %>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function initParameters() {
            var sex = "<%=studentInfo.getSex()%>";
            if (sex == "男") {
                document.getElementById("male").checked = true;
            } else {
                document.getElementById("female").checked = true;
            }
            var majors = document.getElementById("major");
            for (var i = 0; i < majors.length; i++) {
                if (majors[i].innerText == "<%=studentInfo.getMajor()%>") {
                    majors[i].selected = true;
                    break;
                }
            }
        }
    </script>
</head>
<body onload="initParameters()">
<div style="margin-left: 20%;margin-top: 10%">
    <form method="post" role="form" class="form-horizontal" action="/addStudentInfo">
        <div class="form-group">
            <label>学号</label><input type="text" name="studentID" readonly="true" value="<%=studentInfo.getStudentID()%>"disabled>
        </div>
        <div class="form-group">
            <label>姓名</label><input type="text" name="studentName" value="<%=studentInfo.getStudentName()%>"><br>
        </div>
        <div class="form-group">
            <label>年龄</label><input type="text" name="age" value="<%=studentInfo.getAge()%>">
        </div>
        <div class="form-group">
            性别&nbsp;&nbsp;<label><input type="radio" name="sex" value="男" id="male">&nbsp;&nbsp;男&nbsp;&nbsp;</label><label><input type="radio" name="sex"
                                                                                                value="女" id="female">&nbsp;&nbsp;女</label>
        </div>
        <div class="form-group">
            专业<select name="major" id="major">
            <option value="计算机科学">计算机科学</option>
            <option value="通信工程">通信工程</option>
            <option value="软件工程">软件工程</option>
            <option value="电子商务">电子商务</option>
            <option value="网络工程">网络工程</option>
        </select>
        </div>
        <div class="form-group"><input type="hidden" name="flag" value="2"></div>
        <div class="form-group"><button type="submit" class="btn btn-primary btn-lg" id="submit">修改</button></div>
    </form>
</div>
</body>
</html>
