<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebApplication9.ProductDetails" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>تفصيل المنتج</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>
        .nav-items {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    list-style: none;
}
        @media (max-width: 500px) {

            nav {
                position: sticky;
                top: 0;
                width: 100%;
            }

                nav .fa-bars {
                    display: block;
                    font-size: 3rem;
                }

                nav .nav-items {
                    position: absolute;
                    left: 0;
                    top: 10vh;
                    flex-direction: column;
                    width: 100%;
                    display: none;
                    background-color: #6e0aef;
                    padding: 2rem 0;
                }

                    nav .nav-items.active {
                        display: flex;
                    }

                    nav .nav-items .nav-item {
                        margin: 1rem 0;
                    }

                    nav .nav-items .nav-item a {
                            color: #fff;
                    }
        }
    </style>
</head>
<body>
    <header>
         <nav>
    <ul class="nav-items">
        <li class="nav-item" style="text-align: right">
            <a href="#" class="fa-solid fa-cart-shopping"></a>
        </li>
        <li class="nav-item">
            <i class="fas fa-bars"></i>
        </li>
        <li class="nav-item" style="text-align: right">
            <a href="#" class="nav-link">الصفحة الرئيسية</a>
        </li>
        <li class="nav-item" style="text-align: right">
            <a href="#features" class="nav-link">مميزاتنا</a>
        </li>
        <li class="nav-item" style="text-align: right">
            <a href="#phones" class="nav-link">أحدث الهواتف</a>
        </li>
    </ul>
</nav>
    </header>
    <form id="My_form" runat="server">
    <asp:Panel id="Panel1" runat="server">
        <asp:Image ID="ProductImage" runat="server" />
        <%
    // Retrieve the ID parameter from the URL
    int ID = Convert.ToInt32(Request.QueryString["ProductID"]);

    // Retrieve the product details from the database
    string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        connection.Open();
        SqlCommand command = new SqlCommand("SELECT [Brand], [Names], [Price], [ImageUrl], [Descriptions] FROM [Mobiles] WHERE [ProductID] = @ID", connection);
        command.Parameters.AddWithValue("@ID", ID);
        SqlDataReader reader = command.ExecuteReader();

        if (reader.Read())
        {
            %>
            <div class="product-details"> <!-- add a container div with the class name -->
                <img src="<%= reader.GetString(3) %>" />
                <h2 class="product-name"><%= reader.GetString(1) %></h2>
                <p class="brand-name"><%= reader.GetString(0) %></p>
                <p class="price"><%= reader.GetInt32(2).ToString() %></p>
                <p class="description"><%= reader.GetString(4) %></p>

                <a class="btn" href="AddToCart.aspx?ProductID=<%= ID %>">
                أضف إلى السلة
                </a>
                <button class="btn" id="checkout">checkout</button> <!-- add the btn class to the button -->
                
            </div>
            <% 
        }
        reader.Close();
    }
%>
    </asp:Panel>
    </form>
</body>
</html>