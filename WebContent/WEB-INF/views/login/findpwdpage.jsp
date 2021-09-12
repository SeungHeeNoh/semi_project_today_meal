<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
#p1 {
position: absolute;
width: 250px;
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
left: 501px;
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
width: 700px;
height: 51px;
left: 501px;
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
width: 47px;
height: 11px;
left: 501px;
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
left: 501px;
top: 425px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
#p6 {
position: absolute;
width: 120px;
height: 11px;
left: 501px;
top: 475px;

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
left: 660px;
top: 365px;


border: 1px solid #000000;
}
.input_area2 {

position: absolute;
width: 357px;
height: 40px;
left: 660px;
top: 420px;

border: 1px solid #000000;
}
#comboBox {
position: absolute;
width: 359px;
height: 42px;
left: 660px;
top: 475px;


border: 1px solid #000000;
}
.input_area4 {

position: absolute;
width: 357px;
height: 40px;
left: 660px;
top: 530px;

border: 1px solid #000000;
}
.input_area5 input[type=submit]{
position: absolute;
width: 96px;
height: 35px;
left: 720px;
top: 605px;

/* brightest green */

background: #A1AD61;
color: #FFFFFF;
border-radius: 7px;
}
</style>
</head>

<body>
       <%@ include file="/WEB-INF/views/common/header.jsp" %>

           <form class="loginArea" action="<%= request.getContextPath() %>/findpwd" method="post" onsubmit="return validate();">
               <p id="p1">비밀번호 찾기</p>
               <p id="p2">등록된 휴대폰 번호와 질문으로 찾기</p>
               <p id="p3">가입 당시 입력한 전화번호와 비밀번호 찾기 질문에 답변을 작성하여 비밀번호를 확인해 주세요.</p>
               <p id="p4">아이디</p>
               <span class="input_area1"><input type="text" name="user_id" id="user_id"></span>
               <p id="p5">연락처</p>
               <span class="input_area2"><input type="text" name="phone" id="phone" placeholder="(-없이)01012345678"></span>
               <p id="p6">비밀번호 찾기 질문</p>
               <select id= "comboBox" name = "Appia">
                  <option value="text" selected>질문을 선택해주세요.</option>
                  <option value="text">졸업한 초등학교는 어디입니까?</option>
                  <option value="text">가장 가고 싶은 여행지는 어디입니까?</option>
                  <option value="text">어릴적 장래희망은 무엇이었습니까?</option>
                  <option value="text">좋아하는 색상은 무슨 색입니까?</option>
                  <option value="text">키워보고 싶은 반려동물은 무엇입니까?</option>
               </select>
               <span class="input_area4"><input type="text" name="answer" id="answer" placeholder="답변"></span>
               
               <span class="input_area5"><input type="submit" value="다음"></span>
              
           </form>
       >    
     

</body>
</html>