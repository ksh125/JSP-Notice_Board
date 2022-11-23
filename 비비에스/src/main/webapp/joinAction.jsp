<%@ page language = "java" contentType = "text/html; charset = UTF-8"
	pageEncoding = "UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 액션</title>
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
		
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null) {
			PrintWriter sc = response.getWriter();
			sc.println("<script>");
			sc.println("alert('값이 전부 주어지지 않았습니다')");
			sc.println("history.back()");
			sc.println("</script>");
		
		} else {
			UserDAO userDAO = new UserDAO();
			int rs = userDAO.join(user);
			if(rs == -1) {
				PrintWriter sc = response.getWriter();
				sc.println("<script>");
				sc.println("alert('해당 아이디는 중복되었습니다')");
				sc.println("history.back()");
				sc.println("</script>");
			
			} else {
				session.setAttribute("userID", user.getUserID());
				PrintWriter sc = response.getWriter();
				sc.println("<script>");
				sc.println("location.href='main.jsp'");
				sc.println("</script>");
			}
		}
	%>
</body>
</html>