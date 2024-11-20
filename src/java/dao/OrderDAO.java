package dao;

import dto.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class OrderDAO {

    public List<OrderDTO> getOderByUserID(int uID) {
        List<OrderDTO> list = new ArrayList<>();
        String sql = "SELECT [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[ReceiverName]\n"
                + "      ,[ReceiverPhoneNumber]\n"
                + "      ,[OrderDate]\n"
                + "      ,[StreetAddress]\n"
                + "      ,[CompanyName]\n"
                + "      ,[Apartment]\n"
                + "      ,[City]\n"
                + "      ,[Postcode]\n"
                + "      ,[TotalAmount]\n"
                + "      ,[StatusID]\n"
                + "  FROM [BookStore].[dbo].[Orders]\n"
                + "  WHERE [UserID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, uID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                OrderDTO o = new OrderDTO(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getString("ReceiverName"),
                        rs.getString("ReceiverPhoneNumber"),
                        rs.getTimestamp("OrderDate").toLocalDateTime(),
                        rs.getString("StreetAddress"),
                        rs.getString("CompanyName"),
                        rs.getString("Apartment"),
                        rs.getString("City"),
                        rs.getString("Postcode"),
                        rs.getDouble("TotalAmount"),
                        rs.getInt("StatusID")
                );
                list.add(o);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return list;
    }

    public OrderDTO getOderByOrderID(int oID) {
        OrderDTO o = null;
        String sql = "SELECT [OrderID]\n"
                + "      ,[UserID]\n"
                + "      ,[ReceiverName]\n"
                + "      ,[ReceiverPhoneNumber]\n"
                + "      ,[OrderDate]\n"
                + "      ,[StreetAddress]\n"
                + "      ,[CompanyName]\n"
                + "      ,[Apartment]\n"
                + "      ,[City]\n"
                + "      ,[Postcode]\n"
                + "      ,[TotalAmount]\n"
                + "      ,[StatusID]\n"
                + "  FROM [BookStore].[dbo].[Orders]\n"
                + "  WHERE [OrderID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oID);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                o = new OrderDTO(
                        rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getString("ReceiverName"),
                        rs.getString("ReceiverPhoneNumber"),
                        rs.getTimestamp("OrderDate").toLocalDateTime(),
                        rs.getString("StreetAddress"),
                        rs.getString("CompanyName"),
                        rs.getString("Apartment"),
                        rs.getString("City"),
                        rs.getString("Postcode"),
                        rs.getDouble("TotalAmount"),
                        rs.getInt("StatusID")
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return o;
    }

   public List<OrderDTO> showAllOrders() {
        List<OrderDTO> orderList = new ArrayList<>();
        String sql = "SELECT [OrderID], [UserID], [OrderDate], [StreetAddress], [CompanyName], [Apartment], [City], [Postcode], [TotalAmount], [StatusID], [ReceiverName], [ReceiverPhoneNumber] "
                + "FROM [BookStore].[dbo].[Orders]";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                OrderDTO order = new OrderDTO(
    rs.getInt("OrderID"),
    rs.getInt("UserID"),
    rs.getString("ReceiverName"),
    rs.getString("ReceiverPhoneNumber"),
    rs.getTimestamp("OrderDate").toLocalDateTime(),
    rs.getString("StreetAddress"),
    rs.getString("CompanyName"),
    rs.getString("Apartment"),
    rs.getString("City"),
    rs.getString("Postcode"),
    rs.getDouble("TotalAmount"),
    rs.getInt("StatusID")
                );
                orderList.add(order);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return orderList;
    }

    public boolean cancelOrder(int oID) {
        int check = -1;

        String sql = "UPDATE [Orders] SET [StatusID] = 2 WHERE [OrderID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oID);

            check = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return check > 0;
    }

    public boolean approveOrder(int oID) {
        int check = -1;

        String sql = "UPDATE [Orders] SET [StatusID] = 1 WHERE [OrderID] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, oID);

            check = pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return check > 0;
    }

    public int insertOrder(int userID, String receiverName, String receiverPhoneNumber, LocalDateTime orderDate,
            String streetAddress, String city, String postcode, double totalAmount)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        int orderID = -1;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO [dbo].[Orders] ([UserID], [ReceiverName], [ReceiverPhoneNumber], [OrderDate], [StreetAddress], [CompanyName], [Apartment], [City], [Postcode], [TotalAmount], [StatusID]) "
                        + "OUTPUT INSERTED.OrderID " // This line outputs the generated OrderID
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                psm = con.prepareStatement(sql);

                // Set values to the PreparedStatement using individual variables
                psm.setInt(1, userID);
                psm.setString(2, receiverName);
                psm.setString(3, receiverPhoneNumber);
                psm.setTimestamp(4, Timestamp.valueOf(orderDate));
                psm.setString(5, streetAddress);
                psm.setString(6, null);
                psm.setString(7, null);
                psm.setString(8, city);
                psm.setString(9, postcode);
                psm.setDouble(10, totalAmount);
                psm.setInt(11, 3); // Assuming 3 is the default status for a new order

                // Execute the update and retrieve the generated OrderID
                rs = psm.executeQuery();
                if (rs.next()) {
                    orderID = rs.getInt(1);  // Assuming the OrderID is the first column in the result set
                }
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return orderID;
    }
    

}
