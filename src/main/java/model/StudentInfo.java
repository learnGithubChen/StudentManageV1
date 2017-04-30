package model;

/**
 * Created by peterchen on 2017/4/30.
 */
public class StudentInfo {
    public String studentID;//学号
    public String studentName;//姓名
    public String sex;//性别
    public String age;//年龄
    public String major;//专业

    public StudentInfo(){}

    public  StudentInfo(String studentID,String studentName,String sex,String age,String major){
        this.studentID=studentID;
        this.studentName=studentName;
        this.sex=sex;
        this.age=age;
        this.major=major;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getStudentID() {
        return studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getSex() {
        return sex;
    }

    public String getAge() {
        return age;
    }

    public String getMajor() {
        return major;
    }


}

