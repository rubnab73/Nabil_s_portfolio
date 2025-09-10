<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_project.aspx.cs" Inherits="Nabil_s_portfolio.edit_project" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Project</title>
    <link rel="stylesheet" href="Css/style.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #111;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .edit-container {
            max-width: 600px;
            margin: 50px auto;
            background: #1c1c1c;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            border: 1px solid #333;
        }

        .edit-container h2 {
            text-align: center;
            color: #3b82f6;
            margin-bottom: 30px;
            font-size: 28px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #3b82f6;
        }

        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #555;
            border-radius: 8px;
            background-color: #222;
            color: #fff;
            box-sizing: border-box;
            font-size: 15px;
        }

        textarea {
            resize: vertical;
        }

        .current-image {
            display: block;
            margin-bottom: 20px;
            border: 2px solid #3b82f6;
            border-radius: 8px;
            max-width: 100%;
        }

        .btn-update {
            background: #3b82f6;
            color: #111;
            font-weight: bold;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: 0.3s ease;
        }

        .btn-update:hover {
            background: #e6ac2c;
            color: #fff;
        }

        /* Optional: add hover effect on inputs */
        input[type="text"]:focus, textarea:focus, input[type="file"]:focus {
            border-color: #ffbd39;
            outline: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <h2>Edit Project</h2>

            <asp:HiddenField ID="hfProjectId" runat="server" />

            <label>Title:</label>
            <asp:TextBox ID="txtTitle" runat="server" CssClass="input-field" /><br />

            <label>Description:</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" CssClass="input-field" /><br />

            <label>Project Link:</label>
            <asp:TextBox ID="txtProjectLink" runat="server" CssClass="input-field" /><br />

            <label>Current Image:</label>
            <asp:Image ID="imgCurrent" runat="server" CssClass="current-image" Width="250" /><br />

            <label>Upload New Image:</label>
            <asp:FileUpload ID="fuImage" runat="server" /><br />

            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn-update" OnClick="btnUpdate_Click" />
        </div>
    </form>
</body>
</html>





