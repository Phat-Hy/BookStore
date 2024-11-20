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
import utils.ValidateData;

public class ChangeAccountDetailsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UsersDTO u = (UsersDTO) session.getAttribute("USER");
        int id = u.getUserID();
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String phone = request.getParameter("phone");

        String mess1 = null;
        String error1 = null;

        try {
            if (new utils.ValidateData().isValidPhoneNumber(phone)) {
                if (new utils.ValidateData().isDupPhone(phone)) {
                    boolean check = new UsersDAO().changeAccountDetails(id, fName, lName, phone);

                    if (check) {
                        mess1 = "Update successfully!";
                        UsersDTO user = new UsersDAO().getUserById(id);
                        session.setAttribute("USER", user);
                    } else {
                        error1 = "Update failed!";
                    }
                }else {
                    error1 = "Phone number has been used!";
                }
            } else {
                error1 = "Unavailble phone number!";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            request.setAttribute("error1", error1);
            request.setAttribute("mess1", mess1);
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
