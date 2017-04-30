package control;

/**
 * Created by peterchen on 2017/4/30.
 */
import model.Page;
import model.StudentInfo;
import service.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));
        StudentDao studentDao = new StudentDao();
        List<StudentInfo> list = studentDao.getAllStudentInfo();
        Page page = new Page(10,currentPage,list);
        request.setAttribute("page",page);
        String modifyOrDelete = request.getParameter("modifyOrDelete");
        if("1".equals(modifyOrDelete)){
            request.getRequestDispatcher("/modifyStudentInfo.jsp").forward(request,response);//如果是修改页面
        }else{
            request.getRequestDispatcher("/deleteStudentInfo.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
