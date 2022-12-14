<%@ page language = "java" contentType = "text/html; charset = UTF-8"
    pageEncoding = "UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.Bbs"%>
<%@page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 메타 테그 -->
<meta charset = "UTF-8">
<meta name = "viewport" content = "width=device-width", initial-scale = "1" >
<!-- 디자인 형식 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>게시판 글 조회</title>
</head>
<body>
<%
	// 유저 세션
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String)session.getAttribute("userID");
    }
    int bbsID = 0;
    if(request.getParameter("bbsID") != null) {
    	bbsID = Integer.parseInt(request.getParameter("bbsID"));
    }
    if(bbsID == 0) {
    	PrintWriter script = response.getWriter();
    	script.println("<script>");
    	script.println("alert('임시 문장')");
    	script.println("location.href='bbs.jsp'");
    	script.println("</script>");
    }
    
    Bbs bbs = new BbsDAO().getBbs(bbsID);
%>
	<!-- 부트스트랩 내비게이션 바 추가(우상단 짝대기 세개) -->
    <nav class = "navbar navbar-inverse">
        <div class = "navbar-header">
            <button type = "button" class = "navbar-toggle collapsed"
                data-toggle = "collapse" data-target = "#bs-example-navbar-collapse-1"
                aria-expand = "false">
                <!-- 작대기 세개  -->
                <span class = "icon-bar"></span>
                <span class = "icon-bar"></span>
                <span class = "icon-bar"></span>
            </button>
            <a class = "navbar-brand" href = "main.jsp">응애 게시판</a>
        </div>
        <div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
            <ul class = "nav navbar-nav">
                <li><a href = "main.jsp">메인</a></li>
                <li><a href = "bbs.jsp">게시판</a></li>
            </ul>
            <%
            	// 현제 로그인이 되어있지 않다면
                if(userID == null) {
            %>
            <!-- 로그인 / 회원가입 버튼, 해당하는 창으로 이동 -->
            <ul class = "nav navbar-nav navbar-right">
                <li class = "dropdown">
                <a href = "#" class = "dropdown-toggle"
                    data-toggle = "dropdown" role = "button" aria-haspopup = "true"
                    aria-expanded = "false">접속하기<span class = "caret"></span></a>
                    <ul class = "dropdown-menu">
                        <li><a href = "login.jsp">로그인</a></li>
                        <li><a href = "join.jsp">회원가입</a></li>                    
                    </ul>
                </li>
            </ul>
            <%
            	// 현재 로그인이 되어 있다면
                } else {
            %>
            <ul class = "nav navbar-nav navbar-right">
                <li class = "dropdown">
                <a href = "#" class = "dropdown-toggle"
                    data-toggle = "dropdown" role = "button" aria-haspopup = "true"
                    aria-expanded = "false">접속하기<span class = "caret"></span></a>
                    <ul class = "dropdown-menu">
                        <li><a href = "logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>
    <div class = "container">
    	<div class = "row">
    		<table class = "table table-striped" style = "text-align:center; border:1px solid #dddddd">
    			<thead>
    				<tr>
    					<th colspan = "3" style = "background-color: #eeeeee; text-align:center;">게시판</th>
    				</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td style = "width:20%">제목</td>
    					<td colspan = "2"><%= bbs.getBbsTitle()
    						.replaceAll(" ", "&nbsp;")
    						.replaceAll("<", "&lt;").replaceAll(">", "&gt;")
    						.replaceAll("\n", "<br>") %></td>
    				</tr>
    				<tr>
    					<td>작성자</td>
    					<td colspan = "2"><%= bbs.getUserID() %></td>
    				</tr>
    				<tr>
	    				<td>작성 시간</td>
	    				<td colspan = "2"><%= bbs.getBbsDate().substring(0, 11)
	    					+ bbs.getBbsDate().substring(11, 13)
	    					+ "시" + bbs.getBbsDate().substring(14, 16)
	    					+ "분" %></td>
	    			</tr>
	    			<tr>
	    				<td>내용</td>
	    				<td colspan = "2" style = "min-height:200px; text-align:left;">
		    				<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
		    				.replaceAll("<", "&lt").replaceAll(">", "&gt")
		    				.replaceAll("\n", "<br>") %></td>
	    			</tr>
    			</tbody>
    		</table>
    		<a href = "bbs.jsp" class = "btn btn-success">게시글 목록</a>
    		<%
    			if(userID != null && userID.equals(bbs.getUserID())) {
    		%>
    				<a href = "update.jsp?bbsID=<%=bbsID%>" class = "btn btn-warning">
    				수정하기
    				</a>
    				<a onclick = "return confirm('ㄹㅇ로 삭제할거에여?')"
    					href = "deleteAction.jsp?bbsID=<%=bbsID%>"
    					class = "btn btn-danger">삭제</a>
    		<%
    			}
    		%>
    	</div>
    </div>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>