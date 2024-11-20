/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UsersDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Mlxg
 */
public class UsersDAO {

    public UsersDTO checkLogin(String email, String password)
            throws ClassNotFoundException, SQLException {
        UsersDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");
                    String companyName = rs.getString("CompanyName");
                    String country = rs.getString("Country");
                    String streetAddress = rs.getString("StreetAddress");
                    String apartment = rs.getString("Apartment");
                    String city = rs.getString("City");
                    String postcode = rs.getString("Postcode");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");
                    int statusID = rs.getInt("StatusID");

                    //String password;=rs.getString("roleID");
                    user = new UsersDTO(userID, firstName, lastName, companyName, country, streetAddress, postcode, apartment, city, postcode, phone, email, password, roleID,statusID);
                }
            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return user;
    }

    public boolean checkExist(String email) throws SQLException, ClassNotFoundException {
        Connection cnn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String query = "SELECT * FROM Users WHERE Email = ?";
                stm = cnn.prepareStatement(query);
                stm.setString(1, email);
                rs = stm.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                rs.close();
            }
            if (cnn != null) {
                rs.close();
            }
        }
        return false;
    }
    
    public boolean checkPhone(String phone) throws SQLException, ClassNotFoundException {
        Connection cnn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String query = "SELECT * FROM Users WHERE Phone = ?";
                stm = cnn.prepareStatement(query);
                stm.setString(1, phone);
                rs = stm.executeQuery();
                return rs.next();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                rs.close();
            }
            if (cnn != null) {
                rs.close();
            }
        }
        return false;
    }

    public boolean create(String email, String password, int roleID) throws SQLException, ClassNotFoundException {
        Connection cnn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String query = "INSERT INTO Users (Email, Password, RoleID) VALUES (?, ?, ?)";
                stm = cnn.prepareStatement(query);
                stm.setString(1, email);
                stm.setString(2, password);
                stm.setInt(3, roleID);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return false;

    }

    public boolean createStaff(String email, String password, String phone, int roleID, int StatusID) throws SQLException, ClassNotFoundException {
        Connection cnn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            cnn = DBUtils.getConnection();
            if (cnn != null) {
                String query = "INSERT INTO Users (Email, Password, Phone, RoleID, StatusID) VALUES ( ? , ? , ? , ? , ? )";
                stm = cnn.prepareStatement(query);
                stm.setString(1, email);
                stm.setString(2, password);
                stm.setString(3, phone);
                stm.setInt(4, roleID);
                stm.setInt(5, StatusID);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (cnn != null) {
                cnn.close();
            }
        }
        return false;

    }
    
    public List<UsersDTO> showStaffRole() throws ClassNotFoundException, SQLException {
        List<UsersDTO> userList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Users WHERE RoleID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 2);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int userID = rs.getInt("UserID");
                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");
                    String companyName = rs.getString("CompanyName");
                    String country = rs.getString("Country");
                    String streetAddress = rs.getString("StreetAddress");
                    String apartment = rs.getString("Apartment");
                    String city = rs.getString("City");
                    String postcode = rs.getString("Postcode");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    int roleID = rs.getInt("RoleID");
                    int statusID = rs.getInt("StatusID");
                    UsersDTO user = new UsersDTO(userID, firstName, lastName, companyName, country, streetAddress, postcode, apartment, city, postcode, phone, email, password, roleID, statusID);
                    userList.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging purposes
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return userList;
    }
    
    public List<UsersDTO> showUserRole() throws ClassNotFoundException, SQLException {
        List<UsersDTO> userList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Users WHERE RoleID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int userID = rs.getInt("UserID");
                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");
                    String companyName = rs.getString("CompanyName");
                    String country = rs.getString("Country");
                    String streetAddress = rs.getString("StreetAddress");
                    String apartment = rs.getString("Apartment");
                    String city = rs.getString("City");
                    String postcode = rs.getString("Postcode");
                    String phone = rs.getString("Phone");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    int roleID = rs.getInt("RoleID");
                    int statusID = rs.getInt("StatusID");
                    UsersDTO user = new UsersDTO(userID, firstName, lastName, companyName, country, streetAddress, postcode, apartment, city, postcode, phone, email, password, roleID, statusID);
                    userList.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging purposes
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return userList;
    }

    public boolean updateUserRole(String email) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        int rowsAffected = 0;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET RoleID = 2 WHERE Email = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email); 
                rowsAffected = stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        // Return true if the update was successful (i.e., at least one row was affected), false otherwise
        return rowsAffected > 0;
    }
    
    public UsersDTO getUserByPhone(String Phone)
            throws ClassNotFoundException, SQLException {
        UsersDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Users WHERE Phone like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, Phone);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");
                    String companyName = rs.getString("CompanyName");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String country = rs.getString("Country");
                    String streetAddress = rs.getString("StreetAddress");
                    String apartment = rs.getString("Apartment");
                    String city = rs.getString("City");
                    String postcode = rs.getString("Postcode");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");

                    //String password;=rs.getString("roleID");
                    user = new UsersDTO(userID, firstName, lastName, companyName, country, streetAddress, postcode, apartment, city, postcode, phone, email, password, roleID);
                }
            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return user;
    }

    public boolean changePassword(int id, String pass)
            throws ClassNotFoundException, SQLException {
        int check = -1;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE [dbo].[Users]\n"
                        + "SET [Password] = ?\n"
                        + "WHERE [UserID] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, pass);
                stm.setInt(2, id);

                check = stm.executeUpdate();

            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return check > 0;
    }

    public boolean changeAddress(int id, String street, String comp, String ap, String city, String code)
            throws ClassNotFoundException, SQLException {
        int check = -1;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE [dbo].[Users]\n"
                        + "SET [StreetAddress]= ?, [CompanyName] = ?, [Apartment] = ?, [City] = ?, [Postcode] = ?\n"
                        + "WHERE [UserID] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, street);
                stm.setString(2, comp);
                stm.setString(3, ap);
                stm.setString(4, city);
                stm.setString(5, code);
                stm.setInt(6, id);

                check = stm.executeUpdate();

            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return check > 0;
    }
