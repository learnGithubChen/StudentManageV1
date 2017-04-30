package conn;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by peterchen on 2017/4/30.
 */
public class SQLConnection {
   /* public static  final String DRIVER ="com.mysql.jdbc.Driver";
    public  static final String URL = "jdbc:mysql://localhost:3306/test";
    public static final String USER = "root";
    public static final String PASSWORD = "mysql123";*/
   private static Connection conn = null;
    //连接数据库
    public Connection getConnection(){
        if(conn!=null){
            return conn;
        }
        //加载properties文件
        Properties properties = new Properties();
        InputStream inputStream = SQLConnection.class.getClassLoader().getResourceAsStream("database.properties");
        try {
            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //加载mysql驱动
        try {
            String driver = properties.getProperty("test.driver");
            Class.forName(driver);
            System.out.println("驱动加载成功");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("驱动加载失败");
        }
        try {
            String url = properties.getProperty("test.url");
            String user = properties.getProperty("test.user");
            String password = properties.getProperty("test.password");
            conn = DriverManager.getConnection(url,user,password);
            System.out.println("数据库连接成功");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("数据库连接失败");
        }
        return conn;
    }
}
