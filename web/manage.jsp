<%-- 
    Document   : admin
    Created on : Aug 13, 2024, 5:08:20 PM
    Author     : Mlxg
--%>

<%@page import="dto.OrderDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dto.BooksDTO"%>
<%@page import="dao.BooksDAO"%>
<%@page import="dto.UsersDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsersDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" 
              integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title><%%>Manage Page</title>
    </head>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        /* Header styling */
        header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Main content section */

        /* Footer styling */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }

        /* Navigation bar styling */
        nav {
            background-color: #444;
            padding: 10px 0;
            text-align: center;
        }

        /* Links in the navigation */
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            cursor: pointer;
        }

        /* Hover effect on nav links */
        nav a:hover {
            color: red;
        }

        /* Section container styling */
        section {
            padding: 20px;
            background-color: #fff;
            margin: 20px auto;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 90%;
            display: none; /* Hide all sections initially */
        }

        section h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 10px;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: #fff;
            font-size: 16px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px 15px;
            text-align: left;
        }

        table th {
            background-color: #f4f4f4;
            font-weight: bold;
            color: #333;
        }

        table td input[type="number"] {
            width: 100%;
            padding: 5px;
            font-size: 14px;
        }

        table input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }

        table input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Add responsive styling */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }

            section {
                padding: 10px;
            }

            table {
                font-size: 14px;
            }

            table th, table td {
                padding: 8px;
            }

            nav a {
                font-size: 14px;
            }
        }
        #add-book-details {
            display: block; /* Show by default */
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
        }

        /* Form container styling */
        #add-book-details form {
            display: flex;
            flex-direction: column;
        }

        /* Form element styling */
        #add-book-details label {
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }

        #add-book-details input[type="text"],
        #add-book-details input[type="number"],
        #add-book-details select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; /* Includes padding and border in the element's total width and height */
        }

        #add-book-details input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        #add-book-details input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Add responsive styling */
        @media (max-width: 768px) {
            #add-book-details {
                padding: 10px;
            }

            #add-book-details input[type="text"],
            #add-book-details input[type="number"],
            #add-book-details select {
                font-size: 14px;
                padding: 8px;
            }

            #add-book-details input[type="submit"] {
                font-size: 14px;
                padding: 8px 16px;
            }
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
        /* Add Staff Section Styling */
        #add-staff {
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 20px auto;
        }

        #add-staff h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Form container styling */
        #add-staff form {
            display: flex;
            flex-direction: column;
        }

        /* Label styling */
        #add-staff label {
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }

        /* Input field styling */
        #add-staff input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box; /* Includes padding and border in element's total width/height */
        }

        /* Submit and reset button styling */
        #add-staff input[type="submit"],
        #add-staff input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        #add-staff input[type="submit"]:hover,
        #add-staff input[type="reset"]:hover {
            background-color: #45a049;
        }

        /* Staff Management Table Styling */
        #add-staff table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        #add-staff table th,
        #add-staff table td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: left;
        }

        #add-staff table th {
            background-color: #f4f4f4;
            font-weight: bold;
            color: #333;
        }

        #add-staff table td input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }

        #add-staff table td input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            #add-staff {
                padding: 10px;
            }

            #add-staff input[type="text"] {
                font-size: 14px;
                padding: 8px;
            }

            #add-staff input[type="submit"],
            #add-staff input[type="reset"] {
                font-size: 14px;
                padding: 8px 16px;
            }

            #add-staff table th,
            #add-staff table td {
                padding: 10px;
            }
        }
    </style>

    <body>
        <header>
            <%
                UsersDTO user = (UsersDTO) session.getAttribute("USER");
                UsersDAO ud = new UsersDAO();
                List<UsersDTO> users = ud.showStaffRole();
                List<UsersDTO> users1 = ud.showUserRole();
                BooksDAO bd = new BooksDAO();
                List<BooksDTO> books = bd.showAllBooks();
                OrderDAO od = new OrderDAO();
                List<OrderDTO> orders = od.showAllOrders();
            %>
            <h1 onclick="redirectToIndex()" class="clickable-header">
                Librairie
            </h1>
        </header>
        <nav>
            <a id="book-link">Book Details</a>
            <a id="add-book-link">Add Book</a>                
            <a id="order-link">Order Details</a>
            <%
                if (user != null && user.getRoleID() == 1) {
            %>
            <a id="staff-link">Add Staff</a>
            <a id="view-staff-link">Manage Staff/User</a>
            <%}%>                
        </nav>


        <div class="container">
            <!-- Book Details Section -->
            <section id="book-details">
                <h2>Book Details</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (BooksDTO b : books) {%>
                        <tr>
                            <td><%= b.getTitle()%></td>
                            <td>
                                <form action="MainController" method="post" style="display:inline;">
                                    <input type="hidden" name="bookid" value="<%= b.getBookID()%>"/>
                                    <input type="number" name="price" value="<%= b.getPrice()%>" step="0.01" min="0" />
                                    <input type="submit" name="action" value="Save Price"/>
                                </form>
                            </td>
                            <td>
                                <form action="MainController" method="post" style="display:inline;">
                                    <input type="hidden" name="bookid" value="<%= b.getBookID()%>"/>
                                    <input type="number" name="quantity" value="<%= b.getQuantity()%>" min="0" />
                                    <input type="submit" name="action" value="Save Quantity"/>
                                </form>
                            </td>
                            <td>
                                <%
                                    int statusID = b.getStatusID();
                                    String statusName;
                                    switch (statusID) {
                                        case 1:
                                            statusName = "In Stock";
                                            break;
                                        case 2:
                                            statusName = "Out of stock";
                                            break;
                                        default:
                                            statusName = "Unknown";
                                            break;
                                    }
                                %>
                                <%= statusName%>
                            </td>
                        </tr>       
                        <%}%>
                    </tbody>
                </table>
            </section>

            <!-- Order Details Section -->
            <section id="add-book-details">
                <h2>Add Book</h2>
                <form action="MainController" method="post">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required /><br/>

                    <label for="volume">Volume:</label>
                    <input type="number" id="volume" name="volume" min="0" /><br/>

                    <label for="description">Description:</label>
                    <input type="text" id="description" name="description" required /><br/>

                    <label for="price">Price:</label>
                    <input type="number" id="price" name="price" step="0.01" required /><br/>

                    <label for="imagePath">Image Path:</label>
                    <input type="text" id="imagePath" name="imagePath" /><br/>

                    <label for="pages">Pages:</label>
                    <input type="number" id="pages" name="pages" min="1" required /><br/>

                    <label for="formatID">Format:</label>
                    <select name="formatID" id="formatID" required>
                        <option value="1">Paperback</option>
                        <option value="2">Hardcover</option>
                    </select><br/>

                    <label for="publisherID">Publisher:</label>
                    <select name="publisherID" id="publisherID" required>
                        <option value="1">VIZ Media LLC</option>
                        <option value="2">Kodansha Com</option>
                        <option value="3">New Directions</option>
                        <option value="4">One Peace Books</option>
                        <option value="5">Vintage</option>
                        <option value="6">Schocken</option>
                        <option value="7">Mariner Books Classics</option>
                        <option value="8">Random House USA Inc</option>
                        <option value="9">Usborne Publishing Ltd</option>
                        <option value="10">Penguin Press</option>
                        <option value="11">First Second</option>
                        <option value="12">W. W. Norton & Company</option>
                        <option value="13">Bloomsbury Publishing</option>
                        <option value="14">Scribner</option>
                    </select><br/>

                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" min="0" required /><br/>

                    <label for="authorID">Author:</label>
                    <select name="authorID" id="authorID" required>
                        <option value="1">Junji Ito</option>
                        <option value="2">Hirokatsu Kihara</option>
                        <option value="3">Katsuhiro Otomo</option>
                        <option value="4">Osamu Dazai</option>
                        <option value="5">Fyodor Dostoevsky</option>
                        <option value="6">Haruki Murakami</option>
                        <option value="7">Franz Kafka</option>
                        <option value="8">George Orwell</option>
                        <option value="9">Neil Landau</option>
                        <option value="10">Usborne</option>
                        <option value="11">James Kaplan</option>
                        <option value="12">Dan Santat</option>
                        <option value="13">Emily Carroll</option>
                        <option value="14">Ruth Ozeki</option>
                        <option value="15">Ian Buruma</option>
                        <option value="16">Simone de Beauvoir</option>
                        <option value="17">Douglas Wolk</option>
                        <option value="18">Paul M.M. Cooper</option>
                        <option value="19">Anthony Doerr</option>
                    </select><br/>

                    <label for="categoryID">Category:</label>
                    <select name="categoryID" id="categoryID" required>
                        <option value="1">Fiction</option>
                        <option value="2">Non-Fiction</option>
                        <option value="3">Mystery</option>
                        <option value="4">Thriller</option>
                        <option value="5">Science Fiction</option>
                        <option value="6">Fantasy</option>
                        <option value="7">Romance</option>
                        <option value="8">Historical Fiction</option>
                        <option value="9">Biography</option>
                        <option value="10">Autobiography</option>
                        <option value="11">Memoir</option>
                        <option value="12">Self-Help</option>
                        <option value="13">Health & Wellness</option>
                        <option value="14">Cooking</option>
                        <option value="15">Travel</option>
                        <option value="16">Art</option>
                        <option value="17">Photography</option>
                        <option value="18">Poetry</option>
                        <option value="19">Drama</option>
                        <option value="20">Humor</option>
                        <option value="21">Children's Books</option>
                        <option value="22">Young Adult</option>
                        <option value="23">Graphic Novels</option>
                        <option value="24">Comics</option>
                        <option value="25">Manga</option>
                        <option value="26">Horror</option>
                        <option value="27">Business</option>
                        <option value="28">Economics</option>
                        <option value="29">Politics</option>
                        <option value="30">History</option>
                        <option value="31">Science</option>
                        <option value="32">Mathematics</option>
                        <option value="33">Philosophy</option>
                        <option value="34">Religion</option>
                        <option value="35">Spirituality</option>
                        <option value="36">Education</option>
                        <option value="37">Technology</option>
                        <option value="38">Engineering</option>
                        <option value="39">Law</option>
                        <option value="40">Music</option>
                        <option value="41">Sports</option>
                        <option value="42">True Crime</option>
                        <option value="43">Essays</option>
                        <option value="44">Anthology</option>
                        <option value="45">Short Stories</option>
                        <option value="46">Adventure</option>
                        <option value="47">Western</option>
                        <option value="48">LGBTQ+</option>
                        <option value="49">Dystopian</option>
                        <option value="50">Environmental</option>
                        <option value="51">Parenting</option>
                    </select><br/>

                    <input type="submit" name="action" value="Add Book"/>
                </form>
            </section>


            <!-- Order Details Section -->
            <section id="order-details">
                <h2>Order Details</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Order Date</th>
                            <th>Street Address</th>
                            <th>Company Name</th>
                            <th>Apartment</th>
                            <th>City</th>
                            <th>Postcode</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Manage</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (OrderDTO o : orders) {%>
                        <tr>
                            <td><%= o.getOrderID()%></td>
                            <td><%= o.getOrderDate()%></td>
                            <td><%= o.getStreetAddress()%></td>
                            <td><%= o.getCompanyName()%></td>
                            <td><%= o.getApartment()%></td>
                            <td><%= o.getCity()%></td>
                            <td><%= o.getPostcode()%></td>
                            <td><%= o.getTotalAmount()%></td>
                            <td>
                                <%
                                    int statusID = o.getStatusID();
                                    String statusName;
                                    switch (statusID) {
                                        case 1:
                                            statusName = "Approved";
                                            break;
                                        case 2:
                                            statusName = "Cancelled";
                                            break;
                                        case 3:
                                            statusName = "Pending";
                                            break;
                                        case 4:
                                            statusName = "Finished";
                                            break;
                                        default:
                                            statusName = "Unknown";
                                            break;
                                    }
                                %>
                                <%= statusName%>
                            </td>
                            <td>
                                <form action="MainController" method="post" style="display:inline;">
                                    <input type="hidden" name="orderid" value="<%= o.getOrderID()%>"/>
                                    <% if (statusID == 3) { %>
                                    <input type="submit" name="action" value="Approve"/>
                                    <input type="submit" name="action" value="Deny"/>
                                    <%}%>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </section>

            <!-- Add Staff Section -->
            <section id="add-staff">

                <h2>Add Staff</h2>
                <form action="MainController" method="post">
                    <label for="email">Email :</label>
                    <input type="text" name="staffEmail" required /><br/>

                    <label for="password">Password :</label>
                    <input type="text" name="staffPassword" required /><br/>

                    <label for="Phone">Phone Number :</label>
                    <input type="number" name="staffPhone" required /><br/>

                    <input type="submit" name="action" value="Create Staff"/>
                    <input type="reset">
                </form>
            </section>    

            <section id="view-staff">
                <h2>Manage Staff</h2>                    
                <table>
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Change Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (UsersDTO u : users) {%>
                        <tr>
                            <td><%= u.getEmail()%></td>
                            <td><%= u.getPassword()%></td>                                
                            <td>Staff</td>
                            <td>
                                <% if (u.getStatusID() == 1) { %>
                                Online
                                <% } else { %>
                                Banned
                                <% }%>
                            </td>
                            <td>
                                <form action="MainController" method="post">
                                    <input type="hidden" name="email" value="<%= u.getEmail()%>"/>
                                    <input type="hidden" name="status" value="<%= u.getStatusID()%>">
                                    <input type="submit" name="action" value="Change Status"/>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <h2>Manage User</h2>                    
                <table>
                    <thead>
                        <tr>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Change Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (UsersDTO u : users1) {%>
                        <tr>
                            <td><%= u.getEmail()%></td>
                            <td><%= u.getPassword()%></td>                                
                            <td>User</td>
                            <td>
                                <% if (u.getStatusID() == 1) { %>
                                Online
                                <% } else { %>
                                Banned
                                <% }%>
                            </td>
                            <td>
                                <form action="MainController" method="post">
                                    <input type="hidden" name="email" value="<%= u.getEmail()%>"/>
                                    <input type="hidden" name="status" value="<%= u.getStatusID()%>">
                                    <input type="submit" name="action" value="Change Status"/>
                                </form>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </section>
        </div>



        <!-- JavaScript to handle showing and hiding sections -->
        <script>
            // Get section elements
            const bookDetailsSection = document.getElementById('book-details');
            const orderDetailsSection = document.getElementById('order-details');
            const addBookSection = document.getElementById('add-book-details');
            const addStaffSection = document.getElementById('add-staff');
            const viewStaffSection = document.getElementById('view-staff');

            // Get navigation link elements
            const bookLink = document.getElementById('book-link');
            const orderLink = document.getElementById('order-link');
            const addBookLink = document.getElementById('add-book-link');
            const staffLink = document.getElementById('staff-link');
            const viewStaffLink = document.getElementById("view-staff-link")

            // Function to hide all sections
            function hideAllSections() {
                bookDetailsSection.style.display = 'none';
                orderDetailsSection.style.display = 'none';
                addBookSection.style.display = 'none';
                addStaffSection.style.display = 'none';
                viewStaffSection.style.display = 'none';
            }

            // Add event listeners to links
            bookLink.addEventListener('click', () => {
                hideAllSections();
                bookDetailsSection.style.display = 'block';
            });

            addBookLink.addEventListener('click', () => {
                hideAllSections();
                addBookSection.style.display = 'block';
            });

            orderLink.addEventListener('click', () => {
                hideAllSections();
                orderDetailsSection.style.display = 'block';
            });

            staffLink.addEventListener('click', () => {
                hideAllSections();
                addStaffSection.style.display = 'block';
            });

            viewStaffLink.addEventListener('click', () => {
                hideAllSections();
                viewStaffSection.style.display = 'block';
            });

            // Hide all sections on page load
            window.onload = hideAllSections;
            // Redirect to index.jsp
            function redirectToIndex() {
                // Redirect to index.jsp
                window.location.href = 'LogoutController';
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
</html>
