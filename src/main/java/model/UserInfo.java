package model;

/**
 * Created by peterchen on 2017/4/30.
 */
public class UserInfo {
    private String username;
    private String password;

    public UserInfo(){}

    public UserInfo(String username,String password){
        this.username = username;
        this.password = password;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
}

