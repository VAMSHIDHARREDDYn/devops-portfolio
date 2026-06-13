<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vamshidhar Reddy — DevOps Engineer</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
</head>
<body>

<!-- NAVIGATION -->
<nav id="navbar">
    <div class="nav-logo">VR<span class="dot">.</span></div>
    <ul class="nav-links">
        <li><a href="#home">Home</a></li>
        <li><a href="#project">The Project</a></li>
        <li><a href="#about">About Me</a></li>
        <li><a href="#skills">Skills</a></li>
        <li><a href="#goals">Goals</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
    <div class="nav-cta">
        <a href="https://www.linkedin.com/in/n-vamshidhar-reddy/" target="_blank">LinkedIn</a>
    </div>
</nav>

<!-- HERO -->
<section id="home" class="hero">
    <div class="hero-bg"></div>
    <div class="hero-content">
        <div class="hero-tag">DevOps Engineer</div>
        <h1>Vamshidhar<br><span class="accent">Reddy</span><br>Neelipally</h1>
        <p class="hero-sub">Building pipelines that ship code from commit to production — automatically, reliably, at scale.</p>
        <div class="hero-badges">
            <span class="badge">AWS CCP</span>
            <span class="badge">Docker</span>
            <span class="badge">Kubernetes</span>
            <span class="badge">Jenkins</span>
            <span class="badge">ArgoCD</span>
            <span class="badge">Terraform</span>
        </div>
        <div class="hero-cta">
            <a href="#project" class="btn-primary">See the Pipeline</a>
            <a href="#contact" class="btn-secondary">Get in Touch</a>
        </div>
    </div>
    <div class="hero-terminal">
        <div class="terminal-bar">
            <span class="t-red"></span>
            <span class="t-yellow"></span>
            <span class="t-green"></span>
            <span class="t-title">pipeline.sh</span>
        </div>
        <div class="terminal-body">
            <div class="t-line"><span class="t-prompt">$</span> git push origin main</div>
            <div class="t-line t-success">✓ Webhook triggered Jenkins</div>
            <div class="t-line"><span class="t-prompt">$</span> mvn clean package</div>
            <div class="t-line t-success">✓ BUILD SUCCESS</div>
            <div class="t-line"><span class="t-prompt">$</span> docker build -t portfolio:v2.1</div>
            <div class="t-line t-success">✓ Image built and pushed</div>
            <div class="t-line"><span class="t-prompt">$</span> argocd app sync tomcat</div>
            <div class="t-line t-success">✓ Synced to EKS — pods running</div>
            <div class="t-line t-blink"><span class="t-prompt">$</span> <span class="cursor">▋</span></div>
        </div>
    </div>
</section>

