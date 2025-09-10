using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nabil_s_portfolio
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null || !(bool)Session["AdminLoggedIn"])
            {
                HttpCookie cookie = Request.Cookies["AdminUser"];
                if (cookie != null)
                {
                    Session["AdminLoggedIn"] = true;
                    Session["AdminUsername"] = cookie.Value;
                }
                else
                {
                    Response.Redirect("login_admin.aspx");
                }
            }

            if (!IsPostBack)
            {
                // Show logged-in admin username
                if (Session["AdminUsername"] != null)
                {
                    string username = Session["AdminUsername"].ToString();
                    lblAdminUser.Text = char.ToUpper(username[0]) + username.Substring(1);
                }

                LoadAbout();
                LoadSkills();
                LoadProjects();
            }
        }

        // Logout button click
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Clear cookie
            if (Request.Cookies["AdminUser"] != null)
            {
                HttpCookie cookie = new HttpCookie("AdminUser");
                cookie.Expires = DateTime.Now.AddDays(-1); // expired
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("home.aspx");
        }

        // Load About section
        private void LoadAbout()
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM About";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptAbout.DataSource = dt;
                rptAbout.DataBind();
            }
        }

        // Load Skills section
        private void LoadSkills()
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Skills";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptSkills.DataSource = dt;
                rptSkills.DataBind();
            }
        }

        // Load Projects section
        private void LoadProjects()
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Projects";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }
    }
}