<%@ page import="dto.BooksDTO" %>
<%@ page import="java.util.List" %>

<%
    List<BooksDTO> bookList = (List<BooksDTO>) request.getAttribute("bookList");
%>
<%-- Ensure that the bookList is not null and has items --%>
<% if (bookList != null && !bookList.isEmpty()) { %>
    <% for (BooksDTO b : bookList) { %>
        <div class="book-item">
                            <a href="BooksDetailsController?bookID=<%= b.getBookID() %>"><img src="<%= b.getImagePath()%>" alt="<%= b.getTitle()%>"></a>
                                                        <h3>
    <a href="BooksDetailsController?bookID=<%= b.getBookID() %>" style="color: black; text-decoration: none">
        <%= b.getTitle() %> 
        <% if (b.getVolume() > 0) { %>
            Volume <%= b.getVolume() %>
        <% } %>
    </a>
</h3>
            <p><%= b.getAuthor() %></p>
            <div class="price"><%= b.getPrice() %> VND</div>
            <a href="AddToCartController?bookID=<%= b.getBookID() %>" class="add-to-cart">Add To Cart</a>
        </div>
    <% } %>
<% } %>
