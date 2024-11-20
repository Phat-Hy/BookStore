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

public class ChangeAddressController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String streetAddress = request.getParameter("streetAddress");
        String companyName = request.getParameter("companyName");
        String apartment = request.getParameter("apartment");
        String city = request.getParameter("city");
        String postcode = request.getParameter("postcode");

        HttpSession session = request.getSession();
        UsersDTO u = (UsersDTO) session.getAttribute("USER");
        int id = u.getUserID();

        String mess3 = null;
        String error3 = null;
        try {
            boolean check = new UsersDAO().changeAddress(id, streetAddress, companyName, apartment, city, postcode);

            if (check) {
                mess3 = "Update successfully!";
                UsersDTO user = new UsersDAO().getUserById(id);
                session.setAttribute("USER", user);
            } else {
                error3 = "Update failed!";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("error3", error3);
            request.setAttribute("mess3", mess3);
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
