<%@ page language = "java" contentType = "text/html;
	charset=UTF-8" pageEncoding = "UTF-8"%>
<%@ page import = "bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name = "bbs" property = "bbsTitle" />
<jsp:setProperty name = "bbs" property = "bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
<title>게시글 작성 기능 페이지</title>
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
            script.println("alert('로그인 하세용')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        
        } else {
	        if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('빠진 부분이 있어용!')");
	            script.println("history.back()");
	            script.println("</script>");
	        
	        } else {
	            BbsDAO bbsDAO = new BbsDAO();
	            int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
                if(result == -1){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('다시 써 주세용')");
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
