/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.servlets;

import com.esr.database.FeedbackDao;
import com.esr.database.RestaurantDao;
import com.esr.helper.ConnectionProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.esr.entities.Feedback;
import com.esr.entities.Message;
import com.esr.entities.Customer;
import com.esr.entities.Restaurant;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author areeb
 */
public class FeedbackServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String comment = request.getParameter("comment");
            Float rating = Float.parseFloat((request.getParameter("rating")));

            Cookie[] cookies = request.getCookies();
            boolean f = false;
            String name = "";
            if (cookies == null) {
                    //new user left part because we are dealing with login must
                    //out.println("empty");
            } else {
                for (Cookie c : cookies) {
                    String tname = c.getName();
                    if (tname.equals("getmyid")) {
                        name = c.getValue();
                        //out.println("empty1");
                    }
                }
            }
            int restaurantId = Integer.parseInt(name);
            
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("CustomerUser");
            
            Feedback fb = new Feedback(comment,rating,restaurantId,customer.getId());
            FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());
           
            
             if (dao.saveFeedback(fb)) {;
                //          successfully Inserted
            //    HttpSession s = request.getSession();
             //   s.setAttribute("restaurantList", res);
             out.println("Feedback Received Successfully");   
             //response.sendRedirect("viewRestaurant.jsp");
            } else {
//                error///
                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
           //     s.setAttribute("restaurantList", res);
                s.setAttribute("msg", msg);
                
                response.sendRedirect("feedbackPage.jsp");

            }


//            out.print("SUCCESFULLLL");
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
