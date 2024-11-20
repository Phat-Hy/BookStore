/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BooksDAO;
import dto.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dinhl
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BooksDAO booksDAO = new BooksDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");        
        String url = "index.jsp";
        try {
            String action = request.getParameter("action");
            
            switch (action){
                case "Login":
                    url = "LoginController";
                    break;
                case "Logout":
                    url = "LogoutController";
                    break;
                case "Signup":
                    url = "SignupController";
                    break;
                case "Role":
                    int role = (int) request.getAttribute("ROLE");                    
                    if(role == 1 || role == 2){
                        url = "manage.jsp";                    
                    } else url = "index.jsp";
                    break;
                                    case "Change Account Details":
                    url = "ChangeAccountDetailsController";
                    break;
                case "Change Password":
                    url = "ChangePasswordController";
                    break;
                case "Change Address":
                    url = "ChangeAddressController";
                    break;
                case "history":
                    url = "HistoryController";
                    break;
                case "History Details":
                    url = "HistoryDetailsController";
                    break;
                case "Cancel Order":
                    url = "CancelOrderController";
                    break;
                case "randomBook":
                    url = "FeaturedBookController";
                    break;
                case "Add To Cart":
                    url = "AddToCartController";
                    break;
                case "Remove":
                    url = "RemoveController";
                    break;
                case "Update":
                    url = "UpdateController";
                    break;
                case "CheckOut":
                    url = "CheckOutController";
                    break;
                case "ConfirmOrder":
                    url = "ConfirmOrderController";
                    break;
                                case "Add":
                    url = "AddStaffController";
                    break;
                case "Delete":
                    url = "DeleteBookController";
                    break;
                case "Save Quantity":
                    url = "SaveQuantityController";
                    break;
                case "Save Price":
                    url = "SavePriceController";
                    break;
                case "Add Book":
                    url = "AddBookController";
                    break;
                case "Approve":
                    url = "ApproveOrderController";
                    break;
                case "Deny":
                    url = "DenyOrderController";
                    break;
                 case "Create Staff":
                    url = "CreateStaffController";
                    break;
                case "Change Status":
                    url = "ChangeStatusController";
                    break;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
