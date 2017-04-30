package control;

/**
 * Created by peterchen on 2017/4/30.
 */
import model.UserInfo;
import service.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**处理用户信息
 * Created by peter on 2017/2/17.
 */
@javax.servlet.annotation.WebServlet(name = "UserServlet")
public class UserServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");//保证前台传来数据不出现乱码
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserInfo userInfo = new UserInfo(username,password);
        UserDao userDao = new UserDao();
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        //检验用户和密码是否正确
        if(userDao.login(userInfo)){
            HttpSession session = request.getSession();
            session.setAttribute("user",userInfo);//将用户信息缓存到session
            out.write("success");
            //response.sendRedirect("main.jsp");//登陆到main页面
        }else {
            HttpSession session = request.getSession();
            out.write("error");
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
