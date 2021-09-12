<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today_meal</title>
<style>
    #BEST{
        position: absolute;
width: 1098px;
height: 503px;
left: 210px;
top: 183px;
    }

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
     <div id="imageArea">
     <img id="BEST" src="<%= request.getContextPath() %>/resources/images/mainpage/BEST1.png">
     </div>
     
</body>
</html>