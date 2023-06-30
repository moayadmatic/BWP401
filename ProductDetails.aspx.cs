using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication9
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productID = Convert.ToInt32(Request.QueryString["ProductID"]);
                string imageUrl = Request.QueryString["ImageUrl"];

                if (!string.IsNullOrEmpty(imageUrl))
                {
                    ProductImage.ImageUrl = imageUrl;
                }
            }
        }
    }
}