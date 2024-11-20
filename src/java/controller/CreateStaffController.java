/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.ValidateData;

/**
 *
 * @author Mlxg
 */
public class CreateStaffController extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try  {
            String email = request.getParameter("staffEmail");
            String password = request.getParameter("staffPassword");
            String phone = request.getParameter("staffPhone");
            ValidateData vd = new ValidateData();
            boolean errors = vd.checkPasswordLen(password) || vd.checkPasswordFormat(password);
            if (errors) {
                StringBuilder errorMessages = new StringBuilder();
                if (vd.isPasswordLenError()) {
                    errorMessages.append("Password must be at least 8 characters long. ");
                }
                if (vd.isPasswordFormatError()) {
                    errorMessages.append("Password must contain at least 1 lowercase character, 1 uppercase character, 1 number and 1 special character ");
                }
                request.setAttribute("errorMessages", errorMessages.toString());
            } else {
                boolean isExist = vd.checkExisted(email) || vd.checkPhone(phone);
                if (!isExist) {
                    UsersDAO dao = new UsersDAO();
                    boolean success = dao.createStaff(email, password, phone, 2, 1);
                    request.setAttribute("SUCCESS", success);
                    request.setAttribute("errorMessages", "Staff Added");
                } else {
                    request.setAttribute("errorMessages", "Duplicate Email and/or Phone.");
                }
            }
            request.setAttribute("ValidateData", vd);
        }catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }finally{
            request.getRequestDispatcher("manage.jsp").forward(request, response);
            out.close();
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
