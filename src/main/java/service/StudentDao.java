package service;

/**
 * Created by peterchen on 2017/4/30.
 */
import conn.SQLConnection;
import model.StudentInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {
    private static SQLConnection sqlConnection = new SQLConnection();
    private static Connection connection = sqlConnection.getConnection();
    //添加学生信息
    public boolean addStudentInfo(StudentInfo studentInfo){
        String insert_studentInfo = "insert into studentinfo(studentid,studentname,age,sex,major) values(?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(insert_studentInfo);
            ps.setString(1,studentInfo.getStudentID());
            ps.setString(2,studentInfo.getStudentName());
            ps.setString(3,studentInfo.getAge());
            ps.setString(4,studentInfo.getSex());
            ps.setString(5,studentInfo.getMajor());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //修改学生信息
    public boolean modifyStudentInfo(StudentInfo studentInfo){
        String update_studentInfo = "update studentinfo set studentname=?,age=?,sex=?,major=? where studentid=?";
        try {
            PreparedStatement ps=connection.prepareStatement(update_studentInfo);
            ps.setString(1,studentInfo.getStudentName());
            ps.setString(2,studentInfo.getAge());
            ps.setString(3,studentInfo.getSex());
            ps.setString(4,studentInfo.getMajor());
            ps.setString(5,studentInfo.getStudentID());
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        }
        return true;
    }
    //删除学生信息
    public boolean deleteStudentInfo(String studentID){
        String delete_studentInfo = "delete  from studentinfo where studentid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(delete_studentInfo);
            ps.setString(1,studentID);
            ps.execute();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //查询单个学生信息
    public StudentInfo queryStudentInfo(String studentID){
        String query_singleStudentInfo = "select * from studentinfo where studentid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(query_singleStudentInfo);
            ps.setString(1,studentID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String studentName = rs.getString(2);
                String age = rs.getString(3);
                String sex = rs.getString(4);
                String major = rs.getString(5);
                StudentInfo studentInfo = new StudentInfo(studentID,studentName,age,sex,major);
                return studentInfo;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    //根据姓名查找学生
    public List<StudentInfo> queryStudentInfoByName(String studentName){
        String queryByName = "select * from studentinfo where studentname=?";
        List<StudentInfo> list = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement(queryByName);
            ps.setString(1,studentName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                String studentId = rs.getString(1);
                String age = rs.getString(3);
                String sex = rs.getString(4);
                String major = rs.getString(5);
                StudentInfo stuInfo = new StudentInfo(studentId,studentName,age,sex,major);
                list.add(stuInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //查询所有学生信息
    public List<StudentInfo> getAllStudentInfo(){
        String query_all = "select * from studentinfo";
        List<StudentInfo> list = new ArrayList<StudentInfo>();
        try {
            PreparedStatement ps = connection.prepareStatement(query_all);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                StudentInfo studentInfo = new StudentInfo(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                list.add(studentInfo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

