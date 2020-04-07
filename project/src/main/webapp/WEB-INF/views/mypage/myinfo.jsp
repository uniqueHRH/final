<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<style type="text/css">
   
    #table1{
    	font-family: 'Jua';
    	padding: 0 0 130 0;
    }
    
    #infocomm{
    	font-size: 20px;
    }
    #table {
    	width:50%;
    	margin:0px auto;
    	text-align: center;
    }
   #table tr{
   		text-align: center;
   }
   #table tr td{
   		text-align: center;
   		font-size: 15px;
   }
   #changeinfobtn{
   		width: 150px;
   		position:relative;
   		left: 1180px;
   		margin-bottom: 20px;
   		
   }
  
</style>
</head>
<body>
  <jsp:include page="/WEB-INF/menubar.jsp"/>
<!-- menubar end -->
                     <!-- contents start -->
<div id=table1>
 
  <div class="page-header" align="center">
     <h1>내 정보관리</h1>
   </div>
				<p id="infocomm" align="center">내정보를 최신정보로 관리해주세요</p>
				<div id="changebtn">
				<a href="${root }main/mypage/lock"><button type="button" id="changeinfobtn" class="btn btn-default">정보수정</button></a>
				</div>
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
			<td>${sessionScope.check.client_nick1 }<br/></br>${sessionScope.check.client_phone }</td>
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
    </div>
  
      
                         <!-- contents end -->
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
	   $('#tour_sub').hide();
		$('#comm_sub').hide();
		$('#serv_sub').hide();
		$('#system_sub').hide();
		
		$('#mainFont1').hide();
		$('#mainFont2').hide();
		$('#mainFont3').hide();
		$('#mainFont4').hide();

		$('#tour').mouseenter(function() {
			$('#tour_sub').show();
		}).mouseleave(function() {
			$('#tour_sub').hide();
		});
		$('#comm').mouseenter(function() {
			$('#comm_sub').show();
		}).mouseleave(function() {
			$('#comm_sub').hide();
		});
		$('#serv').mouseenter(function() {
			$('#serv_sub').show();
		}).mouseleave(function() {
			$('#serv_sub').hide();
		});
		$('#system').mouseenter(function() {
			$('#system_sub').show();
		}).mouseleave(function() {
			$('#system_sub').hide();
		});
      
   });
</script>
</body>
</html>