<!-- PROJECT PIPELINE -->
<section id="project" class="section">
    <div class="container">
        <div class="section-tag">The Project</div>
        <h2>Full-Scale CI/CD Pipeline</h2>
        <p class="section-sub">A production-grade GitOps pipeline — from a single git push to a live application running on Kubernetes, with automated quality gates, security scanning, and zero-downtime deployments.</p>

        <div class="pipeline">
            <div class="pipeline-step" data-step="01">
                <div class="step-icon">⌨️</div>
                <div class="step-content">
                    <h4>Code Push</h4>
                    <p>Developer pushes code to GitHub. Webhook fires instantly.</p>
                    <div class="step-tech">Git • GitHub</div>
                </div>
            </div>
            <div class="pipeline-arrow">→</div>

            <div class="pipeline-step" data-step="02">
                <div class="step-icon">🔧</div>
                <div class="step-content">
                    <h4>Jenkins CI</h4>
                    <p>Pipeline triggered. Code cloned, scanned, built, containerized.</p>
                    <div class="step-tech">Jenkins • Maven • SonarQube • Trivy</div>
                </div>
            </div>
            <div class="pipeline-arrow">→</div>

            <div class="pipeline-step" data-step="03">
                <div class="step-icon">🐳</div>
                <div class="step-content">
                    <h4>Docker Image</h4>
                    <p>WAR packaged into Docker image. Tagged and pushed to DockerHub.</p>
                    <div class="step-tech">Docker • DockerHub</div>
                </div>
            </div>
            <div class="pipeline-arrow">→</div>

            <div class="pipeline-step" data-step="04">
                <div class="step-icon">🔄</div>
                <div class="step-content">
                    <h4>ArgoCD GitOps</h4>
                    <p>Image tag updated in GitHub. ArgoCD detects and syncs automatically.</p>
                    <div class="step-tech">ArgoCD • GitOps</div>
                </div>
            </div>
            <div class="pipeline-arrow">→</div>

            <div class="pipeline-step" data-step="05">
                <div class="step-icon">☸️</div>
                <div class="step-content">
                    <h4>EKS Deployment</h4>
                    <p>Rolling update to Kubernetes. Zero downtime. Live in seconds.</p>
                    <div class="step-tech">Kubernetes • EKS • AWS</div>
                </div>
            </div>
        </div>

        <div class="pipeline-detail">
            <div class="detail-card">
                <h4>🔍 SonarQube</h4>
                <p>Static code analysis — catches bugs, code smells, and security vulnerabilities before the build even starts.</p>
            </div>
            <div class="detail-card">
                <h4>📦 Maven Build</h4>
                <p>Compiles Java source, runs tests, packages the application into a WAR file ready for Tomcat deployment.</p>
            </div>
            <div class="detail-card">
                <h4>🛡️ Trivy Scan</h4>
                <p>Scans the Docker image for known CVEs and misconfigurations before it ever reaches the registry.</p>
            </div>
            <div class="detail-card">
                <h4>♾️ ArgoCD Sync</h4>
                <p>Git is the single source of truth. ArgoCD watches the repo and ensures the cluster always matches what's in GitHub.</p>
            </div>
        </div>
    </div>
</section>

<!-- ABOUT ME -->
<section id="about" class="section section-dark">
    <div class="container">
        <div class="section-tag">About Me</div>
        <div class="about-grid">
            <div class="about-text">
                <h2>CS Graduate.<br>DevOps Engineer.<br>Builder.</h2>
                <p>I'm Vamshidhar Reddy Neelipally — a Computer Science graduate from KL University (CGPA 8.98/10) based in Hyderabad, India. I spent the last 18 months building real DevOps infrastructure from scratch — not tutorials, not screenshots — actual pipelines that build, scan, containerize, and deploy applications automatically.</p>
                <p>I hold the AWS Certified Cloud Practitioner certification and have hands-on experience with the full DevOps toolchain — from writing Dockerfiles to configuring EKS clusters to building GitOps pipelines with ArgoCD.</p>
                <div class="about-stats">
                    <div class="stat">
                        <span class="stat-num">8.98</span>
                        <span class="stat-label">CGPA — KL University</span>
                    </div>
                    <div class="stat">
                        <span class="stat-num">5+</span>
                        <span class="stat-label">Production-style projects</span>
                    </div>
                    <div class="stat">
                        <span class="stat-num">AWS</span>
                        <span class="stat-label">CCP Certified</span>
                    </div>
                </div>
            </div>
            <div class="about-card">
                <div class="about-card-inner">
                    <div class="about-name">Vamshidhar Reddy</div>
                    <div class="about-role">DevOps Engineer</div>
                    <div class="about-location">📍 Hyderabad, India</div>
                    <div class="about-edu">🎓 KL University — B.Tech CS</div>
                    <div class="about-links">
                        <a href="https://github.com/VAMSHIDHARREDDYn" target="_blank" class="about-link">GitHub</a>
                        <a href="https://www.linkedin.com/in/n-vamshidhar-reddy/" target="_blank" class="about-link">LinkedIn</a>
                        <a href="https://hub.docker.com/u/vamshi82" target="_blank" class="about-link">DockerHub</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- SKILLS -->
