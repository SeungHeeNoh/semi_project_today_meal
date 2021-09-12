<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
<link href="<%= request.getContextPath() %>/resources/css/login/joinpage.css" rel="stylesheet">
</head>
<body>
     <%@ include file="/WEB-INF/views/common/header.jsp" %>
            <form class="joinArea" action="<%= request.getContextPath() %>/join" method="post" onsubmit="return validate();">
     
                <p id="p1">일반 회원가입</p>
				<p id="p2">아이디</p>
				<p id="p3">*</p>
				<span class="input_area1">
				    <input type="text" maxlength="13" name="userId" placeholder="영문 소문자와 숫자를 포함 6~12자리" required>
				</span>
				<button id="idCheck" type="button">중복확인</button>
				
				<p id="p4">비밀번호<p>
				<p id="p5">*</p>
				<span class="input_area2">
				    <input type="password" maxlength="15" name="userPwd" placeholder="영문대소문자,숫자,특수문자 포함 8자리 이상 " required>
				</span>
				
				<p id="p6">비밀번호 확인<p>
				<p id="p7">*</p>
				<span class="input_area3"><input type="password" maxlength="15" name="userPwd2" required></span>
				<label id="pwdResult"></label>
				
				<p id="p8">이름</p>
				<p id="p9">*</p>
				<span class="input_area4"><input type="text" maxlength="5" name="userName" required></span>
				
				<p id="p10">연락처</p>
				<p id="p11">*</p>
				<span class="input_area5"><input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"></span>
										
				<p id="p12">이메일</p>
				<p id="p13">*</p>
				<span class="input_area6"><input type="email" name="email"></span>
				              
                <p id="p14">우편번호</p>
                <p id="p15">*</p>
                <span class="input_area7">
                   <input type="text" name="address" class="postcodify_postcode5" readonly>
                </span>
                <button id="postcodify_search_button" type="button">검색</button>
               
                <p id="p16">도로명주소</p>
                <p id="p17">*</p>
                <span class="input_area8"><input type="text" name="address" class="postcodify_address" readonly></span>
               
                <p id="p18">주소</p>
                <p id="p19">*</p>
                <span class="input_area9"><input type="text" name="address" class="postcodify_details"></span>
               
                <div class="btnArea">
					<button id="joinBtn" disabled>가입하기</button>
			    </div>
           
          </form>
</body>
</html>