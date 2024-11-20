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
public class SignupController extends HttpServlet {

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
        try {
            String email = request.getParameter("txtEmail1");
            String password = request.getParameter("txtPassword1");
            String confirm = request.getParameter("txtConfirm");
            ValidateData vd = new ValidateData();
            boolean errors = vd.checkPasswordLen(password)
                    || vd.checkConfirm(password, confirm)
                    || vd.checkPasswordFormat(password);

            if (errors) {
                StringBuilder errorMessages = new StringBuilder();
                if (vd.isPasswordLenError()) {
                    errorMessages.append("Password must be at least 8 characters long. ");
                }
                if (vd.isPasswordFormatError()) {
                    errorMessages.append("Password must contain at least 1 lowercase character, 1 uppercase character, 1 number and 1 special character ");
                }
                if (vd.isNotMatch()) {
                    errorMessages.append("Passwords do not match. ");
                }
                request.setAttribute("errorMessages", errorMessages.toString());
            } else {
                boolean isExist = vd.checkExisted(email);
                if (!isExist) {
                    UsersDAO dao = new UsersDAO();
                    boolean isSuccess = dao.create(email, password, 3);
                    request.setAttribute("SUCCESS", isSuccess);
                } else {
                    request.setAttribute("errorMessages", "Duplicate Email.");
                }
            }
            request.setAttribute("ValidateData", vd);
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
