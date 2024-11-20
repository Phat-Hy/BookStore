package controller;

import dao.UsersDAO;
import dto.UsersDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ChangePasswordController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UsersDTO u = (UsersDTO) session.getAttribute("USER");
        int id = u.getUserID();
        String pass = request.getParameter("password");
        String cpass = request.getParameter("cpassword");

        String mess2 = null;
        String error2 = null;
        try {
            if (pass.equals(cpass)) {
                boolean check = new UsersDAO().changePassword(id, pass);

                if (check) {
                    mess2 = "Update successfully!";
                    UsersDTO user = new UsersDAO().getUserById(id);
                    session.setAttribute("USER", user);
                } else {
                    error2 = "Update failed!";
                }
            } else {
                error2 = "Password not match!";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("error2", error2);
            request.setAttribute("mess2", mess2);
            request.getRequestDispatcher("customer.jsp").forward(request, response);
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
