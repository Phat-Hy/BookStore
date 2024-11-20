/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.BooksDTO;
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
public class BooksDAO {
    public List<BooksDTO> show4Books() throws ClassNotFoundException, SQLException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT TOP 4 b.BookID, b.Title, b.Volume, b.Description, b.Price, b.ImagePath, b.ISBN, b.Pages, a.AuthorName\n"
                        + "FROM books b\n"
                        + "INNER JOIN authors a ON b.AuthorID = a.AuthorID;";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int bookID = rs.getInt("BookID");
                    String title = rs.getString("Title");
                    double price = rs.getDouble("Price");
                    String imagePath = rs.getString("ImagePath");
                    String author = rs.getString("AuthorName");
                    int volume = rs.getInt("Volume");
              
                    BooksDTO book = new BooksDTO(bookID, title, price, imagePath, author, volume);
                    bookList.add(book);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
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
        return bookList;
    }
    
      public List<BooksDTO> loadMoreBooks(int offset, int limit) throws ClassNotFoundException, SQLException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT b.BookID, b.Title, b.Price, b.ImagePath, a.AuthorName, b.Volume "
                           + "FROM books b "
                           + "INNER JOIN authors a ON b.AuthorID = a.AuthorID "
                           + "ORDER BY b.BookID "
                           + "OFFSET ? ROWS "
                           + "FETCH NEXT ? ROWS ONLY;";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, offset);
                stm.setInt(2, limit);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int bookID = rs.getInt("BookID");
                    String title = rs.getString("Title");
                    double price = rs.getDouble("Price");
                    String imagePath = rs.getString("ImagePath");
                    String author = rs.getString("AuthorName");
                    int volume = rs.getInt("Volume");

                    BooksDTO book = new BooksDTO(bookID, title, price, imagePath, author, volume);
                    bookList.add(book);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (conn != null) conn.close();
            if (stm != null) stm.close();
            if (rs != null) rs.close();
        }
        return bookList;
    }
    public List<BooksDTO> showBooksDetail(int bookID) throws ClassNotFoundException, SQLException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT b.BookID, b.Title, b.Volume, a.AuthorName, p.PublisherName, c.CategoryName, f.FormatName, bs.StatusName, b.Price, b.ImagePath, b.ISBN,b.Pages,b.Quantity,b.Description\n" +
