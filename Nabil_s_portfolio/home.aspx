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
                            <asp:Label ID="lblDescription" runat="server" />
                        </p>

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

        <!-- Resume Section -->
        <section id="resume" class="resume-section">
            <div class="container">
                <div class="section-title">
                    <h2>Resume</h2>
                </div>

                <div class="resume-grid">
                    <div class="resume-item">
                        <span class="date">2024-Present</span>
                        <h3>Web Development Lab</h3>
                        <span class="position">CSE Course</span>
                        <ul>
                            <li>Developed dynamic web applications using HTML, CSS, JavaScript, and ASP.NET.</li>
                            <li>Integrated SQL Server databases with server-side logic.</li>
                            <li>Implemented session management and user authentication systems.</li>
                        </ul>
                    </div>

                    <div class="resume-item">
                        <span class="date">2024-Present</span>
                        <h3>Database Management</h3>
                        <span class="position">CSE Course</span>
                        <ul>
                            <li>Designed and implemented SQL Server database schemas.</li>
                            <li>Created stored procedures and database optimization techniques.</li>
                            <li>Developed data-driven web applications with CRUD operations.</li>
                        </ul>
                    </div>

                    <div class="resume-item">
                        <span class="date">2022-Present</span>
                        <h3>B.Sc. in Computer Science & Engineering</h3>
                        <span class="position">University</span>
                        <p>Focus: Web Development, Database Systems, Software Engineering</p>
                    </div>

                    <div class="resume-item">
                        <span class="date">2020-2022</span>
                        <h3>Higher Secondary Certificate</h3>
                        <span class="position">Science Group</span>
                        <p>Focus: Mathematics, Physics, Chemistry, Computer Science</p>
                    </div>
                </div>

                <div class="text-center" style="margin-top: 3rem;">
                    <a href="#contact" class="btn btn-primary">Request Resume</a>
                </div>
            </div>
        </section>

        <!-- Skills Section -->
        <section id="skills" class="skills-section">
            <div class="container">
                <div class="section-title">
                    <h2>Skills</h2>
                    <p>Technical skills and technologies I work with</p>
                </div>
                <asp:Panel ID="pnlAdminSkills" runat="server" Visible="false" class="admin-controls">
                    <a href="AddSkill.aspx" class="admin-btn">+ Add New Skill</a>
                </asp:Panel>
                <div class="skills-grid">
                    <asp:Repeater ID="rptSkills" runat="server">
                        <ItemTemplate>
                            <div class="skill-item">
                                <div class="skill-header">
                                    <span class="skill-name"><%# Eval("SkillName") %></span>
                                    <span class="skill-percentage"><%# Eval("Percentage") %>%</span>
                                </div>
                                <div class="skill-bar">
                                    <div class="skill-progress" style='width: <%# Eval("Percentage") %>%;'></div>
                                </div>
                                <asp:Panel ID="pnlAdminSkillButtons" runat="server" Visible="false" class="admin-controls">
                                    <a href='EditSkill.aspx?Id=<%# Eval("Id") %>' class="admin-btn">Edit</a>
                                    <a href='DeleteSkill.aspx?Id=<%# Eval("Id") %>' class="admin-btn" onclick="return confirm('Are you sure?');">Delete</a>
                                </asp:Panel>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Projects Section -->
        <section id="projects" class="projects-section">
            <div class="container">
                <div class="section-title">
                    <h2>Projects</h2>
                    <p>Some of my recent work and projects</p>
                </div>
                <asp:Panel ID="pnlAdminProjectsAdd" runat="server" Visible="false" class="admin-controls">
                    <a href="AddProject.aspx" class="admin-btn">+ Add New Project</a>
                </asp:Panel>
                <div class="projects-grid">
                    <asp:Repeater ID="rptProjects" runat="server">
                        <ItemTemplate>
                            <div class="project-card">
                                <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' alt='<%# Eval("Title") %>' class="project-image" />
                                <div class="project-content">
                                    <h3 class="project-title"><%# Eval("Title") %></h3>
                                    <p class="project-description"><%# Eval("Description") %></p>
                                    <a href='<%# Eval("ProjectLink") %>' target="_blank" class="project-link">View Project</a>
                                    <asp:Panel ID="pnlAdminProjectButtons" runat="server" Visible="false" class="admin-controls">
                                        <a href='EditProject.aspx?Id=<%# Eval("Id") %>' class="admin-btn">Edit</a>
                                        <a href='DeleteProject.aspx?Id=<%# Eval("Id") %>' class="admin-btn" onclick="return confirm('Are you sure?');">Delete</a>
                                    </asp:Panel>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contact" class="contact-section">
            <div class="container">
                <div class="section-title">
                    <h2>Contact Me</h2>
                    <p>Get in touch with me for any opportunities or collaborations</p>
                </div>
                <div class="contact-grid">
                    <div class="contact-card">
                        <div class="contact-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3 class="contact-title">Location</h3>
                        <p class="contact-info">Remote</p>
                    </div>
                    <div class="contact-card">
                        <div class="contact-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <h3 class="contact-title">Phone</h3>
                        <p class="contact-info"><a href="tel://0101010101">+0 123 456 789</a></p>
                    </div>
                    <div class="contact-card">
                        <div class="contact-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h3 class="contact-title">Email</h3>
                        <p class="contact-info"><a href="mailto:hello@example.com">nabil@hello.com</a></p>
                    </div>
                    <div class="contact-card">
                        <div class="contact-icon">
                            <i class="fas fa-file-alt"></i>
                        </div>
                        <h3 class="contact-title">Resume</h3>
                        <p class="contact-info"><a href="#contact">Contact for Resume</a></p>
                    </div>
                </div>
                <div class="text-center" style="margin-top: 3rem;">
                    <a href="mailto:hello@example.com" class="btn btn-primary">Email Me</a>
                </div>
                <div class="social-links">
                    <a href="#" target="_blank" class="social-link">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="#" target="_blank" class="social-link">
                        <i class="fab fa-github"></i>
                    </a>
                    <a href="#" target="_blank" class="social-link">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="mailto:hello@example.com" class="social-link">
                        <i class="fas fa-envelope"></i>
                    </a>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer-section">
            <p>&copy;
                <script>document.write(new Date().getFullYear());</script>
                All rights reserved </p>
        </footer>

        <div>
        </div>
    </form>
</body>
</html>
