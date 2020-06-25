/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author xiangmacbook
 */
public class ChatHistory_List {
    public ArrayList<ChatHistoryInfo> list;
    
    public ChatHistory_List() {
        list = new ArrayList<ChatHistoryInfo>();
    }
    
    public ArrayList<ChatHistoryInfo> getList(){
        return this.list;
    }
    
    public void setList(ChatHistoryInfo ChatHistoryInfo){
        list.add(ChatHistoryInfo);
    }
}