//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        UsersDAO dao = new UsersDAO();
//        UsersDTO user = dao.checkLogin("user@gmail.com", "123");
//        System.out.println(user.getRoleID());
//    }
        public boolean changeAccountDetails(int id, String fName, String lName, String phone)
            throws ClassNotFoundException, SQLException {
        int check = -1;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE [dbo].[Users]\n"
                        + "SET [FirstName] = ?, [LastName] = ?, [Phone] = ?\n"
                        + "WHERE [UserID] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, fName);
                stm.setString(2, lName);
                stm.setString(3, phone);
                stm.setInt(4, id);

                check = stm.executeUpdate();

            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }

        }
        return check > 0;
    }
        public UsersDTO getUserById(int id)
            throws ClassNotFoundException, SQLException {
        UsersDTO user = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Users WHERE [UserID] = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    int userID = rs.getInt("userID");
                    String firstName = rs.getString("FirstName");
                    String lastName = rs.getString("LastName");
                    String companyName = rs.getString("CompanyName");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String country = rs.getString("Country");
                    String streetAddress = rs.getString("StreetAddress");
                    String apartment = rs.getString("Apartment");
                    String city = rs.getString("City");
                    String postcode = rs.getString("Postcode");
                    String phone = rs.getString("Phone");
                    int roleID = rs.getInt("RoleID");

                    //String password;=rs.getString("roleID");
                    user = new UsersDTO(userID, firstName, lastName, companyName, country, streetAddress, postcode, apartment, city, postcode, phone, email, password, roleID);
                }
            }
        } catch (Exception e) {
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return user;
    }
             public int getUserIDByEmail(String email) throws ClassNotFoundException, SQLException {
        int userID = -1; // Default value if no user is found
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT UserID FROM Users WHERE Email = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    userID = rs.getInt("UserID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exception or log it
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return userID;
    }
             
    public boolean changeStaffStatus(String email, int statusID) throws ClassNotFoundException, SQLException{
        Connection conn = null;
        PreparedStatement stm = null;
        int rowsAffected = 0;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Users SET StatusID = ? WHERE Email = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, statusID);
                stm.setString(2, email); 
                rowsAffected = stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        // Return true if the update was successful (i.e., at least one row was affected), false otherwise
        return rowsAffected > 0;
    }       

    public boolean createStaff(String email, String password, int i, int i0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
