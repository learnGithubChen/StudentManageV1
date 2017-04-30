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
<script type="text/javascript">
  function submitForm() {
      var httpRequest = new XMLHttpRequest();
      var username = document.getElementById("username").value;
      if(username==""){
          document.getElementById("userMsg").innerText = "请输入用户名";
          return;
      }
      var password = document.getElementById("password").value;
      if(password==""){
          document.getElementById("passwordMsg").innerText = "请输入密码";
          return;
      }
      httpRequest.open("get","/userServlet?username="+username+"&password="+password,true);
      httpRequest.send();
      httpRequest.onreadystatechange = function () {
          if(httpRequest.readyState==4&&httpRequest.status==200){
              var returnMessage = httpRequest.responseText;
              if(returnMessage=="error"){
                  document.getElementById("returnMessage").innerHTML = "用户名或者密码输入不正确";
              }else{
                  window.location.href = "main.jsp";
              }

          }
      }
  }
</script>
<link href="css/index.css" rel="stylesheet" type="text/css">
<body background="images/bg3.jpg" >
<div id="studentbg"><form action="userServlet" method="post" >
    <label id="webName">学生管理系统</label>
    <table id="userInfo">
        <tr>
            <td><label>用户名</label></td>
            <td><input type="text" name="username" id="username"><span id="userMsg"></span></td>
            <td><div id="returnMessage"></div></td>
        </tr>
        <tr>
            <td><label>密码</label></td>
            <td><input type="password" name="password" id="password" ><span id="passwordMsg"></span></td>
        </tr>
        <tr>
            <td colspan="2"><input id="submitButton" type="button" onclick="submitForm()" value="登录"></td>
        </tr>
    </table>
</form>
</div>

</body>
</html>
