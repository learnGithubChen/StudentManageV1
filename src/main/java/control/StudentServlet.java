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
import java.io.IOException;

/**处理学生信息相关操作
 * Created by peter on 2017/2/18.
 */
@WebServlet(name = "StudentServlet")
public class StudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//防止出现中文乱码
        String studentID = request.getParameter("studentID");
        String flag = request.getParameter("flag");//判断是插入还是修改，1表示插入，2表示修改，3表示删除
        if("1".equals(flag)||"2".equals(flag)){
            String studentName = request.getParameter("studentName");
            String age = request.getParameter("age");
            String sex = request.getParameter("sex");
            String major = request.getParameter("major");
            StudentInfo studentInfo = new StudentInfo(studentID,studentName,age,sex,major);
            StudentDao studentDao = new StudentDao();
            if("1".equals(flag)){
                boolean addResult = studentDao.addStudentInfo(studentInfo);//插入学生信息
                if(addResult){
                    response.sendRedirect("addStudentInfo_success.jsp");
                }else{
                    //插入失败
                }
            }else{
                boolean modifyResult = studentDao.modifyStudentInfo(studentInfo);//修改学生信息
                if(modifyResult){
                    //修改学生信息成功
                    response.sendRedirect("modifyStudentInfo_success.jsp");
                }else{
                    //修改失败
                }
            }

        }else if("3".equals(flag)){
            //如果是删除
            StudentDao studentDao =new StudentDao();
            boolean deleteResult= studentDao.deleteStudentInfo(studentID);
            if(deleteResult){
                response.sendRedirect("deleteStudentInfo_success.jsp");
            }
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
