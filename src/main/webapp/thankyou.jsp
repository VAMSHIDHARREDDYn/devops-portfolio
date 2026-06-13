<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Message Sent — Vamshidhar Reddy</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <style>
        .thankyou-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 2rem;
        }
        .thankyou-box {
            max-width: 500px;
        }
        .thankyou-icon { font-size: 4rem; margin-bottom: 1.5rem; }
        .thankyou-box h1 { font-size: 2.5rem; margin-bottom: 1rem; }
        .thankyou-box p { color: var(--gray); margin-bottom: 2rem; font-size: 1.05rem; }
    </style>
</head>
<body>
<nav id="navbar">
    <div class="nav-logo">VR<span class="dot">.</span></div>
</nav>
<div class="thankyou-page">
    <div class="thankyou-box">
        <div class="thankyou-icon">✅</div>
        <h1>Message <span class="accent">Sent!</span></h1>
        <p>Thanks <%= request.getAttribute("name") %> — I'll get back to you at <strong><%= request.getAttribute("email") %></strong> as soon as possible.</p>
        <a href="index.jsp" class="btn-primary">Back to Portfolio</a>
    </div>
</div>
</body>
</html>
