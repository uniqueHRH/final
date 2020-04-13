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
	#allContain {
		width:1000px;
		margin:0 auto;
		padding-left:170px;
		font-family: 'Jua';
	}
    #infocomm{
    	font-size: 20px;
    }
	#table {
    	width:800px;
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
	#changebtn {
		text-align:right;
	}
	#changeinfobtn{
		width: 150px;
		left: 1180px;
		margin-bottom: 20px;
	}
   		
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- menubar end -->
                     <!-- contents start -->
 
 <div id="allContain">
 	 <div class="page-header" align="center">
    	 <h1>내 정보관리(직원용)</h1>
  	 </div>
  	 <div id="changebtn">
		<a href="${root }main/mypage/lock2"><button type="button" id="changeinfobtn" class="btn btn-default">비밀번호 변경</button></a>
	</div>
	
	<div id="table">
		<table class="table table-hover">
		<tr>
			<td width="30%">사번/이름</td>
			<td width="40%">사번<br/></br>이름</td>
			<td width="50%">${sessionScope.staffcheck.staff_no }<br/></br>${sessionScope.staffcheck.staff_name }</td>
		</tr>
		<tr>
			<td>연락처/이메일</td>
			<td>연락처<br/><br/>이메일</td>
			<td>${sessionScope.staffcheck.staff_phone }<br/><br/>${sessionScope.staffcheck.staff_email }</td>
		</tr>
		<tr>
			<td>입사일</td>
			<td>입사일</td>
			<td>${sessionScope.staffcheck.staff_joindate }</td>
		</tr>
	   </table>
	 </div>  
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
