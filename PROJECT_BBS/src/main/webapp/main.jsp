<%@ page language = "java" contentType = "text/html; charset = UTF-8"
    pageEncoding = "UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 반응형 메타 테그 -->
<meta http-equiv = "Content-Type" content = "text/html; charset = UTF-8">
<meta name = "viewport" content = "width=device-width", initial-scale = "1" >
<!-- 디자인 형식 -->
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/custom.css">
<title>★응애 게시판★</title>
</head>
<body>
<%
	// 유저 세션
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String)session.getAttribute("userID");
    }
%>
	<!-- 부트스트랩 내비게이션 바 추가(우상단 짝대기 세개) -->
    <nav class = "navbar navbar-default">
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
                <li class = "active"><a href = "main.jsp">메인 페이지</a></li>
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
    <!-- 메인페이지 디자인 -->
    <div class = "container">
        <div class = "jumbotron">
            <div class = "container">
                <h1>소개</h1>
                <p>아 몰라 알아서 알아봐</p>
                <p><a class = "btn btn-primary btn-pull" href = "#" role = "button">자세히 알아보기</a></p>
            </div>
        </div>
    </div>
    <!-- 여기부터 페이지에 이미지 삽입(CSS) | 별로 중요하지 않으니 빼도 됨 -->
    <div class = "container">
        <div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
            <ol class = "carousel-indicators">
                <li data-target = "#myCarousel" data-slide-to = "0" class = "active"></li>
                <li data-target = "#myCarousel" data-slide-to = "1"></li>
                <li data-target = "#myCarousel" data-slide-to = "2"></li>
            </ol>
            <!-- 이미지와 이미지 넘기기 버튼 -->
            <div class = "carousel-inner">
                <div class = "item active">
                    <img src = "images/1.png">
                </div>
                <div class = "item">
                    <img src = "images/2.png">
                </div>
                <div class = "item">
                    <img src = "images/3.png">
                </div>
            </div>
            <!-- 왼쪽 / 오른쪽 넘기기 -->
            <a class = "left carousel-control" href = "#myCarousel" data-slide = "prev">
                <span class = "glyphicon glyphicon-chevron-left"></span>
            </a>
            <a class = "right carousel-control" href = "#myCarousel" data-slide = "next">
                <span class = "glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>
    <!-- CSS와 / 디자인 -->
    <script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src = "js/bootstrap.js"></script>
</body>
</html>