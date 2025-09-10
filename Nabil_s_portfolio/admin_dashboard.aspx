<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="Nabil_s_portfolio.admin_dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="Css/style.css" />
    <style>
        /* ===== Dashboard Layout ===== */
        .dashboard {
            max-width: 1920px;
            margin: 10px auto 10px;
            padding: 2rem;
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 1rem;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.6s ease-out;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--bg-secondary);
            border-radius: 0.75rem;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
        }

        .dashboard-header h2 {
            color: var(--accent-color);
            font-size: 2rem;
        }

        .logout {
            background: #ef4444;
            color: #fff;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }
        .logout:hover { filter: brightness(1.15); }

        h3.section-title {
            font-size: 1.6rem;
            color: var(--accent-color);
            margin: 2rem 0 1rem;
            text-align: left;
        }

        .add-new {
            display: inline-block;
            margin-bottom: 1rem;
            background: var(--gradient-primary);
            color: #fff;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            text-decoration: none;
            transition: 0.2s;
        }
        .add-new:hover { filter: brightness(1.1); }

        /* ===== Tables ===== */
        .table-wrapper {
            overflow-x: auto;
            border-radius: 0.75rem;
            box-shadow: var(--shadow);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: var(--bg-secondary);
            border-radius: 0.75rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            background: var(--bg-card);
            color: var(--accent-color);
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        tr:hover { background: rgba(255, 255, 255, 0.03); }

        img {
            border-radius: 0.5rem;
            max-width: 80px;
            height: auto;
            box-shadow: var(--shadow);
        }

        /* ===== Buttons ===== */
        .btn-edit, .btn-view, .btn-delete {
            display: inline-block;
            padding: 0.4rem 0.9rem;
            border-radius: 0.5rem;
            font-size: 0.85rem;
            font-weight: 600;
            text-decoration: none;
            transition: 0.2s;
        }

        .btn-edit, .btn-view {
            background: var(--accent-color);
            color: #111;
        }
        .btn-edit:hover, .btn-view:hover { filter: brightness(1.1); }

        .btn-delete {
            background: #ef4444;
            color: #fff;
        }
        .btn-delete:hover { filter: brightness(1.15); }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            justify-content: flex-end;
        }

        /* ===== Responsive ===== */
        @media (max-width: 768px) {
            .dashboard { padding: 1.5rem; margin: 80px 1rem; }
            .dashboard-header { flex-direction: column; gap: 1rem; text-align: center; }
            h3.section-title { text-align: center; }
            .logout { width: 100%; }
        }

        @media (max-width: 480px) {
            th, td { padding: 0.7rem; font-size: 0.85rem; }
            .btn-edit, .btn-view, .btn-delete { padding: 0.3rem 0.6rem; font-size: 0.8rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard">
            <div class="dashboard-header">
                <h2>Admin Dashboard</h2>
                <asp:Button 
                    ID="btnLogout" 
                    runat="server" 
                    Text="Logout" 
                    CssClass="logout" 
                    OnClientClick="return confirm('Are you sure you want to logout?');" 
                    OnClick="btnLogout_Click" />
            </div>

            <h3 style="text-align:center;">Welcome, 
                <asp:Label ID="lblAdminUser" runat="server" CssClass="admin-user"></asp:Label> 👋
            </h3>

            <!-- About Section -->
            <h3 class="section-title">About Section</h3>
            <div class="table-wrapper">
                <asp:Repeater ID="rptAbout" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Full Name</th>
                                <th>Description</th>
                                <th>Profile Image</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FullName") %></td>
                            <td><%# Eval("Description") %></td>
                            <td><img src='<%# ResolveUrl(Eval("ProfileImage").ToString()) %>' alt="Profile Image" /></td>
                            <td><a href='edit_about.aspx?Id=<%# Eval("Id") %>' class="btn-edit">Edit</a></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <!-- Skills Section -->
            <h3 class="section-title">Skills Section</h3>
            <a href="add_skill.aspx" class="add-new">+ Add New</a>
            <div class="table-wrapper">
                <asp:Repeater ID="rptSkills" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Skill Name</th>
                                <th>Percentage</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("SkillName") %></td>
                            <td><%# Eval("Percentage") %>%</td>
                            <td>
                                <div class="action-buttons">
                                    <a class="btn-edit" href='edit_skill.aspx?Id=<%# Eval("Id") %>'>Edit</a>
                                    <a class="btn-delete" href='delete_skill.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <!-- Projects Section -->
            <h3 class="section-title">Projects Section</h3>
            <a href="add_project.aspx" class="add-new">+ Add New</a>
            <div class="table-wrapper">
                <asp:Repeater ID="rptProjects" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Image</th>
                                <th>Link</th>
                                <th>Actions</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Title") %></td>
                            <td><%# Eval("Description") %></td>
                            <td><img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt="Project Image" /></td>
                            <td><a href='<%# Eval("ProjectLink") %>' target="_blank" class="btn-view">View</a></td>
                            <td>
                                <div class="action-buttons">
                                    <a class="btn-edit" href='edit_project.aspx?Id=<%# Eval("Id") %>'>Edit</a>
                                    <a class="btn-delete" href='delete_project.aspx?Id=<%# Eval("Id") %>' onclick="return confirm('Are you sure to delete?');">Delete</a>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
</body>
</html>

