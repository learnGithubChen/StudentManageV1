<%@ page import="model.StudentInfo" %><%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/18
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        function queryStudentInfo() {
            var httpRequest = new XMLHttpRequest();
            var studentID = document.getElementById("studentID").value;
            if(studentID!=""){
                httpRequest.open("Get", "/queryStudentInfo?studentID=" + studentID, true);
            }else{
                var studentName = document.getElementById("studentName").value;
                httpRequest.open("Get", "/queryStudentInfo?studentName=" + encodeURI(encodeURI(studentName)), true);
            }

            httpRequest.send();
            httpRequest.onreadystatechange = function () {
                if (httpRequest.readyState == 4 && httpRequest.status == 200) {
                    var stuInfo = httpRequest.responseText.split("#");
                    var reFormStuInfo="";
                    for(var i=0;i<stuInfo.length;i++){
                        reFormStuInfo+=stuInfo[i]+"<br>"+"<hr>";
                    }
                    document.getElementById("queryStudentInfo").innerHTML = reFormStuInfo;
                }
            }
        }
    </script>
    <link href="css/queryStudentInfo.css" type="text/css" rel="stylesheet">
</head>
<body>
<input type="text" name="studentID" id="studentID" placeholder="学号查询">
<input type="text" name="studentName" id="studentName" placeholder="姓名查询"><br>
<input type="button" onclick="queryStudentInfo();" value="查询">
<div id="queryStudentInfo"></div>
</body>
</html>
