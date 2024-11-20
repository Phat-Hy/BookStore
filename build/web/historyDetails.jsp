<%@page import="dao.BooksDAO"%>
<%@page import="dto.OrderItemsDTO"%>
<%@page import="dto.BooksDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dto.HistoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UsersDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>History Details</title>
        <link rel="stylesheet" href="styles.css">
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
            .setting{
                font-size: 45px;
                text-align: center;
                margin: 30px auto;
            }
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #333;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            nav {
                background-color: #444;
                padding: 0.5rem 0;
                text-align: center;
            }

            nav a {
                color: #fff;
                text-decoration: none;
                margin: 0 15px;
                font-size: 16px;
            }

            .setting {
                text-align: center;
                margin: 20px 0;
            }

            .setting a {
                text-decoration: none;
                padding: 5px 10px;
                margin: 0 5px;
            }

            h2, h4 {
                text-align: center;
                margin: 20px 0;
            }

            .Address {
                background-color: #fff;
                padding: 20px;
                margin: 20px auto;
                max-width: 600px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            .Address h3 {
                border-bottom: 2px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            table {
                width: 90%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            img {
                max-width: 100px;
                height: auto;
                display: block;
            }


            @media screen and (max-width: 768px) {
                .Address, table {
                    width: 95%;
                }

                th, td {
                    padding: 8px;
                }
            }
            .cancel-button-container {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .cancel-button {
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                text-align: center;
                text-decoration: none;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s, opacity 0.3s;
            }

            .cancel-button[type="submit"] {
                background-color: #ff4136;
                color: white;
            }

            .cancel-button[type="submit"]:hover {
                background-color: #ff1d0e;
            }

            .cancel-button[disabled] {
                background-color: #cccccc;
                color: #666666;
                cursor: not-allowed;
            }

            .cancel-button[disabled]:hover {
                opacity: 0.8;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
                border-radius: 5px;
                text-align: center;
            }

            .modal-buttons {
                margin-top: 20px;
            }

            .modal-button {
                padding: 10px 20px;
                margin: 0 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
            }

            .modal-button.yes {
                background-color: #ff4136;
                color: white;
            }

            .modal-button.no {
                background-color: #4CAF50;
                color: white;
            }

            .modal-button:hover {
                opacity: 0.8;
            }
                        .signup-popup {
                height: 63%;
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
        <div id="confirmModal" class="modal">
            <div class="modal-content">
                <h2>Confirm Cancellation</h2>
                <p>Are you sure you want to cancel this order?</p>
                <div class="modal-buttons">
                    <button id="confirmYes" class="modal-button yes">Yes, Cancel Order</button>
                    <button id="confirmNo" class="modal-button no">No, Keep Order</button>
                </div>
            </div>
        </div>
        <%
            //Lay du lieu tu session
            UsersDTO user = (UsersDTO) session.getAttribute("USER");
            if (user == null){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if (user.getRoleID()!= 3 ){
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
            OrderDTO order = (OrderDTO) request.getAttribute("order");
            String[] status = {"", "Approved", "Cancelled", "Pending", "Finished"};
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

        <!--Setting-->
        <h1 class="setting">
            <span style="color: green; text-decoration: none">
                <a href="MainController?action=history" style="color: green; text-decoration: none;">History</a>
            </span>
            | <span style="color: green; text-decoration: none">
                <a href="customer.jsp" style="color: black; text-decoration: none;">Setting </a>
            </span> | 
            <span style="color: red; text-decoration: none">
                <a href="MainController?action=Logout" style="color: red; text-decoration: none;">Logout</a>
            </span>
        </h1>

        <h2>Order ID: <%=order.getOrderID()%></h2>
        <h4>Status: <%=status[order.getStatusID()]%></h4>
        <div style="display: flex">
            <table style="width: 60vw">
                <thead>
                    <tr>
                        <th>NO.</th>
                        <th>Book</th>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>

                <tbody>

                    <%
                        int i = 0;
                        int count = 0;
                        List<OrderItemsDTO> list = (List<OrderItemsDTO>) request.getAttribute("listoi");
                        if (list == null) {
                            request.getRequestDispatcher("MainController?action=History+Details").forward(request, response);
                        } else {
                            for (OrderItemsDTO oi : list) {
                                BooksDTO b = new BooksDAO().getBookById(oi.getBookID());
                                count += oi.getQuantity();
                    %>

                    <tr>
                        <td><%=++i%></td>
                        <td><a href="BooksDetailsController?bookID=<%= b.getBookID() %>"style="color: black; text-decoration: none"><img style="width: 100px" src="<%=b.getImagePath()%>"></a></td>
                        <td><a href="BooksDetailsController?bookID=<%= b.getBookID() %>"><%=b.getTitle()%></a></td>
                        <td><%=oi.getQuantity()%></td>
                        <td><%=oi.getPrice()%></td>
                        <td><%=oi.getQuantity() * oi.getPrice()%></td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td style="padding: 30px 20px; font-weight: bold; font-size: 18px" colspan="3">Total:</td>
                        <td style="padding: 30px 10px; font-weight: bold; font-size: 18px"><%=count%></td>
                        <td style="padding: 30px 20px; font-weight: bold; font-size: 18px"></td>
                        <td style="font-weight: bold; font-size: 18px"><%=order.getTotalAmount()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
         <!-- Login/Sign Up -->
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
            <div style="margin: 0 auto" >
                <div class="Address" style="width: 25vw; max-height: 390px">
                    <h3>Delivery Details</h3>
                    <p>Name: <%=order.getReceiverName()%></p>
                    <p>Phone: <%=order.getReceiverPhoneNumber()%></p>
                    <p>Company: <%=order.getCompanyName()%></p>
                    <p>Apartment: <%=order.getApartment()%></p>
                    <p>Street: <%=order.getStreetAddress()%></p>
                    <p>City: <%=order.getCity()%></p>
                    <p>Postcode: <%=order.getPostcode()%></p>
                </div>

                <div class="cancel-button-container">
                    <%
                        if (order.getStatusID() == 3) {
                    %>
                    <form action="MainController" onsubmit="showConfirmModal(event)">
                        <input type="hidden" name="oID" value="<%=order.getOrderID()%>">
                        <input type="hidden" name="action" value="Cancel Order">
                        <input type="submit" name="action" value="Cancel Order" class="cancel-button">
                    </form>
                    <%
                    } else {
                    %>
                    <form action="MainController">
                        <input type="submit" name="action" value="Cancel Order" disabled class="cancel-button">
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <script>
            let formToSubmit;

            function showConfirmModal(event) {
                event.preventDefault();
                formToSubmit = event.target;
                document.getElementById('confirmModal').style.display = 'block';
            }
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
            document.getElementById('confirmYes').addEventListener('click', function () {
                document.getElementById('confirmModal').style.display = 'none';
                if (formToSubmit) {
                    formToSubmit.submit();
                }
            });

            document.getElementById('confirmNo').addEventListener('click', function () {
                document.getElementById('confirmModal').style.display = 'none';
            });
        </script>


        <!--Footer-->
        <footer>
            <p>&copy; 2024 Book Store. All rights reserved.</p>
        </footer>

    </body>
</html>
