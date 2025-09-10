using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Nabil_s_portfolio
{
    public partial class login_admin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();  

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "Username and password are required!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Admins WHERE Username=@Username AND PasswordHash=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    int count = (int)cmd.ExecuteScalar();
                    if (count == 1)
                    {
                        Session["AdminLoggedIn"] = true;
                        Session["AdminUsername"] = username;

                        HttpCookie adminCookie = new HttpCookie("AdminUser");
                        adminCookie.Value = username;
                        adminCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(adminCookie);

                        Response.Redirect("admin_dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invalid username or password!";
                    }
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_register.aspx");
        }
    }
}