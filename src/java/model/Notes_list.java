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
public class Notes_list {
    public ArrayList<Notes_info> list;
    public Notes_list() {
        list = new ArrayList<Notes_info>();
    }
    
    public ArrayList<Notes_info> getList(){
        return this.list;
    }
    
    public void setList(Notes_info Notes_info){
        list.add(Notes_info);
    }
}
