<%@ page import="model.Page" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="model.StudentInfo" %>
<%@ page import="service.StudentDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: peter
  Date: 2017/2/18
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        Page page1 = (Page) request.getAttribute("page");
        if(page1==null){
            int currentPage = Integer.parseInt(request.getParameter("currentPage"));
            StudentDao studentDao = new StudentDao();
            List<StudentInfo> list = studentDao.getAllStudentInfo();
            page1 = new Page(10,currentPage,list);
            request.setAttribute("page",page1);//为了下面cif中取值
        }

    %>
</head>
<%--<link href="css/modifyStudentInfo.css" type="text/css" rel="stylesheet">--%>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<body>
<script type="text/javascript">
    var currentPage = ${page.currentPage};
    var totalPage = ${page.totalPage};

    //跳转到首页
    function firstPage() {
        if(currentPage==1){
            alert("已经是首页");
            return false;
        }
        if(currentPage>1){
            document.getElementById("first").href = "/pageServlet?currentPage=1&modifyOrDelete=1";
        }
    }
    //跳转到尾页
    function lastPage() {
        if(currentPage==totalPage){
            alert("已经是尾页");
            return false;
        }
        document.getElementById("last").href = "/pageServlet?currentPage="+totalPage+"&modifyOrDelete=1";
    }

    //上一页
    function previousPage() {
        if(currentPage==1){
            alert("已经是首页了");
            return false;
        }
        currentPage--;
        document.getElementById("previous").href = "/pageServlet?currentPage="+currentPage+"&modifyOrDelete=1";
    }

    //下一页
    function nextPage() {
        if(currentPage==totalPage){
            alert("已经是最后一页了");
            return false;
        }
        currentPage++;
        document.getElementById("next").href = "/pageServlet?currentPage="+currentPage+"&modifyOrDelete=1";
        return true;
    }
</script>
<table class="table table-hover">
    <thead>
    <td>学号</td>
    <td>姓名</td>
    <td>年龄</td>
    <td>性别</td>
    <td>专业</td>
    </thead>
    <%
        List<StudentInfo> dataList = page1.getDataList();
        for (int i = 0; i < dataList.size(); i++) {
            StudentInfo studentInfo = dataList.get(i);
    %>
    <tr>
        <td><%=studentInfo.getStudentID()%>
        </td>
        <td><%=studentInfo.getStudentName()%>
        </td>
        <td><%=studentInfo.getAge()%>
        </td>
        <td><%=studentInfo.getSex()%>
        </td>
        <td><%=studentInfo.getMajor()%>
        </td>
        <td><a href="/modifyServlet?studentid=<%=studentInfo.getStudentID()%>">修改</a></td>
    </tr>
    <%
        }
    %>
</table>
<div id="page">
    <c:if test="${fn:length(page.dataList) gt 0}">
    <hr>
    共${page.totalRecord}条记录,共${page.totalPage}页&nbsp;&nbsp;当前第${page.currentPage}页&nbsp;&nbsp;
    <a id="first" href="#" onclick="firstPage()">首页</a>
    <a id="previous" href="#" onclick="previousPage()">上一页</a>
    <a id="next" href="#" onclick="nextPage()">下一页</a>
    <a id="last" href="#" onclick="lastPage()">尾页</a>
    </c:if>
</body>
</html>
