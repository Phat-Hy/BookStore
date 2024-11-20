package controller;

import dao.BooksDAO;
import dto.BooksDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoadMoreBooksController", urlPatterns = {"/LoadMoreBooksController"})
public class LoadMoreBooksController extends HttpServlet {
    private static final int LIMIT = 4; // Number of books per page

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int offset = Integer.parseInt(request.getParameter("offset"));
        
        BooksDAO booksDAO = new BooksDAO();
        try {
            List<BooksDTO> bookList = booksDAO.loadMoreBooks(offset, LIMIT);
            request.setAttribute("bookList", bookList);
            request.getRequestDispatcher("loadMoreBooks.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving books.");
        }
    }
}
