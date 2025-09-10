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
    public partial class edit_skill : System.Web.UI.Page
    {
        int skillId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("login_admin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out skillId))
                Response.Redirect("admin_dashboard.aspx");

            if (!IsPostBack)
                LoadSkill();
        }

        private void LoadSkill()
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Skills WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", skillId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtSkillName.Text = reader["SkillName"].ToString();
                    txtPercentage.Text = reader["Percentage"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string skillName = txtSkillName.Text.Trim();
            string percentageText = txtPercentage.Text.Trim();
            int percentage = 0;

            if (string.IsNullOrEmpty(skillName) || !int.TryParse(percentageText, out percentage))
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
                string query = "UPDATE Skills SET SkillName=@SkillName, Percentage=@Percentage WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@SkillName", skillName);
                cmd.Parameters.AddWithValue("@Percentage", percentage);
                cmd.Parameters.AddWithValue("@Id", skillId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("admin_dashboard.aspx");
        }
    }
}