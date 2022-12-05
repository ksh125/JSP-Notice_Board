<%@ page language = "java" contentType = "text/html; charset=UTF-8"
    pageEncoding = "UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@page import="bbs.Bbs"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class = "bbs.Bbs" scope = "page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta charset = "UTF-8">
<title>게시글 작성 액션</title>
</head>
<body>
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alter('로그인 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
			
		} else {
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alter('제목 또는 내용을 작성해 주세요')");
				script.println("history.back()");
				script.println("</script>");
				
			} else {
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(),
					userID, bbs.getBbsContent());
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alter('글쓰기에 실패하셨습니다')");
					script.println("history.back()");
					script.println("</script>");
					
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>