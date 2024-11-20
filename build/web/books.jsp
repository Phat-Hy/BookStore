

<%@page import="dto.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.BooksDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books</title>
    </head>
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

        .featured {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .featured img {
            width: 200px;
            height: 300px;
            object-fit: cover;
        }

        .featured .description {
            max-width: 500px;
        }

        .book-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between; /* Ensure spacing between items */
            margin: 20px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .book-item {
            width: 23%; /* Adjust the width to fit 4 items in a row with spacing */
            margin: 15px 0; /* Adjust margin to space items vertically */
            text-align: center;
            box-sizing: border-box; /* Ensure padding and border are included in width */
        }

        .book-item img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 5px;
        }

        .book-item h3 {
            font-size: 18px;
            margin: 10px 0;
        }

        .book-item p {
            color: #777;
            font-size: 14px;
        }

        .book-item .price {
            color: #000;
            font-weight: bold;
            margin: 10px 0;
        }

        .add-to-cart {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
        }

        .add-to-cart:hover {
            background-color: #45a049;
        }

        .load-more {
            display: block;
            text-align: center;
            margin: 20px auto;
            padding: 10px 20px;
            border: 2px solid #4CAF50;
            color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .load-more:hover {
            background-color: #4CAF50;
            color: white;
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
            color: none;
            text-decoration: none;
        }
        h1.res {
            color: red;
            font-size: 25px;
            margin: 10px 0;
            margin-left: 40px;

        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 15px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-right: 10px;
            margin-left: 30px;
            font-size: 16px;
            max-width: 300px;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
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
        <%    String searchs = (String) request.getParameter("key");
        if (searchs == null) {
            searchs = "";
        }

        %>
        <form action="SearchController" method="POST">
            <input type="text" name="key" value="<%=searchs%>" placeholder="Search name or author of book"/>               
            <input type="submit" name="action" value="Search"/>
            <h1 class="res">${ERROR}</h1>
        </form>
        <section id="book-section" class="book-section">
            <%
                List<BooksDTO> listBook = (List<BooksDTO>) request.getAttribute("LIST_BOOK");
                for (BooksDTO book : listBook) {
            %>

            <div class="book-item">
                <a href="BooksDetailsController?bookID=<%= book.getBookID()%>"><img src="<%= book.getImagePath()%>" alt="..."/></a>
                <h3>
                    <a href="BooksDetailsController?bookID=<%= book.getBookID()%>" style="color: black; text-decoration: none">
                        <%= book.getTitle()%> 
                        <% if (book.getVolume() > 0) {%>
                        Volume <%= book.getVolume()%>
                        <% }%>
                    </a>
                </h3>
                <p>By <%=book.getAuthorName()%></p>
                <p>ISBN: <%= book.getIsbn()%></p>
                <div class="price"><%= book.getPrice()%>VND</div>
                <a href="AddToCartController?bookID=<%= book.getBookID()%>" class="add-to-cart">Add To Cart</a>
            </div>

            <%
                }
            %>

        </section>
        <div id="myForm" class="popup">
            <button class="close-btn" onclick="closeLoginForm()">x</button>           
            <h2>Log in</h2>
            <form action="MainController" method="post" class="form">
                <div class="form-element">
                    <label for="email">Email</label>
                    <input type="text" id="email" name="txtEmail" placeholder="Enter email" required>
                </div>
                <div class="form-element">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="txtPassword" placeholder="Enter password" required>
                </div>
                <div class="form-element">
                    <input type="submit" name="action" value="Login"></button>
                </div>
                <div class="form-element">
                    <a href="#" class="signup" onclick="openSignupForm()">Don't have an account? Sign Up</a>
                </div>
                <div class="form-element">
                    <div id="loginError" class="error" style="color: red;"></div>
                </div>
            </form>
        </div>
        <div id="signupForm" class="popup signup-popup">
            <button class="close-btn" onclick="closeSignupForm()">x</button>
            <form action="RegisterUserServlet" method="POST" class="form">
                <h2>Sign Up</h2>
                <div class="form-element">
                    <label for="fullname">FullName</label>
                    <input type="text" id="fullname" name="txtfullname" placeholder="Enter FullName">
                </div>
                <div class="form-element">
                    <label for="signup-email">Email</label>
                    <input type="text" id="signup-email" name="txtemail" placeholder="Enter email">
                </div>
                <div class="form-element">
                    <label for="signup-password">Password</label>
                    <input type="password" id="signup-password" name="txtpassword" placeholder="Enter password">
                </div>
                <div class="form-element">
                    <button type="submit">Sign up</button>
                </div>
                <div class="form-element">
                    <a href="#" class="login" onclick="closeAndOpen()">Already have an account? Log In</a>
                </div>
            </form>
        </div>

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

        <div id="signupForm" class="popup signup-popup">
            <button class="close-btn" onclick="closeSignupForm()">x</button>
            <form action="MainController" method="POST" class="form">
                <h2>Sign Up</h2>
                <div class="form-element">
                    <label for="signup-userID">Email</label>
                    <input type="text" id="signup-userID" name="txtEmail1" required value="${param.txtEmail1}" placeholder="Enter Email"/>
                </div>
                <div class="form-element">
                    <label for="signup-password">Password</label>
                    <input type="password" id="signup-password" name="txtPassword1" required value="${param.txtPassword1}" placeholder="Enter Password">
                </div>
                <div class="form-element">
                    <label for="signup-confirm">Confirm Password</label>
                    <input type="password" id="signup-confirm" name="txtConfirm" required value="${param.txtConfirm}" placeholder="Confirm password">
                </div>
                <div class="form-element">
                    <input type="submit" name="action" value="Signup">
                    <input type="reset" value="Reset">
                </div>
                <div class="form-element">
                    <a href="#" class="login" onclick="closeAndOpen()">Already have an account? Log In</a>
                </div>
            </form>
        </div>
        <script>
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



            function openLoginForm() {
                document.getElementById("myForm").style.display = "block";
            }

            function closeLoginForm() {
                document.getElementById("myForm").style.display = "none";
            }

            function openSignupForm() {
                document.getElementById("myForm").style.display = "none";
                document.getElementById("signupForm").style.display = "block";
            }

            function closeSignupForm() {
                document.getElementById("signupForm").style.display = "none";
            }

            function closeAndOpen() {
                document.getElementById("myForm").style.display = "block";
                document.getElementById("signupForm").style.display = "none";
            }
            window.onload = function () {
                const loginError = "<%= request.getAttribute("Error") != null ? request.getAttribute("Error") : ""%>";
                if (loginError) {
                    alert(loginError);
                }
                const errorMessages = "<%= request.getAttribute("errorMessages") != null ? request.getAttribute("errorMessages") : ""%>";
                if (errorMessages) {
                    alert(errorMessages);
                }
            };
        </script>
    </body>
    <footer>
        <p>&copy; 2024 Librairie. All rights reserved.</p>
    </footer>
</html>
