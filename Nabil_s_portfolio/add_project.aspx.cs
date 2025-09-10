using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;  
using System.Data.SqlClient; 

namespace Nabil_s_portfolio
{
    public partial class add_project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminLoggedIn"] == null)
                Response.Redirect("login_admin.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string imageUrl = "";

            if (fuProjectImage.HasFile)
            {
                // Optional: check file extension
                string ext = System.IO.Path.GetExtension(fuProjectImage.FileName).ToLower();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".gif")
                {
                    lblError.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed.";
                    return;
                }

                string folderPath = Server.MapPath("~/Images/Projects/");
                if (!System.IO.Directory.Exists(folderPath))
                {
                    System.IO.Directory.CreateDirectory(folderPath);
                }

                string fileName = System.IO.Path.GetFileName(fuProjectImage.FileName);
                fuProjectImage.SaveAs(System.IO.Path.Combine(folderPath, fileName));

                imageUrl = "Images/Projects/" + fileName;
            }
            else
            {
                lblError.Text = "Please select an image to upload.";
                return;
            }

            string projectLink = txtProjectLink.Text.Trim();

            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description))
            {
                lblError.Text = "Title and Description are required!";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Projects (Title, Description, ImageUrl, ProjectLink) VALUES (@Title, @Description, @ImageUrl, @ProjectLink)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ImageUrl", imageUrl);
                cmd.Parameters.AddWithValue("@ProjectLink", projectLink);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("admin_dashboard.aspx");
        }
    }
}