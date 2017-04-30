package filter;

/**
 * Created by peterchen on 2017/4/30.
 */
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**过滤掉未登陆访问后续页面
 * Created by peter on 2017/2/17.
 */
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
       /* HttpSession session =((HttpServletRequest)req).getSession();
        if(session.getAttribute("user")==null){
            ((HttpServletResponse)resp).sendRedirect("/index.jsp");
        }*/
        String url = ((HttpServletRequest)req).getServletPath();
        HttpSession session =((HttpServletRequest)req).getSession();
        if(url.indexOf("index.jsp")!=-1||session.getAttribute("user")!=null){
            chain.doFilter(req, resp);
        }else{
            ((HttpServletResponse)resp).sendRedirect("/index.jsp");
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}

