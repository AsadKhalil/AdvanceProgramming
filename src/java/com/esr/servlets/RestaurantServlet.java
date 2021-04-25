/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.servlets;

import com.esr.database.RestaurantDao;
import com.esr.entities.Restaurant;
import com.esr.entities.Message;
import com.esr.entities.Owner;
import com.esr.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author areeb
 */
@MultipartConfig
public class RestaurantServlet extends HttpServlet {

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
//            fetch all form data

            String name1 = request.getParameter("res_name");
            String description1 = request.getParameter("res_description");
            String address1 = request.getParameter("res_address");
            String contact1 = request.getParameter("res_contact");
            String discount1 = request.getParameter("res_discount");
            String image = request.getParameter("res_image");

            HttpSession session = request.getSession();
            Owner o = (Owner) session.getAttribute("currentUser");

            Restaurant res = new Restaurant(name1, description1, address1, contact1, discount1, image, o.getId());
            //create a Restaurant dao object..

            RestaurantDao dao1 = new RestaurantDao(ConnectionProvider.getConnection());

            if (dao1.saveRestaurant(res)) {
                //          successfully Inserted
            //    HttpSession s = request.getSession();
            //    s.setAttribute("restaurantList", res);
            //out.println("Inserted Seccessfully");
                Cookie ck = new Cookie("resName", name1);
                response.addCookie(ck);
                response.sendRedirect("viewRestaurant.jsp");
            } else {
//                error///
//                Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
//                out.println("asdfsempty");
//                HttpSession s = request.getSession();
//                s.setAttribute("restaurantList", res);
//                s.setAttribute("msg", msg);
                out.println("Inserted Failed");
//                response.sendRedirect("owner_page.jsp");

            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RestaurantServlet.class.getName()).log(Level.SEVERE, null, ex);
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
