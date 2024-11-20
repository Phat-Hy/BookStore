/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Mlxg
 */
public class UsersDTO {
    private int UserID;
    private String firstName,lastName,companyName,country,streetAddress,postCode,apartment,city,postcode,phone,email,password;
    private int roleID;
    private Date createdAt;
    private int statusID;
    
    public UsersDTO(int UserID, String firstName, String lastName, String companyName, String country, String streetAddress, String postCode, String apartment, String city, String postcode, String phone, String email, String password, int roleID, int statusID) {
        this.UserID = UserID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.companyName = companyName;
        this.country = country;
        this.streetAddress = streetAddress;
        this.postCode = postCode;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.statusID = statusID;
    }    

    
    public UsersDTO(String firstName, String lastName, String companyName, String country, String streetAddress, String postCode, String apartment, String city, String postcode, String phone, String email, String password, int roleID) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.companyName = companyName;
        this.country = country;
        this.streetAddress = streetAddress;
        this.postCode = postCode;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    

    public UsersDTO() {
    }

    public UsersDTO(String firstName, String lastName, String companyName, String country, String streetAddress, String postCode, String apartment, String city, String postcode, String phone, String email, String password, int roleID, Date createdAt) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.companyName = companyName;
        this.country = country;
        this.streetAddress = streetAddress;
        this.postCode = postCode;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
        this.createdAt = createdAt;
    }



    public UsersDTO(int UserID, String firstName, String lastName, String companyName, String country, String streetAddress, String postCode, String apartment, String city, String postcode, String phone, String email, String password, int roleID) {
        this.UserID = UserID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.companyName = companyName;
        this.country = country;
        this.streetAddress = streetAddress;
        this.postCode = postCode;
        this.apartment = apartment;
        this.city = city;
        this.postcode = postcode;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.roleID = roleID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
}
