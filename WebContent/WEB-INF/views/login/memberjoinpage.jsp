<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
#p1 {
position: absolute;
width: 200px;
height: 54px;
left: 685px;
top: 245px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 36px;
line-height: 42px;

/* middle green */

color: #406300;
}
#startkakao {
position: absolute;
width: 417px;
height: 54px;
left: 553px;
top: 447px;
}
#join{
position: absolute;
width: 417px;
height: 54px;
left: 553px;
top: 380px;

/* brightest green */

background: #A1AD61;
border-radius: 10px;
color: #FFFFFF;
}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <form class="memberJoin" action="<%= request.getContextPath() %>/memberjoin" method="post" onsubmit="return validate();">
          <p id="p1">회원가입</p>
          <input id="join" type="button" value="일반 회원가입" onclick="location.href='<%= request.getContextPath() %>/join';">
          <a href="<%= request.getContextPath() %>/kakaojoin">
                  <img id="startkakao" src="<%= request.getContextPath() %>/resources/images/login/startkakao.png">
          </a>
    </form>

</body>
</html>