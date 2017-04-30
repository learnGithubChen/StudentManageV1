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
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

/**处理查询请求的Servlet
 * Created by peter on 2017/2/19.
 */
@WebServlet(name = "QueryStudentInfoServlet")
public class QueryStudentInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("utf-8");//保证收到的中文不乱码
        String studentID = request.getParameter("studentID");
        String message_studentInfo = "";//用来存储查询结果
        StudentDao studentDao = new StudentDao();
        if(studentID!=null){//学号查询
            StudentInfo studentInfo=studentDao.queryStudentInfo(studentID);
            if(studentInfo!=null){
                message_studentInfo = "学号:"+studentInfo.getStudentID()+"姓名:"+studentInfo.getStudentName()+
                        "年龄:"+studentInfo.getAge()+"性别:"+studentInfo.getSex()+"专业:"+studentInfo.getMajor();
            }else{
                message_studentInfo="你要查找的学生不存在！";
            }
        }else{
            //姓名查询
            String studentName = URLDecoder.decode(request.getParameter("studentName"),"utf-8");
            List<StudentInfo> list = studentDao.queryStudentInfoByName(studentName);
            if(list.size()==0){
                message_studentInfo="你要查找的学生不存在！";
            }
            for(int i =0;i<list.size();i++){
                StudentInfo stuInfo = list.get(i);
                message_studentInfo+="学号:"+stuInfo.getStudentID()+"姓名:"+stuInfo.getStudentName()+
                        "年龄:"+stuInfo.getAge()+"性别:"+stuInfo.getSex()+"专业:"+stuInfo.getMajor();
                if(i<list.size()-1){
                    message_studentInfo+="#";
                }
            }
        }
        response.setCharacterEncoding("utf-8");//保证返回前台的不产生乱码
        PrintWriter out = response.getWriter();
        out.write(message_studentInfo);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}

