using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nabil_s_portfolio
{
    public partial class edit_about : System.Web.UI.Page
    {
        int aboutId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("login_admin.aspx");

            if (!int.TryParse(Request.QueryString["Id"], out aboutId))
            {
                Response.Redirect("admin_dashboard.aspx");
            }

            if (!IsPostBack)
            {
                LoadAbout();
            }
        }

        private void LoadAbout()
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM About WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", aboutId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtFullName.Text = reader["FullName"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    imgCurrent.ImageUrl = reader["ProfileImage"].ToString();
                    ViewState["OldImage"] = reader["ProfileImage"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string newImagePath = ViewState["OldImage"].ToString();

            if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(description))
            {
                lblError.Text = "Full Name and Description are required!";
                return;
            }

            // Handle new image upload
            if (fuProfileImage.HasFile)
            {
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                    Directory.CreateDirectory(folderPath);

                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuProfileImage.FileName);
                string savePath = Path.Combine(folderPath, fileName);
                fuProfileImage.SaveAs(savePath);

                newImagePath = "~/Uploads/" + fileName;

                // Delete old image
                string oldFile = Server.MapPath(ViewState["OldImage"].ToString());
                if (File.Exists(oldFile))
                    File.Delete(oldFile);
            }

            // Update DB
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "UPDATE About SET FullName=@FullName, Description=@Description, ProfileImage=@ProfileImage WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ProfileImage", newImagePath);
                cmd.Parameters.AddWithValue("@Id", aboutId);
                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("admin_dashboard.aspx");
        }
    }
}
