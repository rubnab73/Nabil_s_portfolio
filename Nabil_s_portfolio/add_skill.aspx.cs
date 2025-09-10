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
    public partial class add_skill : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
            {
                Response.Redirect("addmin_login.aspx");
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string skillName = txtSkillName.Text.Trim();
            string percentageText = txtPercentage.Text.Trim();
            int percentage = 0;

            if (string.IsNullOrEmpty(skillName) || string.IsNullOrEmpty(percentageText) || !int.TryParse(percentageText, out percentage))
            {
                lblError.Text = "Please enter a valid skill name and percentage!";
                return;
            }

            if (percentage < 0 || percentage > 100)
            {
                lblError.Text = "Percentage must be between 0 and 100!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Skills (SkillName, Percentage) VALUES (@SkillName, @Percentage)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SkillName", skillName);
                cmd.Parameters.AddWithValue("@Percentage", percentage);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            // Redirect back to admin dashboard after adding
            Response.Redirect("admin_dashboard.aspx");
        }
    }
}
