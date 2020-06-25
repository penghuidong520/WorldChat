/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbconnection.DBconnect;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chat_List;
import model.Notes_list;
import model.Profile_list;

/**
 *
 * @author xiangmacbook
 */
public class ProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet ProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileServlet at " + request.getContextPath() + "</h1>");
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
         DBconnect DB = new DBconnect();
       
        HttpSession session = request.getSession();
         try{
             String uid = request.getParameter("id");
             String uid2 = session.getAttribute("id").toString();
             if(uid == null){
//                 System.out.println("enterd"+uid + uid2);
                 Profile_list list = DB.getProfileInfo(uid2);
                 Notes_list list2 = DB.getNotes(uid2);
                 Chat_List list3 = DB.getFriendList(uid2);
                 
                 request.setAttribute("profile", list.getList());
                 request.setAttribute("notes", list2.getList());
                 request.setAttribute("friend", list3.getList());
                 RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile.jsp");
                 rd.forward(request, response);
             } else {
                 Notes_list list2 = DB.getNotes(uid);
                 Profile_list list = DB.getProfileInfo(uid);
                 request.setAttribute("notes", list2.getList());
                 request.setAttribute("profile", list.getList());
                 RequestDispatcher rd = getServletContext().getRequestDispatcher("/profile_1.jsp");
                 rd.forward(request, response);
             }
         } catch(NullPointerException e){
            
             response.sendRedirect("index.jsp");
         }
         
        processRequest(request, response);
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
