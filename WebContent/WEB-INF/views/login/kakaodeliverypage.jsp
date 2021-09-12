<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 배송지</title>
<style>
#p1{
position: absolute;
width: 300px;
height: 54px;
left: 645px;
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
width: 80px;
height: 11px;
left: 611px;
top: 290px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
#p3 {
position: absolute;
width: 80px;
height: 11px;
left: 665px;
top: 290px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #FF0000;
}
.input_area1 {
position: absolute;
width: 357px;
height: 40px;
left: 611px;
top: 320px;


border: 1px solid #000000;
}
#postcodify_search_button{
position: absolute;
width: 81px;
height: 40px;
left: 980px;
top: 320px;

/* darkest black */

background: #294401;
border-radius: 7px;
color: #FFFFFF;
}
#p4 {
position: absolute;
width: 80px;
height: 11px;
left: 611px;
top: 370px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
.input_area2 {
position: absolute;
width: 357px;
height: 40px;
left: 611px;
top: 400px;


border: 1px solid #000000;
}
#p5 {
position: absolute;
width: 80px;
height: 11px;
left: 675px;
top: 370px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #FF0000;
}
#p6 {
position: absolute;
width: 80px;
height: 11px;
left: 611px;
top: 450px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #000000;
}
#p7 {
position: absolute;
width: 80px;
height: 11px;
left: 640px;
top: 450px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 12px;
line-height: 14px;

color: #FF0000;
}
.input_area3 {
position: absolute;
width: 357px;
height: 40px;
left: 611px;
top: 480px;


border: 1px solid #000000;
}
#joinBtn{
position: absolute;
width: 103px;
height: 40px;
left: 748px;
top: 560px;

/* brightest green */

background: #A1AD61;
border-radius: 7px;
color: #FFFFFF;
}
</style>
</head>
<body>
       <%@ include file="/WEB-INF/views/common/header.jsp" %>
          <form class="kakaoDeliveryArea" action="<%= request.getContextPath() %>/delivery" method="post" onsubmit="return validate();">
          <p id="p1">기본 배송지 입력</p>
          <p id="p2">우편번호</p>
          <p id="p3">*</p>
          <span class="input_area1">
                 <input type="text" name="address" class="postcodify_postcode5" readonly>
          </span>
          <button id="postcodify_search_button" type="button">검색</button>
               
          <p id="p4">도로명주소</p>
          <p id="p5">*</p>
          <span class="input_area2"><input type="text" name="address" class="postcodify_address" readonly></span>
               
          <p id="p6">주소</p>
          <p id="p7">*</p>
          <span class="input_area3"><input type="text" name="address" class="postcodify_details"></span>
               
          <div class="btnArea">
			<button id="joinBtn" disabled>가입하기</button>
		  </div>
           
          </form>

</body>
</html>