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
public class ChatHistoryInfo extends Notes_info{
    private Long timestamp;
    public Long getTimestamp(){
        return this.timestamp;
    }
    public void setTimestamp(Long timestamp){
        this.timestamp = timestamp;
    }
}
