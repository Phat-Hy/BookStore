<%@page import="dto.OrderDTO"%>
<%@page import="dto.HistoryDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UsersDTO"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>History</title>
        <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
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
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            header {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 1rem;
            }

            nav {
                background-color: #444;
                color: #fff;
                padding: 0.5rem;
            }

            nav a {
                color: #fff;
                text-decoration: none;
                padding: 0.5rem 1rem;
            }

            .setting {
                text-align: center;
                margin: 2rem 0;
            }

            .setting a {
                text-decoration: none;
                padding: 0.5rem 1rem;
                margin: 0 0.5rem;
            }

            table {
                width: 90%;
                margin: 2rem auto;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }

            th, td {
                padding: 1rem;
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

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 0.5rem 1rem;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            footer {
                background-color: #333;
                color: #fff;
                text-align: center;
                padding: 1rem;
                bottom: 0;
                width: 100%;
            }

            h3 {
                color: #333;
                border-bottom: 2px solid #ddd;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            /* Input field styling */
            input[type="text"],
            input[type="tel"],
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 10px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* Disabled input styling */
            input[disabled] {
                background-color: #e9e9e9;
                cursor: not-allowed;
            }

            /* Button styling */
            input[type="submit"],
            input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #45a049;
            }

            input[type="reset"] {
                background-color: #f44336;
            }

            input[type="reset"]:hover {
                background-color: #da190b;
            }

            /* Error message styling */
            p[class="mess"] {
                color: red;
                font-style: italic;
            }

            /* Responsive design */
            @media screen and (max-width: 600px) {
                form {
                    width: 100%;
                    padding: 10px;
                }
            }
            h3{
                margin: 0 400px;
            }
            .setting{
                font-size: 45px;
                text-align: center;
                margin: 30px auto;
            }
            .cancel-button-container {
                display: flex;
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
            if (user == null){
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                if (user.getRoleID()!= 3 ){
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
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

        <table>
            <thead>
                <tr>
                    <th>NO.</th>
                    <th>Oder ID</th>
                    <th>Order Date</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Details</th>
                    <th>Cancel</th>
                </tr>
            </thead>

            <tbody>

                <%
                    int i = 0;
                    List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("list");
                    String[] status = {"", "Approved", "Cancelled", "Pending", "Finished"};
                    if (list == null) {
                        request.getRequestDispatcher("MainController?action=history").forward(request, response);
                    } else {
                        for (OrderDTO o : list) {
                %>

                <tr>
                    <td><%=++i%></td>
                    <td><%=o.getOrderID()%></td>
                    <td><%=o.getOrderDate()%></td>
                    <td><%=o.getTotalAmount()%></td>
                    <td><%=status[o.getStatusID()]%></td>
                    <td>
                        <form action="MainController">
                            <input type="hidden" name="oID"  value="<%=o.getOrderID()%>">
                            <input type="Submit" name="action" value="History Details">
                        </form>
                    </td>
                    <td>
                        <div class="cancel-button-container">
                            <%
                                if (o.getStatusID() == 3) {
                            %>
                            <form action="MainController" onsubmit="showConfirmModal(event)">
                                <input type="hidden" name="oID" value="<%=o.getOrderID()%>">
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
                    </td>
                </tr>

                <%
                        }
                    }
                %>
            </tbody>
        </table>
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
