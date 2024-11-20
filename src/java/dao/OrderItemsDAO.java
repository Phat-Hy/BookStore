package dao;

import dto.OrderItemsDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class OrderItemsDAO {

    public List<OrderItemsDTO> getOrderItemsByOrderID(int oID) {
        List<OrderItemsDTO> list = new ArrayList<>();
        String sql = "SELECT  [OrderItemID]\n"
                + "      ,[OrderID]\n"
                + "      ,[BookID]\n"
                + "      ,[Quantity]\n"
                + "      ,[Price]\n"
                + "  FROM [BookStore].[dbo].[OrderItems]\n"
                + "  WHERE [OrderID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderItemsDTO o = new OrderItemsDTO(
                        rs.getInt("OrderItemID"),
                        rs.getInt("OrderID"),
                        rs.getInt("BookID"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price")

                );
                list.add(o);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return list;
    }
        public int insertOrderItems(int orderID, int bookID, int quantity, double price)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement psm = null;
        int affectedRows = -1;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[OrderItems] ([OrderID], [BookID], [Quantity], [Price]) "
                        + "VALUES (?, ?, ?, ?)";
                psm = con.prepareStatement(sql);
                psm.setInt(1, orderID);
                psm.setInt(2, bookID);
                psm.setInt(3, quantity);
                psm.setDouble(4, price);
                affectedRows = psm.executeUpdate();
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return affectedRows;
    }
}
