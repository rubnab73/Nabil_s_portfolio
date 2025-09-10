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
    public partial class edit_project : System.Web.UI.Page
    {
        protected string oldImagePath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int projectId;
                if (int.TryParse(Request.QueryString["Id"], out projectId))
                {
                    LoadProject(projectId);
                }
            }
        }

        private void LoadProject(int projectId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM Projects WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", projectId);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfProjectId.Value = reader["Id"].ToString();
                    txtTitle.Text = reader["Title"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                    txtProjectLink.Text = reader["ProjectLink"].ToString();
                    imgCurrent.ImageUrl = reader["ImageUrl"].ToString();

                    oldImagePath = reader["ImageUrl"].ToString();
                    ViewState["OldImage"] = oldImagePath; // store old path
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int projectId = int.Parse(hfProjectId.Value);
            string title = txtTitle.Text.Trim();
            string description = txtDescription.Text.Trim();
            string projectLink = txtProjectLink.Text.Trim();

            string newImagePath = ViewState["OldImage"].ToString(); // default keep old image

            if (fuImage.HasFile)
            {
                // Save new image
                string folderPath = Server.MapPath("~/Uploads/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuImage.FileName);
                string savePath = Path.Combine(folderPath, fileName);
                fuImage.SaveAs(savePath);

                newImagePath = "~/Uploads/" + fileName;

                // Delete old image if exists
                string oldFile = Server.MapPath(ViewState["OldImage"].ToString());
                if (File.Exists(oldFile))
                {
                    File.Delete(oldFile);
                }
            }

            // Update DB
            string connStr = ConfigurationManager.ConnectionStrings["nabDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "UPDATE Projects SET Title=@Title, Description=@Description, ImageUrl=@ImageUrl, ProjectLink=@ProjectLink WHERE Id=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@ImageUrl", newImagePath);
                cmd.Parameters.AddWithValue("@ProjectLink", projectLink);
                cmd.Parameters.AddWithValue("@Id", projectId);

                cmd.ExecuteNonQuery();
            }

            Response.Redirect("admin_dashboard.aspx");
        }
    }
}
