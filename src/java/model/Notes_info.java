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
public class Notes_info {
    private String SenderName;
    private String RecieverName;
    private Integer SenderID;
    private Integer RecieverID;
    private String message;
    
    public String getSenderName(){
        return this.SenderName;
    }
    public void setSenderName(String SenderName){
        this.SenderName = SenderName;
    }
    
    public String getRecieverName(){
        return this.RecieverName;
    }
    public void setRecieverName(String RecieverName){
        this.RecieverName = RecieverName;
    }
    
    public String getMessage(){
        return this.message;
    }
    public void setMessage(String message){
        this.message = message;
    }
    
    public Integer getSenderID(){
        return this.SenderID;
    }
    public void setSenderID(Integer ID){
        this.SenderID = ID;
    }
    
    public Integer getRecieverID(){
        return this.RecieverID;
    }
    public void setRecieverID(Integer ID){
        this.RecieverID = ID;
    }
}
