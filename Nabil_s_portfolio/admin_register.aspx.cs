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
    public partial class admin_register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string confirmPassword = txtConfirmPassword.Text.Trim();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                lblError.Text = "All fields are required!";
                return;
            }

            if (password != confirmPassword)
            {
                lblError.Text = "Passwords do not match!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if username exists
                string checkUser = "SELECT COUNT(*) FROM Admins WHERE Username=@Username";
                using (SqlCommand cmd = new SqlCommand(checkUser, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    int exists = (int)cmd.ExecuteScalar();
                    if (exists > 0)
                    {
                        lblError.Text = "Username already exists!";
                        return;
                    }
                }

                // Insert new admin
                string query = "INSERT INTO Admins (Username, PasswordHash) VALUES (@Username, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password); 

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("login_admin.aspx");
        }
    }
}