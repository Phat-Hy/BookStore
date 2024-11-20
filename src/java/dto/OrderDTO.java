
package dto;

import java.time.LocalDateTime;

public class OrderDTO {
    private int orderID;
    private int userID;    
    private String receiverName;
    private String receiverPhoneNumber;
    private LocalDateTime orderDate;            
    private String streetAddress;             
    private String companyName;            
    private String apartment;           
    private String city;
    private String postcode;
    private double totalAmount;
    private int statusID;           

    public OrderDTO(int orderID, int userID, String receiverName, String receiverPhoneNumber, LocalDateTime orderDate, String streetAddress, String companyName, String apartment, String city, String postcode, double totalAmount, int statusID) {
        this.orderID = orderID;
        this.userID = userID;
        this.receiverName = receiverName;
        this.receiverPhoneNumber = receiverPhoneNumber;
        this.orderDate = orderDate;
        this.streetAddress = streetAddress;
        this.companyName = companyName;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.totalAmount = totalAmount;
        this.statusID = statusID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhoneNumber() {
        return receiverPhoneNumber;
    }

    public void setReceiverPhoneNumber(String receiverPhoneNumber) {
        this.receiverPhoneNumber = receiverPhoneNumber;
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

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }
 
}
