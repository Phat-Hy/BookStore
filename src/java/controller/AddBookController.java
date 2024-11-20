/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BooksDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mlxg
 */
public class AddBookController extends HttpServlet {

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
        String url = "manage.jsp";
        try  {
            String title = request.getParameter("title");
            int volume = Integer.parseInt(request.getParameter("volume"));
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String imagePath = request.getParameter("imagePath");
            int pages = Integer.parseInt(request.getParameter("pages"));
            int formatID = Integer.parseInt(request.getParameter("formatID"));
            int publisherID = Integer.parseInt(request.getParameter("publisherID"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int authorID = Integer.parseInt(request.getParameter("authorID"));
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            BooksDAO bd = new BooksDAO();
            boolean success = bd.create(title, volume, description, price, imagePath, 
                    pages, formatID, publisherID, quantity, authorID, categoryID, 1);
            if (success) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Book added successfully');");
                out.println("location='manage.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Failed to add book.');");
                out.println("location='manage.jsp';");
                out.println("</script>");
            }
        }catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }finally{
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
