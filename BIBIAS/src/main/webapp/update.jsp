<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        <div class = "collapse navbar-collapse"
        	id = "bs-example-navbar-collapse-1">
            <ul class = "nav navbar-nav">
                <li class = "active"><a href = "main.jsp">����</a></li>
                <li><a href = "bbs.jsp">�Խ���</a></li>
            </ul>
            <ul class = "nav navbar-nav navbar-right">
                <li class = "dropdown">
                <a href = "#" class = "dropdown-toggle"
                    data-toggle = "dropdown" role = "button" aria-haspopup = "true"
                    aria-expanded = "false">ȸ������<span class = "caret"></span></a>
                    <ul class = "dropdown-menu">
                        <li><a href = "logoutAction.jsp">�α׾ƿ�</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
	<!-- �Խñ� ���� ĭ - CSS -->
    <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src = "js/bootstrap.js"></script>