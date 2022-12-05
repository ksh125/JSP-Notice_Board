<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 액션</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		
		if(userID != null) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('현재 로그인 되어 있습니다!')");
			sc.println("location.href='main.jsp'");
			sc.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int rs = userDAO.login(user.getUserID(), user.getUserPassword());
		if(rs == 1) {
			session.setAttribute("userID", user.getUserID());
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("location.href='main.jsp'");
			sc.println("</script>");
			
		} else if(rs == 0) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('비밀번호가 맞지 않습니다')");
			sc.println("</script>");
			
		} else if(rs == -1) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('존재하지 않는 아이디입니다')");
			sc.println("</script>");
		
		} else if(rs == -2) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('DB 오류가 생성되었습니다')");
			sc.println("</script>");
		}
	%>
</body>
</html>