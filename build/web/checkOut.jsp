<%@page import="dto.UsersDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.BooksDAO"%>
<%@page import="dto.BooksDTO"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Checkout</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }

            header {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                text-align: center;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            nav {
                background-color: #444;
                padding: 10px 0;
                text-align: center;
            }

            nav a {
                color: white;
                text-decoration: none;
                margin: 0 15px;
                font-size: 16px;
            }

            .checkout-container {
                padding: 40px;
                max-width: 1200px;
                margin: 40px auto;
                background-color: white;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                border-radius: 12px;
            }

            h1 {
                text-align: center;
                color: #444;
                font-size: 32px;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
                margin: 30px 0;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            table th, table td {
                border: none;
                padding: 16px;
                text-align: center;
            }

            table th {
                background-color: #f1f3f5;
                color: #495057;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
                letter-spacing: 0.5px;
            }
             .empty-cart {
                text-align: center;
                font-size: 24px;
                color: #6c757d;
                padding: 40px 0;
                background-color: #f8f9fa;
                margin: 20px 0;
                box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .empty-cart::before {
                content: '\1F6D2';  /* Shopping cart emoji */
display: block;
                font-size: 48px;
                margin-bottom: 20px;
            }


            table tr {
                transition: background-color 0.3s;
            }

            table tr:hover {
                background-color: #f8f9fa;
            }

            table td {
                border-top: 1px solid #dee2e6;
            }

            table td img {
                width: 120px;
                height: 180px;
                object-fit: cover;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s;
            }

            table td img:hover {
                transform: scale(1.05);
            }
            .cart-login {
                display: flex;
                gap: 20px;
            }

            .cart-login a {
                color: white;
                text-decoration: none;
            }
            input[type="number"] {
                width: 70px;
padding: 8px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                text-align: center;
                font-size: 16px;
            }

            .checkout-form {
                margin-top: 30px;
            }

            .checkout-form label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #333;
                font-size: 16px;
            }

            .checkout-form input[type="text"],
            .checkout-form input[type="tel"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                font-size: 16px;
            }

            .total-container {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                margin-top: 40px;
                padding: 25px;
                background-color: #e9ecef;
                border: none;
                border-radius: 12px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            .total-container h2 {
                font-size: 24px;
                color: #495057;
                margin: 0;
                margin-right: 20px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .total-amount {
                font-size: 32px;
                font-weight: bold;
                color: #28a745;
            }

            .checkout-button {
                display: block;
                width: 250px;
                margin: 40px auto;
                padding: 15px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 30px;
                text-align: center;
                font-size: 18px;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .checkout-button:hover {
                background-color: #0056b3;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }
            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 20px;
                margin-top: 20px;
            }
            .popup {
                display: none;
                position: fixed;
                top: 25%;
                left: 25%;
                background-color: white;
                width: 50%;
                height: 52%;
                padding: 20px 30px;
                border-radius: 10px;
                z-index: 1000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                overflow-y: auto;
            }
.popup.active {
                top: 50%;
                opacity: 1;
            }

            .popup .close-btn {
                position: absolute;	
                right: 10px;
                width: 5%;
                font-weight: 1000;
                color: black;
                text-align: center;
                border-radius: 15px;
                cursor: pointer;
            }

            .popup .form h2 {
                text-align: center;
                margin: 10px 0px 20px;
                font-size: 25px;
            }

            .form-element.inline {
                display: flex;
                align-items: center;
            }

            .form-element.inline label {
                margin-right: 10px;
            }

            .form-element.inline div {
                display: flex;
                align-items: center;
                margin-right: 20px; 
            }
            .popup .form .form-element {
                margin: 15px 0px;
            }

            .popup .form .form-element label {
                display: block;
                margin-bottom: 5px;
                font-size: 14px;
                color: #222;
            }

            .popup .form .form-element input {
                margin-top: 5px;
                display: block;
                width: 100%;
                padding: 10px;
                outline: none;
                border: 1px solid #aaa;
                border-radius: 5px;
            }

            .popup .form .form-element button {
                width: 100%;
                height: 100%;
                padding: 2%;
                border-radius: 10px;
                border: none;
                outline: none;
                font-weight: 900;
                color: white;
                background-color: black;
                cursor: pointer;
            }

            .popup .form .form-element a {
                display: block;
                text-align: center;
                color: blue;
                text-decoration: none;
                font-weight: 900;
                transition: color 0.3s ease; 
            }

            .popup .form .form-element a:hover {
                color: red; 
            }

            .signup-popup {
                height: 63%;
            }
            /* About Us Popup Styles */
            #about-us {
                display: none;
                position: fixed;
                top: 25%;
                left: 25%;
                background-color: white;
                width: 50%;
                height: 50%;
                padding: 20px 30px;
                border-radius: 10px;
                z-index: 1000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                overflow-y: auto;
            }

            #about-us.active {
                display: block;
            }

            #about-us .close-btn {
                position: absolute;
                right: 10px;
top: 10px;
                width: 25px;
                height: 25px;
                font-weight: bold;
                color: black;
                text-align: center;
                border-radius: 50%;
                cursor: pointer;
                background-color: #f1f1f1;
            }

            #about-us h2 {
                text-align: center;
                margin: 10px 0;
                font-size: 25px;
            }

            #about-us p {
                font-size: 16px;
                line-height: 1.6;
                margin: 15px 0;
                color: #333;
            }
            .featured {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 40px auto;
                padding: 30px;
                background-color: #f8f9fa;
                border-radius: 15px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                max-width: 1200px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .featured:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 40px rgba(0,0,0,0.15);
            }

            .featured img {
                width: 250px;
                height: 375px;
                object-fit: cover;
                border-radius: 10px;
                box-shadow: 5px 5px 15px rgba(0,0,0,0.2);
                transition: transform 0.3s ease;
                margin: 0 auto;
            }

            .featured img:hover {
                transform: scale(1.05);
            }

            .featured .description {
                max-width: 60%;
                padding-left: 40px;
            }

            .featured h2 {
                font-size: 2em;
                color: #333;
                margin-bottom: 20px;
                font-weight: 700;
                margin-right:  35px;
            }

            .featured p {
                font-size: 1em;
                line-height: 1.6;
                color: #555;
                margin-bottom: 25px;
                margin-right:  35px;
            }

            .featured a {
                display: inline-block;
                padding: 12px 25px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                transition: background-color 0.3s ease;
            }

            .featured a:hover {
                background-color: #45a040;
            }
            .clickable-header {
                cursor: pointer;
                color: none;
                transition: color 0.3s, text-decoration 0.3s;
            }

            .clickable-header:hover {
                color: darkblue;
                text-decoration: none;
            }
            .alert-success {
                background-color: #d4edda;
color: #155724;
                padding: 15px;
                margin-top: 20px;
                border: 1px solid #c3e6cb;
                border-radius: 5px;
                font-size: 20px;
                text-align: center;
                font-weight: bold;
            }
        </style>
    </head>

    <body>
        <%
            //Lay du lieu tu session
            UsersDTO user = (UsersDTO) session.getAttribute("USER");
        %>
        <header>
            <h1 onclick="redirectToIndex()" class="clickable-header">
                Librairie
            </h1>
            <div class="cart-login">
                <%
                    if (user != null) {
                %>
                <a href="customer.jsp">Welcome, <%=user.getFirstName()%></a>
                <%} else {%>
                <a href="#" onclick="openLoginForm()">Login</a>
                <%}%>
                <a href="cart.jsp">Cart</a>
            </div>
        </header>

        <nav>
            <a href="GetBookController">Books</a>
            <a href="#" onclick="openAboutUs()">About Us</a>
        </nav>

        <div class="checkout-container">
            <h1>Checkout</h1>
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Retrieve the cart from the session --%>
                    <%
                        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("CART");
                        List<BooksDTO> booksInCart = new ArrayList<>();
                        double grandTotal = 0.0;

                        if (cart != null && !cart.isEmpty()) {
                            BooksDAO bookDAO = new BooksDAO();
                            for (String bookID : cart.keySet()) {
                                BooksDTO book = bookDAO.getBookById(Integer.parseInt(bookID));
                                if (book != null) {
                                    booksInCart.add(book);
                                    double totalPrice = book.getPrice() * cart.get(bookID);
                                    grandTotal += totalPrice;
                                    int quantity = cart.get(bookID);
                    %>
                    <tr>
                        <td><img src="<%= book.getImagePath()%>" alt="<%= book.getTitle()%>" /></td>
                        <td><%= book.getTitle()%></td>
                        <td><%= quantity%></td>
                        <td><%= book.getPrice()%>VND</td>
                        <td><%= totalPrice%>VND</td>
                    </tr>

                    <%
                            }
                        }
                    } else {
                    %>
<tr>
    <td class="empty-cart" colspan="5">Your cart is empty.</td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>

            </table>
            <div class="total-container">
                <h2>Total:</h2>
                <div class="total-amount"><%= grandTotal%>VND</div>
            </div>

<%
                if (user != null) {
                    UsersDTO userDto = (UsersDTO) user;
            %>

            <div class="checkout-form">
                <form action="MainController" method="POST">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= userDto.getFirstName() + " " + userDto.getLastName() != null ? userDto.getFirstName() + " " + userDto.getLastName() : ""%>" required />

                    <label for="street">Street:</label>
                    <input type="text" id="street" name="street" value="<%= userDto.getStreetAddress() != null ? userDto.getStreetAddress() : ""%>" required />

                    <label for="city">City:</label>
                    <input type="text" id="city" name="city" value="<%= userDto.getCity() != null ? userDto.getCity() : ""%>" required />

                    <label for="postcode">Postcode:</label>
                    <input type="text" id="postcode" name="postcode" value="<%= userDto.getPostcode() != null ? userDto.getPostcode() : ""%>" required />

                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" value="<%= userDto.getPhone() != null ? userDto.getPhone() : ""%>" required 
                           pattern="\d{10,11}" 
                           minlength="10" 
                           maxlength="11" 
                           title="Phone number must be 10 to 11 digits" />

                    <input type="hidden" name="totalAmount" value="<%= grandTotal%>" />
                    <%
                        String message = (String) request.getAttribute("MESSAGE");
                        if (message != null) {
                    %>
                    <div class="alert-success">
                        <p><%= message%></p>
                    </div>
                    <% } %>

                    <button type="submit" name="action" value="ConfirmOrder" class="checkout-button">Confirm Order</button>
                </form>
            </div>
            <%
                }
            %>

        </div>

        <footer>
            <p>&copy; 2024 Book Store. All rights reserved.</p>
        </footer>
                            <script>
//About us
            function openAboutUs() {
                document.getElementById("about-us").style.display = "block";
            }

            function closeAboutUs() {
                document.getElementById("about-us").style.display = "none";
            }
            function redirectToIndex() {
// Redirect to index.jsp
                window.location.href = 'index.jsp';
            }
// Array of books to simulate loading random books



        </script>
    </body>

</html>