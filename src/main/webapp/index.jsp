<%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/17
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生管理系统</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    function submitForm() {
        var httpRequest = new XMLHttpRequest();
        var username = document.getElementById("username").value;
        if (username == "") {
            document.getElementById("userMsg").style.display="inline-block";
            return;
        }
        var password = document.getElementById("password").value;
        if (password == "") {
            document.getElementById("passwordMsg").style.display = "inline-block";
            return;
        }
        httpRequest.open("get", "/userServlet?username=" + username + "&password=" + password, true);
        httpRequest.send();
        httpRequest.onreadystatechange = function () {
            if (httpRequest.readyState == 4 && httpRequest.status == 200) {
                var returnMessage = httpRequest.responseText;
                if (returnMessage == "error") {
                    document.getElementById("returnMsg").style.display = "inline-block";
                } else {
                    window.location.href = "main.jsp";
                }

            }
        }
    }
</script>
<body style="background-color: #2e6da4">
<div id="studentbg" class="center-block" style="width:40%;height: 40%;margin-top:10%;">
    <form role="form" action="userServlet" class="form-horizontal" method="post" style="margin-left: 30%;padding-top: 10%;position: relative">
        <label id="webName" style="font-size: large">学生管理系统</label>
        <div class="form-group">
            <span class="glyphicon glyphicon-user"></span>
            <input type="text" name="username" id="username">
            <div id="userMsg" class="alert alert-warning" style="display:none;height:15%">
                <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                    &times;
                </button>
                请输入用户名
            </div>
        </div>
        <div class="form-group">
            <span class="glyphicon glyphicon-lock"></span>
            <input type="password" name="password" id="password" >
            <div id="passwordMsg" class="alert alert-warning" style="display:none;height:15%">
                <button type="button" class="close" data-dismiss="alert"
                        aria-hidden="true">
                    &times;
                </button>
                请输入密码
            </div>
        </div>
        <div class="form-group">
            <input id="submitButton" class="btn btn-primary btn-lg" type="button" onclick="submitForm()" value="登录">
        </div>
        <div id="returnMsg" class="alert alert-danger" style="display:none;height:15%">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true">
                &times;
            </button>
            用户名或密码错误
        </div>
    </form>
</div>

</body>
</html>
