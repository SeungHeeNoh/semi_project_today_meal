<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오 회원가입</title>
<style>
#kakaojoin {
position: absolute;
width: 392px;
height: 487px;
left: 580px;
top: 167px;
}

</style>
</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
     
     <form class="kakaojoinArea" action="<%= request.getContextPath() %>/kakaojoin" method="post" onsubmit="return validate();">
           <a href="<%= request.getContextPath() %>/delivery">
               <img id="kakaojoin" src="<%= request.getContextPath() %>/resources/images/login/kakaojoin.png">
           </a>
     </form>

</body>
</html>