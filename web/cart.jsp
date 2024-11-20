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
        <title>Cart</title>
        <link rel="stylesheet" href="cart.css"> <!-- Link to your CSS file -->
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

            .cart-container {
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
                text-align: left;
            }

            table th {
                background-color: #f1f3f5;
                color: #495057;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 14px;
                letter-spacing: 0.5px;
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
input[type="number"] {
                width: 70px;
                padding: 8px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                text-align: center;
                font-size: 16px;
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
            .remove-button {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 8px 12px;
                border-radius: 4px;
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 14px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .remove-button:hover {
                background-color: #c82333;
                transform: translateY(-2px);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            }

            .remove-button:active {
                transform: translateY(0);
                box-shadow: none;
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

            footer {
                background-color: #333;
                color: white;
                text-align: center;
                padding: 20px;
                margin-top: 20px;
            }

            .cart-login {
                display: flex;
                gap: 20px;
            }

            .cart-login a {
                color: white;
                text-decoration: none;
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
        </style>
    </head>

    <body>
        <%
            //Lay du lieu tu session
            UsersDTO user = (UsersDTO) session.getAttribute("USER");
            if (user == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
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

        <div class="cart-container">
            <h1>Shopping Cart</h1>
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Total Price</th>
                        <th>Action</th>

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
                        <td><a href="BooksDetailsController?bookID=<%= book.getBookID()%>"><img src="<%= book.getImagePath()%>" alt="<%= book.getTitle()%>"/></a></td>
                        <td><a style="text-decoration: none; color: black; cursor: pointer;" href="BooksDetailsController?bookID=<%= book.getBookID()%>"><%= book.getTitle()%></a></td>
                <form action="MainController" method="POST">
                    <td>
                        <input type="number" name="quantity" value="<%=quantity%>" min="1" required="" 
                               onchange="this.form.submit();"/>
                        <input type="hidden" name="action" value="Update"/>
                        <input type="hidden" name="bookID" value="<%=book.getBookID()%>"/>
                    </td>
                </form>
                <td><%= book.getPrice()%></td>
                <td><%= totalPrice%></td>
                <form action="MainController" method="POST">

                    <td><input type="submit" name="action" value="Remove" class="remove-button"/></td>
                    <input type="hidden" name="bookID" value="<%=book.getBookID()%>"/>
                </form>


                </tr>
                <%
                        }
                    }
                } else {
                %>
                <tr>
                    <td class="empty-cart" colspan="6">Your cart is empty.</td>
                </tr>
                <%
                    }
                %>


                <section id="about-us" class="popup">
                    <button class="close-btn" onclick="closeAboutUs()">x</button>
                    <h2>About Us</h2>
                    <p>
                        Welcome to our Librairie! We are passionate about providing a wide selection of books for all ages and interests. Our mission is to foster a love for reading and to make quality books accessible to everyone.
                    </p>
                    <p>
                        Our team is dedicated to curating the best selection of books and providing exceptional customer service. We hope you enjoy browsing through our collection and find the perfect book for you.
                    </p>
                </section>
                </tbody>
            </table>

            <div class="total-container">
                <h2>Total:</h2>
                <div class="total-amount"><%= grandTotal%>VND</div>
            </div>

            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message != null && !message.isEmpty()) {
            %>
<div style="color: red; font-weight: bold; text-align: center;  margin-top: 40px">
                <%= message%>
            </div>
            <%
                }
            %>

            <form action="MainController" method="POST">
                <button type="submit" name="action" value="CheckOut" class="checkout-button">Checkout</button>

            </form>
        </div>

        <footer>
            <p>&copy; 2024 Librairie. All rights reserved.</p>
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