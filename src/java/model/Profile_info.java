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
public class Profile_info {
    private String UserName;
    private Integer ID;
    private String ProfilePic;
    private Integer sex;
    private String birth;
    private String description;
    private String location;
 
    
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }
    public String getLocation(){
        return this.location;
    }
    public void setLocation(String location){
        this.location = location;
    }
    
    public String getBirth(){
        return this.birth;
    }
    public void setBirth(String birth){
        this.birth = birth;
    }
    
    public String getUserName(){
        return this.UserName;
    }
    public void setUserName(String UserName){
        this.UserName = UserName;
    }
    
    public Integer getID(){
        return this.ID;
    }
    public void setID(Integer ID){
        this.ID = ID;
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
}
