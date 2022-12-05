<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 삭제 액션</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID") != null ) {
            userID = (String) session.getAttribute("userID");
        }
        if(userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 하세요')");
            script.println("location.href='login.jsp'");
            script.println("</script>");
        }
        int bbsID = 0;
        if (request.getParameter("bbsID") != null) {
            bbsID = Integer.parseInt(request.getParameter("bbsID"));
        }
        if (bbsID == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당 게시글은 존재하지 않습니다')");
            script.println("location.href='bbs.jsp'");
            script.println("</script>");
        }
        Bbs bbs = new BbsDAO().getBbs(bbsID);
        if (!userID.equals(bbs.getUserID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('해당 게시글에 대한 권한이 존재하지 않습니다')");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        } else {
        	if(request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
	            || request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('게시글의 제목 또는 내용이 비어있습니다')");
	            script.println("history.back()");
	            script.println("</script>");
	        } else {
	            BbsDAO bbsDAO = new BbsDAO();
	            int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
	            if(result == -1) {
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('게시글 수정에 실패했습니다.')");
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