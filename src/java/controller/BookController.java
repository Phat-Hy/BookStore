package controller;

import dao.BooksDAO;
import dto.BooksDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            BooksDAO booksDAO = new BooksDAO();
            List<BooksDTO> bookList = booksDAO.show4Books();
            request.setAttribute("bookList", bookList);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exception, e.g., redirect to an error page
        }
    }
}
