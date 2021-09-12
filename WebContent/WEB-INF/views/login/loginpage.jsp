<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>

#kakaologin {
position: absolute;
width: 442px;
height: 54px;
left: 513px;
top: 492px;
}

#p1 {
	position: absolute;
width: 110px;
height: 54px;
left: 669px;
top: 212px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 36px;
line-height: 42px;

/* middle green */

color: #406300;
}
#p2 {
position: absolute;
width: 64px;
height: 25px;
left: 530px;
top: 306px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 18px;
line-height: 21px;

/* middle green */

color: #406300;
}
#p3{
position: absolute;
width: 89px;
height: 25px;
left: 521px;
top: 349px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 18px;
line-height: 21px;

/* darkest black */

color: #294401;
}

.input_area1 input {
position: absolute;
width: 225px;
height: 30px;
left: 608px;
top: 316px;

/* checkbox gray border color */

border: 1px solid #C4C4C4;
box-sizing: border-box;
}
.input_area2 input {
position: absolute;
width: 225px;
height: 30px;
left: 608px;
top: 360px;

/* checkbox gray border color */

border: 1px solid #C4C4C4;
box-sizing: border-box;
}

#remember{
position: absolute;
width: 15px;
height: 15px;
left: 520px;
top: 408px;

}
#p4{
position: absolute;
width: 90px;
height: 20px;
left: 551px;
top: 395px;

/* table title */

font-family: Noto Sans KR;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 17px;
display: flex;
align-items: center;
letter-spacing: -0.02em;

color: #000000;
}
.input_area3 input[type=submit] {
	color:white;
position: absolute;
width: 108px;
height: 83px;




/* brightest green */

background: #A1AD61;
border-radius: 7px;
left: 845px;
top: 313px;

}
#findId {
color:white;
position: absolute;
width: 217px;
height: 44px;
/* brightest green */

background: #A1AD61;
border-radius: 10px;
left: 513px;
top: 439px;

}

#findPwd {
	color:white;

position: absolute;
width: 217px;
height: 44px;
left: calc(50% - 217px/2 - 98.5px);
top: calc(50% - 44px/2 + 31px);

/* brightest green */

background: #A1AD61;
border-radius: 10px;
left: 738px;
top: 439px;
}


</style>

</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
   
           <form class="loginArea" action="<%= request.getContextPath() %>/login" method="post" onsubmit="return validate();">
               <p id="p1">로그인</p>
               <p id="p2">아이디</p>
               <span class="input_area1"><input type="text" name="userId" id="userId"></span>
               <p id="p3">비밀번호</p>
               <span class="input_area2"><input type="password" name="userPwd" id="userPwd"></span>
               <input type="checkbox" name="remember" id="remember">
               <p id="p4">아이디 기억하기</p>
               <span class="input_area3"><input type="submit" value="로그인"></span>
               <input id="findId" type="button" value="아이디 찾기" onclick="location.href='<%= request.getContextPath() %>/findId';">
               <input id="findPwd" type="button" value="비밀번호 찾기" onclick="location.href='<%= request.getContextPath() %>/findPwd';">
               <a href="<%= request.getContextPath() %>/kakaologin">
                  <img id="kakaologin" src="<%= request.getContextPath() %>/resources/images/login/kakaologin.png">
               </a>
           </form>
    
</body>
</html>