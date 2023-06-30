using System;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication9
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the product ID from the query string
            int productID = Convert.ToInt32(Request.QueryString["ProductID"]);

            // Retrieve the product details from the database
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT [ProductID], [Brand], [Names], [Price] FROM [Mobiles] WHERE [ProductID] = @ProductID", connection);
                command.Parameters.AddWithValue("@ProductID", productID);
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Insert the product into the cart table
                    SqlCommand insertCommand = new SqlCommand("INSERT INTO [Cart] ([UserID], [ProductID], [Brand], [Names], [Price], [CreatedAt]) VALUES (@UserID, @ProductID, @Brand, @Names, @Price, @CreatedAt)", connection);
                    insertCommand.Parameters.AddWithValue("@ProductID", reader["ProductID"]);
                    insertCommand.Parameters.AddWithValue("@Brand", reader["Brand"]);
                    insertCommand.Parameters.AddWithValue("@Names", reader["Names"]);
                    insertCommand.Parameters.AddWithValue("@Price", reader["Price"]);
                    insertCommand.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                    insertCommand.ExecuteNonQuery();

                    // Show a message to the user
                    string message = "تمت إضافة العنصر للسلة بنجاح";
                    Response.Write("<script>alert('" + message + "');</script>");

                    // Redirect the user back to the product details page
                    Response.Redirect("ProductDetails.aspx?ProductID=" + productID);
                }
                else
                {
                    // Show a message to the user
                    Response.Write("The product could not be found.");
                }

                reader.Close();
            }
        }
    }
}