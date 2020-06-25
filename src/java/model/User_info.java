/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author xiangmacbook
 */
public class User_info {
    private String UserName;
    private String email;
    private Integer ID;
    private String Language;
    private String Country;
    private Long time;
    private String ProfilePic;
    private Integer sex;
    private Integer age;
    private Integer fid;
    private Integer unread;
    private String Status;
    
        
    public String getStatus(){
        return this.Status;
    }
    public void setStatus(String Status){
        this.Status = Status;
    }
    
    public String getUserName(){
        return this.UserName;
    }
    public void setUserName(String UserName){
        this.UserName = UserName;
    }
    
    public String getEmail(){
        return this.email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    
    public String getLanguage(){
        return this.Language;
    }
    public void setLanguage(String Language){
        this.Language = Language;
    }
    
    public String getCountry(){
        return this.Country;
    }
    public void setCountry(String Country){
        this.Country = Country;
    }
    
    public Integer getID(){
        return this.ID;
    }
    public void setID(Integer ID){
        this.ID = ID;
    }
    
    public Integer getFID(){
        return this.fid;
    }
    public void setFID(Integer ID){
        this.fid = ID;
    }
    
   public Integer getUnread(){
        return this.unread;
    }
    public void setUnread(Integer unread){
        this.unread = unread;
    }
    
    public Long getTime(){
        return this.time;
    }
    public void seTime(Long time){
        this.time = time;
    }
    
    public String getProfilePic(){
        return this.ProfilePic;
    }
    public void setProfilePic(String ProfilePic){
        this.ProfilePic = ProfilePic;
    }
    
    public Integer getSex(){
        return this.sex;
    }
    public void setSex(Integer Sex){
        this.sex = Sex;
    }
    
    public Integer getAge(){
        return this.age;
    }
    public void setAge(Integer age){
        this.age = age;
    }
}
