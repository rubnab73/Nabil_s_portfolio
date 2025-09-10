<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_register.aspx.cs" Inherits="Nabil_s_portfolio.admin_register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Register</title>
    <link rel="stylesheet" href="Css/style.css" />
    <style>
        .form-container {
            max-width: 420px;
            margin: 120px auto;
            padding: 24px;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            color: var(--text-primary);
            box-shadow: var(--shadow);
        }
        .form-container h2 { color: var(--accent-color); margin-bottom: 12px; }
        input { width: 100%; padding: 12px; margin: 10px 0; border-radius: 8px; border: 1px solid var(--border-color); background: var(--bg-secondary); color: var(--text-primary); }
        input[type="submit"], #btnRegister { background: var(--gradient-primary); color: #fff; font-weight: 600; cursor: pointer; border: none; }
        input[type="submit"]:hover, #btnRegister:hover { filter: brightness(1.1); }
        .error { color: #ff6b6b; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Register New Admin</h2>
            <asp:Label ID="lblError" runat="server" CssClass="error" />
            <asp:TextBox ID="txtUsername" runat="server" Placeholder="Username" />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password" />
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" Placeholder="Confirm Password" />
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <br />
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="login_admin.aspx">Back to Login</asp:HyperLink>
        </div>
    </form>
</body>
</html>

