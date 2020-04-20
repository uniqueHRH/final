<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link href="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/shortlogo.png?raw=true" rel="shortcut icon" type="image/x-icon">
<style type="text/css">
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:200px;
		font-family: 'Jua';
	}
	form {
		width:800px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
		align:center;
		text-align:center;
		padding:0px;
	}
    #infocomm{
    	font-size: 20px;
    }
	#table tr, #table td {
		text-align: center;
	}
	#table tr td{
		font-size: 15px;
	}
	#resetbtn , #changebtn, #submitbtn {
		display:inline;
		margin-top: 30px;
		width: 200px;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<div id="allContain">
	<div class="page-header" align="center">
		<h1>내 정보관리</h1>
		<p id="infocomm">내정보를 최신정보로 관리해주세요</p>
	</div>

	<form action="../mypage/changemyinfo" name="cac" method="post">
		<div id="table">
			<table class="table table-hover">
				<tr>
					<td width="30%">아이디</td>
					<td width="40%">여행사용설명서 아이디</td>
					<td width="50%">${sessionScope.check.client_id }</td>
				</tr>
				<tr>
					<td>닉네임/연락처</td>
					<td>닉네임<br/></br>연락처</td>
					<td><input type="text" id="client_nick1" name="client_nick1" placeholder="변경할 닉네임을 작성하세요"/><br/><br/>
					<input type="text" id="client_phone" name="client_phone" placeholder="변경할 연락처를 작성하세요"/></td>
				</tr>
				<tr>
					<td>이름/생년월일</td>
					<td>이름<br/><br/>생년월일</td>
					<td>${sessionScope.check.client_name }<br/><br/>${sessionScope.check.client_birth }</td>
				</tr>
				<tr>
					<td>알림설정</td>
					<td>소식/광고알림</td>
					<td>수신함</td>
				</tr>
			</table>
		</div>
		<input type="hidden" id="client_id" name="client_id" value="${sessionScope.check.client_id }"/>
		<div id="buttons">
			<a href="${root }main/mypage/changepw"><button type="button" class="btn btn-default" id="changebtn">비밀번호변경</button></a>
			<button type="submit" class="btn btn-default" id="submitbtn">변경 완료</button>
			<button type="button" class="btn btn-default" id="resetbtn" onclick="location.href='../myinfo'">취 소</button>
		</div>
	</form>   
</div>

<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
  
</script>
</body>
</html>
