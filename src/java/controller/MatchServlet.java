/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbconnection.DBconnect;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Chat_List;
import net.sf.json.JSONArray;

/**
 *
 * @author xiangmacbook
 */
public class MatchServlet extends HttpServlet {

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
            out.println("<title>Servlet MatchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MatchServlet at " + request.getContextPath() + "</h1>");
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
        String language = request.getParameter("language");
        String country = request.getParameter("country");
        String sex = request.getParameter("sex");
        String minAge = request.getParameter("min");
        String maxAge = request.getParameter("max");
        
        DBconnect DB = new DBconnect();
        HttpSession session = request.getSession();
        try{
            String uid = session.getAttribute("id").toString();
            Chat_List list = DB.getFriendList(uid);
            request.setAttribute("friend_list", list.getList());
            
           
            
            Chat_List list2 = DB.FindMatch(language, country, sex, minAge, maxAge, uid);
            request.setAttribute("match_results", list2.getList());
        } catch(NullPointerException e){
            response.sendRedirect("index.jsp");
        }
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/Chat_Match.jsp");
            rd.forward(request, response);
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
       response.setCharacterEncoding("UTF-8");
       HttpSession session = request.getSession();
       try{
            String fid = request.getParameter("fid").toString();
            
            String userName = session.getAttribute("userName").toString();
            String lang = session.getAttribute("language").toString();
            String profile_pic = session.getAttribute("Profile_pic").toString();
            String uid = session.getAttribute("id").toString();
            DBconnect DB = new DBconnect();
            DB.InsertFriendList(uid, fid, lang, userName, profile_pic); 

            Chat_List list = DB.getOneFriend(uid, fid);
            list.getList();

            response.setContentType("application/json");
            response.getWriter().write(JSONArray.fromObject(list.getList()).toString());
            System.out.println(JSONArray.fromObject(list.getList()).toString());
       } catch(NullPointerException e){
            response.sendRedirect("index.jsp");
       }
        
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
