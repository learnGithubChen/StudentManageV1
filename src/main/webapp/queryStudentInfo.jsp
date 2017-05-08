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
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div style="width: 30%;margin-left: 10%;margin-top: 5%">
    <div class="form-group">
        <input type="text" name="studentID" id="studentID" placeholder="请输入学号" class="form-control">
    </div>
    <div class="form-group">
        <input type="text" name="studentName" id="studentName" placeholder="请输入姓名" class="form-control"><br>
    </div>
    <div class="form-group">
        <button type="button"class="btn btn-primary btn-lg" onclick="queryStudentInfo()">查询</button>
    </div>
</div>
<hr>
<div id="queryStudentInfo"></div>
</body>
</html>
