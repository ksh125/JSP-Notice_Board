<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<meta name = "viewport" content = "width=device-width, initial-scale = 1" >
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>GaeSiPan</title>
</head>
<body>
	<%
	    String userID = null;
	    if (session.getAttribute("userID") != null) {
	        userID = (String)session.getAttribute("userID");
	    }
	%>
    <nav class = "navbar navbar-inverse">
        <div class = "navbar-header">
            <button type = "button" class = "navbar-toggle collapsed"
                data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
                aria-expand = "false">
                <span class = "icon-bar"></span>
                <span class = "icon-bar"></span>
                <span class = "icon-bar"></span>
            </button>
            <a class = "navbar-brand" href = "main.jsp">GaeSiPan</a>
        </div>
        <div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
            <ul class = "nav navbar-nav">
                <li class = "active"><a href = "main.jsp">메인</a></li>
                <li><a href = "bbs.jsp">게시판</a></li>
            </ul>
            <% if(userID == null) { %>
	            <ul class = "nav navbar-nav navbar-right">
	                <li class = "dropdown">
	                <a href = "#" class = "dropdown-toggle"
	                    data-toggle = "dropdown" role = "button" aria-haspopup = "true"
	                    aria-expanded = "false">로그인<span class = "caret"></span></a>
	                    <ul class = "dropdown-menu">
	                        <li><a href = "login.jsp">로그인</a></li>
	                        <li><a href = "join.jsp">회원가입</a></li>                    
	                    </ul>
	                </li>
	            </ul>
            <% } else { %>
	            <ul class = "nav navbar-nav navbar-right">
	                <li class = "dropdown">
	                <a href = "#" class = "dropdown-toggle"
	                    data-toggle = "dropdown" role = "button" aria-haspopup = "true"
	                    aria-expanded = "false">회원관리<span class = "caret"></span></a>
	                    <ul class = "dropdown-menu">
	                        <li><a href = "logoutAction.jsp">로그아웃</a></li>
	                    </ul>
	                </li>
	            </ul>
            <% } %>
        </div>
    </nav>
    <div class = "container">
        <div class = "jumbotron">
            <div class = "container">
                <h1>GaeSiPan</h1>
                <p>게시판입니다. ... 다른 설명이 필요한가요?</p>
                <p><a class = "btn btn-danger btn-pull"
                	href = "https://d2u3dcdbebyaiu.cloudfront.net/uploads/atch_img/365/98b6232dd20c0fb876dee64a6ea77f20_res.jpeg"
                	role = "button">귀여운 미어켓 보고 가시져</a></p>
            </div>
        </div>
    </div>
    <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src = "js/bootstrap.js"></script>
</body>
</html>