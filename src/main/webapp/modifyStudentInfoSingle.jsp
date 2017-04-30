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
<form method="post" action="/addStudentInfo">
    <label>学号</label><input type="text" name="studentID" readonly="true" value="<%=studentInfo.getStudentID()%>"><br>
    <label>姓名</label><input type="text" name="studentName" value="<%=studentInfo.getStudentName()%>"><br>
    <label>年龄</label><input type="text" name="age" value="<%=studentInfo.getAge()%>"><br>
    性别:<label><input type="radio" name="sex" value="男" id="male">男</label><label><input type="radio" name="sex"
                                                                                        value="女"
                                                                                        id="female">女</label><br>
    专业:<select name="major" id="major">
    <option value="计算机科学">计算机科学</option>
    <option value="通信工程">通信工程</option>
    <option value="软件工程">软件工程</option>
    <option value="电子商务">电子商务</option>
    <option value="网络工程">网络工程</option>
</select>
    <input type="hidden" name="flag" value="2">
    </label><input type="submit" value="提交">
</form>
</body>
</html>
