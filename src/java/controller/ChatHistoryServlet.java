/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbconnection.DBconnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author xiangmacbook
 */
public class ChatHistoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChatHistoryServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatHistoryServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        request.setCharacterEncoding("UTF-8");
        String message = request.getParameter("message");
        
        HttpSession session = request.getSession();
        try{
            String uid = session.getAttribute("id").toString();
            String[] mess = message.split("::",2);
            
            String[] ids = mess[0].split("--",2);
            //System.out.println(ids[0] + " " + ids[1]);
//            System.out.println(mess[0] + " And " + ids[0] + " " + ids[1]);
            DBconnect DB = new DBconnect();
            
            //message sent by current user 
            if(ids[0].equals(uid)){
                DB.InsertChatHistory(uid, ids[1], mess[1]);
                DB.increaseUnread(ids[1],uid );
            } else {
                //message recieved from other user
                DB.InsertChatHistory(ids[1], uid , mess[1]);
                DB.increaseUnread(uid,ids[1]);
            }
        } catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }
        
//        System.out.println(message);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
