
package dto;
import java.time.LocalDateTime;

public class HistoryDTO {
    private int userId;
    private String firstName;
    private String lastName;
    private String phone;
    private int orderId;
    private LocalDateTime orderDate;
    private String streetAddress;
    private String companyName;
    private String apartment;
    private String city;
    private String postcode;
    private double totalAmount;
    private int orderStatusId;
    private int bookId;
    private int quantity;
    private double price;
    private String imagePath;
    private String title;

    public HistoryDTO(int userId, String firstName, String lastName, String phone, int orderId, LocalDateTime orderDate, String streetAddress, String companyName, String apartment, String city, String postcode, double totalAmount, int orderStatusId, int bookId, int quantity, double price, String imagePath, String title) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.streetAddress = streetAddress;
        this.companyName = companyName;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.totalAmount = totalAmount;
        this.orderStatusId = orderStatusId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.price = price;
        this.imagePath = imagePath;
        this.title = title;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getOrderStatusId() {
        return orderStatusId;
    }

    public void setOrderStatusId(int orderStatusId) {
        this.orderStatusId = orderStatusId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    
}