<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 로그인</title>
<style>
#kakao {
position: absolute;
width: 339px;
height: 394px;
left: 602px;
top: 167px;
}

</style>
</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
     
     <form class="loginArea" action="<%= request.getContextPath() %>/kakaologin" method="post" onsubmit="return validate();">
     
     <img id="kakao" src="<%= request.getContextPath() %>/resources/images/login/kakao.PNG">
    
     </form>
</body>
</html>