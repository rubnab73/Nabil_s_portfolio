<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Nabil_s_portfolio.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nabil_s_portfolio</title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar -->
        <nav class="navbar">
            <div class="navbar-content">
                <a href="#home" class="navbar-brand">Rubayet Nabil</a>
                <ul class="navbar-nav">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#resume">Resume</a></li>
                    <li><a href="#skills">Skills</a></li>
                    <li><a href="#projects">Projects</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="AdminLogin.aspx">Admin</a></li>
                </ul>
            </div>
        </nav>

         <!-- Home Section -->
        <section id="home" class="home-section">
            <div class="container">
                <div class="home-container">
                    <div class="home-content">
                        <span class="subtitle">Welcome, I'm</span>
                        <h1>Rubayet Nabil</h1>
                        <span id="typing-animation" class="typing-animation"></span>
                        <p class="description">A passionate developer specializing in web apps, databases, and modern technologies.</p>
                        <div class="btn-group">
                            <a href="#projects" class="btn btn-primary">See Projects</a>
                            <a href="#projects" class="btn btn-secondary">My Works</a>
                        </div>
                    </div>
                    <div class="home-image">
                        <img src="Uploads/pic.jpeg" alt="Profile Photo" class="profile-image">
                    </div>
                </div>
            </div>
        </section>














        <!-- About Section -->
        <section id="about" class="about-section">
            <div class="container">
                <div class="section-title">
                    <h2>About Me</h2>
                    <p>Learn more about my background, skills, and passion for technology</p>
                </div>

                <div class="about-wrapper-vertical">
                    <!-- Profile Image -->
                    <div class="about-image">
                        <asp:Image ID="imgProfile" runat="server" CssClass="profile-image" />
                    </div>

                    <!-- Info Cards -->
                    <div class="about-content">
                        <h2>
                            <asp:Label ID="lblFullName" runat="server" /></h2>
                        <p>
                            <asp:Label ID="lblDescription" runat="server" /></p>

                        <div class="about-info-cards">
                            <div class="info-card">
                                <span class="label">Name</span>
                                <span class="value">Rubayet Nabil</span>
                            </div>
                            <div class="info-card">
                                <span class="label">Role</span>
                                <span class="value">Software Developer</span>
                            </div>
                            <div class="info-card">
                                <span class="label">Experience</span>
                                <span class="value">3+ years building web apps</span>
                            </div>
                            <div class="info-card">
                                <span class="label">Location</span>
                                <span class="value">Remote</span>
                            </div>
                        </div>

                        <asp:Panel ID="pnlAdminAbout" runat="server" Visible="false" CssClass="admin-controls">
                            <a href="EditAbout.aspx?Id=<%# Eval("Id") %>" class="admin-btn">Edit About</a>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </section>



        <div>
        </div>
    </form>
</body>
</html>
