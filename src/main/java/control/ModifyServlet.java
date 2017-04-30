package control;

/**
 * Created by peterchen on 2017/4/30.
 */
import model.StudentInfo;
import service.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ModifyServlet")
public class ModifyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentID = request.getParameter("studentid");
        StudentDao studentDao = new StudentDao();
        StudentInfo studentInfo = studentDao.queryStudentInfo(studentID);
        if(studentInfo!=null){
            HttpSession session = request.getSession();
            session.setAttribute("studentInfo",studentInfo);
        }
        response.sendRedirect("/modifyStudentInfoSingle.jsp");
    }
}

