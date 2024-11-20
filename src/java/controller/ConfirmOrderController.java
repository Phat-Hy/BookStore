package controller;

import dao.BooksDAO;
import dao.OrderDAO;
import dao.OrderItemsDAO;
import dao.UsersDAO;
import dto.BooksDTO;
import dto.OrderDTO;
import dto.OrderItemsDTO;
import dto.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CapPT
 */
public class ConfirmOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UsersDTO user = (UsersDTO) session.getAttribute("USER");
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("CART");
        UsersDAO userDAO = new UsersDAO();

        try {
            if (user != null && cart != null && !cart.isEmpty()) {
                String receiverName = request.getParameter("name");
                String street = request.getParameter("street");
                String city = request.getParameter("city");
                String postcode = request.getParameter("postcode");
                String receiverPhoneNumber = request.getParameter("phone");
                String email = user.getEmail();
                double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

                OrderDAO orderDAO = new OrderDAO();
                OrderItemsDAO orderItemDAO = new OrderItemsDAO();

                LocalDateTime orderDateTime = LocalDateTime.now();

                // Insert the order and get the generated OrderID
                int orderID = orderDAO.insertOrder(user.getUserID(), receiverName, receiverPhoneNumber, orderDateTime, street, city, postcode, totalAmount);

                // Insert order items for each book in the cart
                for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                    String bookID = entry.getKey();
                    BooksDTO book = new BooksDAO().getBookById(Integer.parseInt(bookID));
                    int quantity = entry.getValue();
                    double SubTotalPrice = quantity * book.getPrice(); // Assuming you have a method to get the book price
                    orderItemDAO.insertOrderItems(orderID, Integer.parseInt(bookID), quantity, SubTotalPrice);

                }

                // Clear cart after successful order
                session.removeAttribute("CART");
                request.setAttribute("MESSAGE", "Order placed successfully!");
                // Redirect to a confirmation page
request.getRequestDispatcher("checkOut.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("checkOut.jsp").forward(request, response);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}