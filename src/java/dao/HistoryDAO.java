package dao;

import dto.HistoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class HistoryDAO {

    public List<HistoryDTO> getAllHistory() {
        List<HistoryDTO> historyList = new ArrayList<>();
        String sql = "SELECT \n"
                + "	u.UserID,\n"
                + "	u.FirstName,\n"
                + "	u.LastName,\n"
                + "	u.Phone,\n"
                + "	o.OrderID,\n"
                + "	o.OrderDate,\n"
                + "	o.StreetAddress,\n"
                + "	o.CompanyName,\n"
                + "	o.Apartment,\n"
                + "	o.City,\n"
                + "	o.Postcode,\n"
                + "	o.TotalAmount,\n"
                + "	o.StatusID,\n"
                + "	oi.BookID,\n"
                + "	oi.Quantity,\n"
                + "	oi.Price,\n"
                + "	b.ImagePath,\n"
                + "	b.Title\n"
                + "FROM\n"
                + "[Users] u JOIN [Orders] o ON u.[UserID] = o.[UserID]\n"
                + "JOIN [OrderItems] oi ON o.[OrderID] = oi.[OrderID]\n"
                + "JOIN [Books] b ON oi.[BookID] = b.BookID";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                HistoryDTO history = new HistoryDTO(
                        rs.getInt("UserID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Phone"),
                        rs.getInt("OrderID"),
                        rs.getTimestamp("OrderDate").toLocalDateTime(),
                        rs.getString("StreetAddress"),
                        rs.getString("CompanyName"),
                        rs.getString("Apartment"),
                        rs.getString("City"),
                        rs.getString("Postcode"),
                        rs.getDouble("TotalAmount"),
                        rs.getInt("StatusID"),
                        rs.getInt("BookID"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getString("ImagePath"),
                        rs.getString("Title")
                );
                historyList.add(history);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // Consider logging the exception or throwing a custom exception
        }

        return historyList;
    }

}
