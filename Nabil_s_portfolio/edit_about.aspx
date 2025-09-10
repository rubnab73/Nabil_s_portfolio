<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="edit_about.aspx.cs" Inherits="Nabil_s_portfolio.edit_about" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit About</title>
    <link rel="stylesheet" href="Css/style.css" />
    <style>
        body {
            background: #111;
            color: #fff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .edit-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 30px 40px;
            background: #1c1c1c;
            border-radius: 15px;
            border: 1px solid #333;
            box-shadow: 0 8px 24px rgba(0,0,0,0.6);
            animation: fadeInUp 0.6s ease-out;
        }
        h2 {
            text-align: center;
            color: #3b82f6;
            margin-bottom: 25px;
            font-size: 26px;
        }
        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #3b82f6;
        }
        input[type="text"], textarea, input[type="file"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #444;
            background: #222;
            color: #fff;
            font-size: 15px;
            transition: border-color 0.2s;
        }
        input:focus, textarea:focus {
            border-color: #3b82f6;
            outline: none;
        }
        .current-image {
            margin: 10px 0 20px;
            border: 2px solid #3b82f6;
            border-radius: 8px;
            max-width: 100%;
            display: block;
        }
        .btn-save {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            background: #3b82f6;
            color: #111;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-save:hover { background: #3b82f6; color: #fff; }
        .error { color: red; text-align: center; margin-bottom: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="edit-container">
            <h2>Edit About</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtFullName" runat="server" Placeholder="Full Name" /><br />
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4" Placeholder="Description" /><br />
            <label>Current Profile Image:</label>
            <asp:Image ID="imgCurrent" runat="server" CssClass="current-image" Width="200" /><br />
            <label>Upload New Image:</label>
            <asp:FileUpload ID="fuProfileImage" runat="server" /><br />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn-save" OnClick="btnSave_Click" />
        </div>
    </form>
</body>
</html>

