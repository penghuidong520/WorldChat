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
public class Profile_list {
    public ArrayList<Profile_info> list;
    public Profile_list() {
        list = new ArrayList<Profile_info>();
    }
    
    public ArrayList<Profile_info> getList(){
        return this.list;
    }
    
    public void setList(Profile_info Profile_detail){
        list.add(Profile_detail);
    }
}