"FROM Books b join Authors a on b.AuthorID=a.AuthorID\n" +
" join Publishers p on b.PublisherID=p.PublisherID\n" +
" join BooksStatus bs on b.StatusID = bs.StatusID\n" +
" join Categories c on b.CategoryID= c.CategoryID\n" +
" join Formats f on b.FormatID = f.FormatID\n" +
" Where b.BookID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, bookID);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String title = rs.getString("Title");
                    int volume = rs.getInt("Volume");
                    String description = rs.getString("Description");
                    double price = rs.getDouble("Price");
                    String imagePath = rs.getString("ImagePath");
                    String isbn = rs.getString("ISBN");
                    int pages = rs.getInt("Pages");
                    String authorName=rs.getString("AuthorName");
                    String publisherName=rs.getString("PublisherName");
                    String categoryName=rs.getString("CategoryName");
                    String formatName=rs.getString("FormatName");
                    String statusName=rs.getString("FormatName");
                    BooksDTO book = new BooksDTO( title, bookID, volume, description, price, imagePath, isbn, pages, pages, authorName, publisherName, categoryName, formatName, statusName);
                    
                    bookList.add(book);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
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
        return bookList;
    }    
    public List<BooksDTO> getAllBooks() throws SQLException, ClassNotFoundException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Books b join Authors a on b.AuthorID=a.AuthorID";
                psm = con.prepareStatement(query);
                rs = psm.executeQuery();
                while (rs.next()) {
                    BooksDTO book = new BooksDTO();
                    book.setBookID(rs.getInt("BookID"));
                    book.setTitle(rs.getString("Title"));
                    book.setVolume(rs.getInt("Volume"));
                    book.setDescription(rs.getString("Description"));
                    book.setPrice(rs.getDouble("Price"));
                    book.setImagePath(rs.getString("ImagePath"));
                    book.setIsbn(rs.getString("ISBN"));
                    book.setPages(rs.getInt("Pages"));
                    book.setFormatID(rs.getInt("FormatID"));
                    book.setPublisherID(rs.getInt("PublisherID"));
                    book.setQuantity(rs.getInt("Quantity"));
                    book.setAuthorID(rs.getInt("AuthorID"));
                    book.setCategoryID(rs.getInt("CategoryID"));
                    book.setAuthorName(rs.getString("AuthorName"));
                    bookList.add(book);
                }
            }
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

        return bookList;
    }
    public List<BooksDTO> getBookInStock() throws SQLException, ClassNotFoundException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Books b join Authors a on b.AuthorID=a.AuthorID WHERE b.StatusID = 1 AND b.Quantity>0";
                psm = con.prepareStatement(query);
                rs = psm.executeQuery();
                while (rs.next()) {
                    BooksDTO book = new BooksDTO();
                    book.setBookID(rs.getInt("BookID"));
                    book.setTitle(rs.getString("Title"));
                    book.setVolume(rs.getInt("Volume"));
                    book.setDescription(rs.getString("Description"));
                    book.setPrice(rs.getDouble("Price"));
                    book.setImagePath(rs.getString("ImagePath"));
                    book.setIsbn(rs.getString("ISBN"));
                    book.setPages(rs.getInt("Pages"));
                    book.setFormatID(rs.getInt("FormatID"));
                    book.setPublisherID(rs.getInt("PublisherID"));
                    book.setQuantity(rs.getInt("Quantity"));
                    book.setAuthorID(rs.getInt("AuthorID"));
                    book.setCategoryID(rs.getInt("CategoryID"));
                    book.setAuthorName(rs.getString("AuthorName"));
                    bookList.add(book);
                }
            }
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

        return bookList;
    }

    public BooksDTO getBookById(int bookId) throws SQLException, ClassNotFoundException {
        BooksDTO book = new BooksDTO();
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String query = "SELECT * FROM Books WHERE BookID = ?";
                psm = con.prepareStatement(query);
                psm.setInt(1, bookId);
                rs = psm.executeQuery();
                if (rs.next()) {
                    book.setBookID(rs.getInt("BookID"));
                    book.setTitle(rs.getString("Title"));
                    book.setVolume(rs.getInt("Volume"));
                    book.setDescription(rs.getString("Description"));
                    book.setPrice(rs.getDouble("Price"));
                    book.setImagePath(rs.getString("ImagePath"));
                    book.setIsbn(rs.getString("ISBN"));
                    book.setPages(rs.getInt("Pages"));
                    book.setFormatID(rs.getInt("FormatID"));
                    book.setPublisherID(rs.getInt("PublisherID"));
                    book.setQuantity(rs.getInt("Quantity"));
                    book.setAuthorID(rs.getInt("AuthorID"));
                    book.setCategoryID(rs.getInt("CategoryID"));
                }
            } 
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

        return book;
    }
        public List<BooksDTO> search(String key) throws ClassNotFoundException, SQLException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String sql = "select b.BookID, b.Title, b.Volume, b.Description, b.Price, b.ImagePath,"
                    + " b.ISBN, b.Pages, b.FormatID, b.PublisherID, b.Quantity, b.AuthorID, b.CategoryID,"
                    + " a.AuthorName from Books b JOIN Authors a ON b.AuthorID = a.AuthorID where Title like ? or a.AuthorName like ?";
            con = DBUtils.getConnection();
            if(con!= null){
                psm=con.prepareStatement(sql);
                psm.setString(1,key + "%");
                psm.setString(2,key + "%");
                rs = psm.executeQuery();
                while (rs.next()) {
                    bookList.add(new BooksDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), 
                            rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), 
                            rs.getInt(10), rs.getInt(11), rs.getInt(12), rs.getInt(13), rs.getString(14)));
                }
            }                  
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
        return bookList;
    }
    public int getTotalBook() throws ClassNotFoundException, SQLException{
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.getConnection();
            String sql = "SELECT count(*) FROM Books";
            psm=con.prepareStatement(sql);
            rs=psm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
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
        return 0;
    }  
    
    public List<BooksDTO> getBookByPaging (int page, int PAGE_SIZE){
        List<BooksDTO> bookList = new ArrayList<>();
        Connection con = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String sql = "select b.BookID, b.Title, b.Volume, b.Description, b.Price, b.ImagePath,"
                    + " b.ISBN, b.Pages, b.FormatID, b.PublisherID, b.Quantity, b.AuthorID, b.CategoryID,"
                    + " a.AuthorName from Books b JOIN Authors a ON b.AuthorID = a.AuthorID order by b.BookID"
                    + "offset (?-1)*? row fetch next ? rows only";
            con= DBUtils.getConnection();
            psm=con.prepareStatement(sql);
            psm.setInt(1, page);
            psm.setInt(2, PAGE_SIZE);
            psm.setInt(3, PAGE_SIZE);
            rs=psm.executeQuery();
            while (rs.next()) {                
                bookList.add(new BooksDTO(rs.getInt("BookID"), rs.getString("Title"), rs.getInt("Volume"), rs.getString("Description"), 
                            rs.getDouble("Price"), rs.getString("ImagePath"), rs.getString("ISBN"), rs.getInt("Pages"), rs.getInt("FormatID"), 
                            rs.getInt("PublisherID"), rs.getInt("Quantity"), rs.getInt("AuthorID"), rs.getInt("CategoryID"), rs.getString("AuthorName")));
            }
        } catch (Exception e) {
        }
        return bookList;
    }
    

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        BooksDAO a = new BooksDAO();
        List<BooksDTO> list = a.search("key");
        for (BooksDTO book : list) {
            System.out.println(book);
        }
    }
        public boolean delete(int id) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "DELETE FROM Books WHERE BookID = ?";
                stm = conn.prepareStatement(query);
                stm.setInt(1, id);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return affectedRow > 0;
    }

    public boolean updateQuantity(int quantity,int bookID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // to do
                String query = "UPDATE Books SET Quantity = ? WHERE BookID = ?";
                stm = conn.prepareStatement(query);
                stm.setInt(1, quantity);
                stm.setInt(2, bookID);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return affectedRow > 0;
    }
    
    public boolean updateStatus(int statusID,int bookID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // to do
                String query = "UPDATE Books SET StatusID = ? WHERE BookID = ?";
                stm = conn.prepareStatement(query);
                stm.setInt(1, statusID);
                stm.setInt(2, bookID);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return affectedRow > 0;
    }
    
    public boolean updatePrice(double price,int bookID) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stm = null;
        int affectedRow = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                // to do
                String query = "UPDATE Books SET Price = ? WHERE BookID = ?";
                stm = conn.prepareStatement(query);
                stm.setDouble(1, price);
                stm.setInt(2, bookID);
                affectedRow = stm.executeUpdate();
                return affectedRow > 0;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return affectedRow > 0;
    }
    
   public boolean create(String title, int volume, String description, double price, String imagePath, 
                      int pages, int formatID, int publisherID, int quantity, int authorID, int categoryID, int statusID) 
                      throws SQLException, ClassNotFoundException {
    Connection cnn = null;
    PreparedStatement stm = null;
    int affectedRow = -1;
    try {
        cnn = DBUtils.getConnection();
        if (cnn != null) {
            String query = "INSERT INTO Books (Title, Volume, Description, Price, ImagePath, Pages, FormatID, PublisherID, Quantity, AuthorID, CategoryID, StatusID) "
                         + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stm = cnn.prepareStatement(query);
            stm.setString(1, title);
            stm.setInt(2, volume);
            stm.setString(3, description);
            stm.setDouble(4, price);
            stm.setString(5, imagePath);
            stm.setInt(6, pages);
            stm.setInt(7, formatID);
            stm.setInt(8, publisherID);
            stm.setInt(9, quantity);
            stm.setInt(10, authorID);
            stm.setInt(11, categoryID);
            stm.setInt(12, statusID);
            affectedRow = stm.executeUpdate();
            return affectedRow > 0;
        }
    } finally {
        if (stm != null) stm.close();
        if (cnn != null) cnn.close();
    }
    return false;
}
       public List<BooksDTO> showAllBooks() throws ClassNotFoundException, SQLException {
        List<BooksDTO> bookList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Books";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    int bookID = rs.getInt("BookID");
                    String title = rs.getString("Title");
                    int volume = rs.getInt("Volume");
                    String description = rs.getString("Description");
                    double price = rs.getDouble("Price");
                    String imagePath = rs.getString("ImagePath");
                    String isbn = rs.getString("ISBN");
                    int pages = rs.getInt("Pages");
                    int formatID = rs.getInt("FormatID");
                    int publisherID = rs.getInt("PublisherID");
                    int quantity = rs.getInt("Quantity");
                    int authorID = rs.getInt("AuthorID");
                    int categoryID = rs.getInt("CategoryID");
                    int statusID = rs.getInt("StatusID");

                    BooksDTO book = new BooksDTO(
                            bookID, title, volume, description, price, imagePath,
                            isbn, pages, formatID, publisherID, quantity, authorID,
                            categoryID,statusID
                    );

                    bookList.add(book);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
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
        return bookList;
    }
//    public static void main(String []args) throws ClassNotFoundException, SQLException{
//        BooksDAO dao = new BooksDAO();
//        List<BooksDTO> b = dao.showAllBooks();
//        for(BooksDTO books : b){
//            System.out.println(books.toString());
//        }
//    }
}
