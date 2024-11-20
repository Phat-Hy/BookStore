/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Mlxg
 */
public class BooksDTO {
    private int bookID;
    private String title;
    private int volume;
    private String description;
    private double price;
    private String imagePath;
    private String isbn;
    private int pages;
    private int formatID;
    private int publisherID;
    private int quantity;
    private int authorID;
    private int categoryID;
    private String author;
    private String authorName;
    private String publisherName;
    private String categoryName;
    private String formatName;
    private String statusName;
    private int statusID;

    public BooksDTO() {}

    public BooksDTO(int bookID, String title, double price, int quantity, int statusID) {
        this.bookID = bookID;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.statusID = statusID;
    }

    public BooksDTO(int bookID, String title, int volume, String description, double price, String imagePath, String isbn, int pages, int formatID, int publisherID, int quantity, int authorID, int categoryID, int statusID) {
        this.bookID = bookID;
        this.title = title;
        this.volume = volume;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
        this.isbn = isbn;
        this.pages = pages;
        this.formatID = formatID;
        this.publisherID = publisherID;
        this.quantity = quantity;
        this.authorID = authorID;
        this.categoryID = categoryID;
        this.statusID = statusID;
    }
    
                    
 
    public BooksDTO(String title, double price, String imagePath, String author) {
        this.title = title;
        this.price = price;
        this.imagePath = imagePath;
        this.author = author;
    }
        public BooksDTO(int bookID, String title, double price, String imagePath, String author, int volume) {
        this.bookID = bookID;
        this.title = title;
        this.price = price;
        this.imagePath = imagePath;
        this.author = author;
        this.volume = volume;
    }
                public BooksDTO(int bookID, String title, double price, String imagePath, String author) {
        this.bookID = bookID;
        this.title = title;
        this.price = price;
        this.imagePath = imagePath;
        this.author = author;
    }
    public BooksDTO(int bookID, String title, int volume, String description, double price, String imagePath, 
                    String isbn, int pages, int formatID, int publisherID, int quantity, int authorID, 
                    int categoryID) {
        this.bookID = bookID;
        this.title = title;
        this.volume = volume;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
        this.isbn = isbn;
        this.pages = pages;
        this.formatID = formatID;
        this.publisherID = publisherID;
        this.quantity = quantity;
        this.authorID = authorID;
        this.categoryID = categoryID;
    }
    public BooksDTO(String title,int bookID,  int volume, String description, double price, String imagePath, String isbn, int pages, int quantity, String authorName, String publisherName, String categoryName, String formatName, String statusName) {
        this.bookID = bookID;
        this.title = title;
        this.volume = volume;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
        this.isbn = isbn;
        this.pages = pages;
        this.quantity = quantity;
        this.authorName = authorName;
        this.publisherName = publisherName;
        this.categoryName = categoryName;
        this.formatName = formatName;
        this.statusName = statusName;
    }

    public BooksDTO(int bookID, String title, int volume, String description, double price, String imagePath, String isbn, int pages, int formatID, int publisherID, int quantity, int authorID, int categoryID, String authorName) {
        this.bookID = bookID;
        this.title = title;
        this.volume = volume;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
        this.isbn = isbn;
        this.pages = pages;
        this.formatID = formatID;
        this.publisherID = publisherID;
        this.quantity = quantity;
        this.authorID = authorID;
        this.categoryID = categoryID;
        this.authorName = authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public void setPublisherName(String publisherName) {
        this.publisherName = publisherName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public void setFormatName(String formatName) {
        this.formatName = formatName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }



    public String getAuthorName() {
        return authorName;
    }

    public String getPublisherName() {
        return publisherName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public String getFormatName() {
        return formatName;
    }

    public String getStatusName() {
        return statusName;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    
    
    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getVolume() {
        return volume;
    }

    public void setVolume(int volume) {
        this.volume = volume;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getFormatID() {
        return formatID;
    }

    public void setFormatID(int formatID) {
        this.formatID = formatID;
    }

    public int getPublisherID() {
        return publisherID;
    }

    public void setPublisherID(int publisherID) {
        this.publisherID = publisherID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
    public String getAuthor() { 
        return author; 
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "BooksDTO{" + "bookID=" + bookID + ", title=" + title + ", volume=" + volume + ", description=" + description + ", price=" + price + ", imagePath=" + imagePath + ", isbn=" + isbn + ", pages=" + pages + ", formatID=" + formatID + ", publisherID=" + publisherID + ", quantity=" + quantity + ", authorID=" + authorID + ", categoryID=" + categoryID + '}';
    }
    
}
