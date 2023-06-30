<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddToCart.aspx.cs" Inherits="WebApplication9.ProductDetails" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add To Cart</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Add To Cart</h1>
            <%-- Retrieve the product ID from the query string --%>
            <% int productID = Convert.ToInt32(Request.QueryString["ProductID"]); %>
            <% string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString; %>
            <% using (SqlConnection connection = new SqlConnection(connectionString)) { %>
                <% connection.Open(); %>
                <% SqlCommand command = new SqlCommand("SELECT [ProductID], [Brand], [Names], [Price], [ImageUrl] FROM [Mobiles] WHERE [ProductID] = @ProductID", connection); %>
                <% command.Parameters.AddWithValue("@ProductID", productID); %>
                <% SqlDataReader reader = command.ExecuteReader(); %>
                <% if (reader.Read()) { %>
                    <% int userID = Convert.ToInt32(Session["UserID"]); %>
                    <% SqlCommand insertCommand = new SqlCommand("INSERT INTO [Cart] ([ProductID], [Brand], [Names], [Price], [ImageUrl], [CreatedAt]) VALUES (@ProductID, @Brand, @Names, @Price, @ImageUrl, @CreatedAt)", connection); %>
                    <% insertCommand.Parameters.AddWithValue("@ProductID", reader["ProductID"]); %>
                    <% insertCommand.Parameters.AddWithValue("@Brand", reader["Brand"]); %>
                    <% insertCommand.Parameters.AddWithValue("@Names", reader["Names"]); %>
                    <% insertCommand.Parameters.AddWithValue("@Price", reader["Price"]); %>
                    <% insertCommand.Parameters.AddWithValue("@ImageUrl", reader["ImageUrl"]); %>
                    <% insertCommand.Parameters.AddWithValue("@CreatedAt", DateTime.Now); %>
                    <% reader.Close(); %>
                    <% insertCommand.ExecuteNonQuery(); %>
                    <% Response.Redirect("ProductDetails.aspx?ProductID=" + productID + "&SuccessMessage=Product added to cart successfully"); %>
                <% } %>
            <% } %>
        </div>
    </form>
</body>
</html>