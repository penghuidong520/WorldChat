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
public class Friend_List {
    public ArrayList<User_info> list;
    
    public Friend_List() {
        list = new ArrayList<User_info>();
    }
    
    public ArrayList<User_info> getList(){
        return this.list;
    }
    
    public void setList(User_info user_detail){
        list.add(user_detail);
    }
}