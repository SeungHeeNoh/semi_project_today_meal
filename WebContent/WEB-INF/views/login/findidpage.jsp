<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
#p1 {
position: absolute;
width: 200px;
height: 54px;
left: 662px;
top: 190px;

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
width: 352px;
height: 51px;
left: 541px;
top: 290px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 18px;
line-height: 21px;

color: #000000;

}

#p3 {
position: absolute;
width: 352px;
height: 51px;
left: 541px;
top: 320px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
#p4 {
position: absolute;
width: 25px;
height: 11px;
left: 541px;
top: 370px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
#p5 {
position: absolute;
width: 47px;
height: 11px;
left: 541px;
top: 425px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
.input_area1 {
position: absolute;
width: 357px;
height: 40px;
left: 631px;
top: 365px;


border: 1px solid #000000;
}
.input_area2 {

position: absolute;
width: 357px;
height: 40px;
left: 631px;
top: 420px;

border: 1px solid #000000;
}
.input_area3 input[type=submit]{
position: absolute;
width: 96px;
height: 35px;
left: 730px;
top: 495px;

/* brightest green */

background: #A1AD61;
color: #FFFFFF;
border-radius: 7px;
}
</style>
</head>
<body>
       <%@ include file="/WEB-INF/views/common/header.jsp" %>
           <form class="findIdArea" action="<%= request.getContextPath() %>/findid" method="post" onsubmit="return validate();">
               <p id="p1">아이디 찾기</p>
               <p id="p2">등록된 휴대폰 번호 찾기</p>
               <p id="p3">가입 당시 입력한 전화번호를 통해 아이디를 확인해 주세요.</p>
               <p id="p4">이름</p>
               <span class="input_area1"><input type="text" name="user_name" id="user_name"></span>
               <p id="p5">연락처</p>
               <span class="input_area2"><input type="text" name="phone" id="phone" placeholder="(-없이)01012345678"></span>
               <span class="input_area4"><input type="submit" value="다음"></span>
               
              
           </form>
</body>
</html>