<section id="skills" class="section">
    <div class="container">
        <div class="section-tag">Skills</div>
        <h2>Technical Stack</h2>
        <div class="skills-grid">
            <div class="skill-group">
                <h4>☁️ Cloud</h4>
                <div class="skill-tags">
                    <span>EC2</span><span>S3</span><span>IAM</span><span>VPC</span>
                    <span>ALB</span><span>Auto Scaling</span><span>CloudFront</span>
                    <span>Route 53</span><span>CloudWatch</span><span>EKS</span>
                </div>
            </div>
            <div class="skill-group">
                <h4>⚙️ DevOps & CI/CD</h4>
                <div class="skill-tags">
                    <span>Jenkins</span><span>ArgoCD</span><span>SonarQube</span>
                    <span>Trivy</span><span>GitHub Actions</span><span>Webhooks</span>
                </div>
            </div>
            <div class="skill-group">
                <h4>🐳 Containers</h4>
                <div class="skill-tags">
                    <span>Docker</span><span>Kubernetes</span><span>EKS</span>
                    <span>DockerHub</span><span>Helm</span>
                </div>
            </div>
            <div class="skill-group">
                <h4>🏗️ Infrastructure</h4>
                <div class="skill-tags">
                    <span>Terraform</span><span>Bash</span><span>Linux</span>
                    <span>Maven</span><span>Git</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- GOALS -->
<section id="goals" class="section section-dark">
    <div class="container">
        <div class="section-tag">Goals</div>
        <h2>Where I'm Headed</h2>
        <div class="goals-grid">
            <div class="goal-card">
                <div class="goal-num">01</div>
                <h4>CKA Certification</h4>
                <p>Certified Kubernetes Administrator — deep cluster management, networking, and security at the administrator level.</p>
            </div>
            <div class="goal-card">
                <div class="goal-num">02</div>
                <h4>AWS DevOps Engineer Pro</h4>
                <p>Moving beyond CCP to the professional level — CI/CD pipelines, monitoring, and infrastructure automation on AWS.</p>
            </div>
            <div class="goal-card">
                <div class="goal-num">03</div>
                <h4>Own a Production Pipeline</h4>
                <p>Join a team where I can own the full deployment pipeline — from code commit to live infrastructure, end to end.</p>
            </div>
            <div class="goal-card">
                <div class="goal-num">04</div>
                <h4>Platform Engineering</h4>
                <p>Build internal developer platforms that make shipping software faster and safer for entire engineering teams.</p>
            </div>
        </div>
    </div>
</section>

<!-- CONTACT -->
<section id="contact" class="section">
    <div class="container">
        <div class="section-tag">Contact</div>
        <h2>Let's Work Together</h2>
        <p class="section-sub">Open to fresher DevOps and Cloud Engineer roles. Let's talk.</p>
        <div class="contact-grid">
            <div class="contact-info">
                <div class="contact-item">
                    <span class="contact-icon">📧</span>
                    <a href="mailto:nvamshidharreddy7262@gmail.com">nvamshidharreddy7262@gmail.com</a>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📱</span>
                    <span>+91-7396294573</span>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">📍</span>
                    <span>Hyderabad, India</span>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">💼</span>
                    <a href="https://www.linkedin.com/in/n-vamshidhar-reddy/" target="_blank">LinkedIn Profile</a>
                </div>
                <div class="contact-item">
                    <span class="contact-icon">💻</span>
                    <a href="https://github.com/VAMSHIDHARREDDYn" target="_blank">GitHub Profile</a>
                </div>
            </div>
            <form class="contact-form" action="ContactServlet" method="post">
                <input type="text" name="name" placeholder="Your Name" required>
                <input type="email" name="email" placeholder="Your Email" required>
                <input type="text" name="company" placeholder="Company (optional)">
                <textarea name="message" placeholder="Your Message" rows="5" required></textarea>
                <button type="submit" class="btn-primary">Send Message</button>
            </form>
        </div>
    </div>
</section>

<!-- FOOTER -->
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-logo">VR<span class="dot">.</span></div>
            <p>Vamshidhar Reddy Neelipally — DevOps Engineer — Hyderabad, India</p>
            <p class="footer-deploy">Deployed via Docker → Jenkins → ArgoCD → EKS</p>
        </div>
    </div>
</footer>

<script src="js/main.js"></script>
</body>
</html>
