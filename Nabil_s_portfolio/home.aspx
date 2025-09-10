<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Nabil_s_portfolio.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <title>Nabil's Portfolio</title>
    <link rel="stylesheet" href="Css/style.css" />
    <style>
        .typing-animation {
            display: block;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--accent-color);
            margin: 1rem 0;
            min-height: 2rem;
        }
        
        .skill-item {
            margin-bottom: 2rem;
        }
        
        .skill-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }
        
        .skill-name {
            font-weight: 600;
            color: var(--text-primary);
        }
        
        .skill-percentage {
            color: var(--accent-color);
            font-weight: 600;
        }
        
        .skill-bar {
            width: 100%;
            height: 8px;
            background: var(--bg-secondary);
            border-radius: 4px;
            overflow: hidden;
        }
        
        .skill-progress {
            height: 100%;
            background: var(--gradient-primary);
            border-radius: 4px;
            transition: width 1s ease-in-out;
        }
    </style>
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
                    <li><a href="login_admin.aspx">Admin</a></li>
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


<!-- Typing Animation Script -->
<span id="typing-animation"></span>

<script>
    const typingAnimationElement = document.getElementById('typing-animation');
    const typingTexts = ['Web Developer', 'Student', 'Programmer', 'App Developer'];
    let textIndex = 0;
    let charIndex = 0;
    let typingForward = true; // true: typing, false: deleting

    function type() {
        const currentText = typingTexts[textIndex];

        if (typingForward) {
            typingAnimationElement.textContent += currentText[charIndex];
            charIndex++;
            if (charIndex === currentText.length) {
                typingForward = false;
                setTimeout(type, 1000); // pause at full text
                return;
            }
        } else {
            typingAnimationElement.textContent = currentText.slice(0, charIndex - 1);
            charIndex--;
            if (charIndex === 0) {
                typingForward = true;
                textIndex = (textIndex + 1) % typingTexts.length;
            }
        }

        setTimeout(type, 200); // typing/deleting speed
    }

    type();
</script>

<!-- Enhanced JavaScript for better UX -->
<script>
    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Active navigation highlighting
    window.addEventListener('scroll', function () {
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.navbar-nav a[href^="#"]');

        let current = '';
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.clientHeight;
            if (scrollY >= (sectionTop - 200)) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + current) {
                link.classList.add('active');
            }
        });
    });

    // Animate skill bars on scroll
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const skillBars = entry.target.querySelectorAll('.skill-progress');
                skillBars.forEach(bar => {
                    const targetWidth = bar.getAttribute('data-percentage');
                    bar.style.width = '0%';
                    setTimeout(() => {
                        bar.style.width = targetWidth + '%';
                    }, 100);
                });
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe skills section
    const skillsSection = document.getElementById('skills');
    if (skillsSection) {
        observer.observe(skillsSection);
    }

    // Add loading animation to buttons
    document.querySelectorAll('.btn').forEach(btn => {
        btn.addEventListener('click', function (e) {
            if (this.href && this.href.startsWith('mailto:')) {
                return; // Don't add loading to mailto links
            }

            this.classList.add('loading');
            setTimeout(() => {
                this.classList.remove('loading');
            }, 1000);
        });
    });

    // Add fade-in animation to elements on scroll
    const fadeElements = document.querySelectorAll('.project-card, .skill-item, .contact-card, .resume-item');
    const fadeObserver = new IntersectionObserver(function (entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in-up');
                fadeObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    fadeElements.forEach(el => {
        fadeObserver.observe(el);
    });
</script>


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
                <h2><asp:Label ID="lblFullName" runat="server" /></h2>
                <p><asp:Label ID="lblDescription" runat="server" /></p>

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
                    <a href="edit_about.aspx?Id=<%# Eval("Id") %>" class="admin-btn">Edit About</a>
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
                        <span class="date">2021-Present</span>
                        <h3>BSc in Computer Science and Engineering</h3>
                        <span class="position">University</span>
                        <p>Khulna University of Engineering & Technology</p>
                    </div>

                    <div class="resume-item">
                        <span class="date">2019-2021</span>
                        <h3>Higher Secondary Certificate</h3>
                        <span class="position">Science Group</span>
                        <p>Notre Dame College, Dhaka</p>
                        <p>Grade: GPA 5</p>
                    </div>

                    <div class="resume-item">
                        <span class="date">2019</span>
                        <h3>Secondary School Certificate</h3>
                        <span class="position">School</span>
                        <p>Motijheel Govt. Boys High School</p>
                        <p>Grade: GPA 5</p>
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
                    <a href="add_skill.aspx" class="admin-btn">+ Add New Skill</a>
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
                                    <div class="skill-progress" style='width:<%# Eval("Percentage") %>%;'></div>
                                </div>
                                <asp:Panel ID="pnlAdminSkillButtons" runat="server" Visible="false" class="admin-controls">
                                    <a href='edit_skill.aspx?Id=<%# Eval("Id") %>' class="admin-btn">Edit</a>
                                    <a href='delete_skill.aspx?Id=<%# Eval("Id") %>' class="admin-btn" onclick="return confirm('Are you sure?');">Delete</a>
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
                    <a href="add_project.aspx" class="admin-btn">+ Add New Project</a>
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
                                        <a href='edit_project.aspx?Id=<%# Eval("Id") %>' class="admin-btn">Edit</a>
                                        <a href='delete_project.aspx?Id=<%# Eval("Id") %>' class="admin-btn" onclick="return confirm('Are you sure?');">Delete</a>
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
            <p>&copy; <script>document.write(new Date().getFullYear());</script> All rights reserved </p>
        </footer>


    </form>
</body>
</html>