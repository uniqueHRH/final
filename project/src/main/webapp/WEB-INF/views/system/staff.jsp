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
   .container {
   		width: 100%;
      	display: inline-block;
      	font-family: 'Jua';
      	text-align: center;
   }
   #page-header{
   		font-family: 'Jua';
      	text-align: center;
   }
   #receivebtn,#sendbtn{
   		font-family: 'Jua';
   		display: inline-block;
   		position: relative;
   		left: 230px;
   		margin-bottom: 10px;
   }
   #registerbtn{
   font-family: 'Jua';
   		display: inline-block;
   		position: relative;
   		left: 870px;
   		margin-bottom: 10px;
   }
   #table {
      width:700px;      
      margin:0 auto;
      text-align:center;
      font-family: 'Jua';
   }
   #table>thead th{
   		text-align: center;
        font-size: 15px;
   }
   #table>thead th:nth-child(2) {
      width:200px;
      text-align: center;
   }
  #pageNum, #search {
      width:320px;      
      margin:0 auto;
      text-align:center;
   }
  .dropdown {
      font-family: 'Jua';
      font-size: 18px;
   }
   
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>

<!-- contents start -->
<div class="container">
  <div class="row">
   <div class="col-md-12">
      <div class="page-header" id="page-header" align="center">
     <h1>직원관리</h1>
   </div>
<button type="button" id="registerbtn" class="btn btn-default">등록</button>
  


<!-- 리스트 출력 -->
<table class="table table-hover" id="table">
   <thead>
      <tr class="active">
      	 <th>no</th>
         <th>이 름</th>
         <th>연락처</th>
         <th>이메일</th>
         <th>소 속</th>
      </tr>
   </thead>
   <tbody>
      <tr>
      	 <td>1</td>
         <td>채우식</td>
         <td>01088163279</td>
         <td>c920216@naver.com</td>
         <td>회장</td>
      </tr>
      <tr>
      	 <td>1</td>
         <td>정지문</td>
         <td>01088163279</td>
         <td>c920216@naver.com</td>
         <td>사원</td>
      </tr>
      <tr>
      	 <td>1</td>
         <td>채우식</td>
         <td>01088163279</td>
         <td>c920216@naver.com</td>
         <td>회장</td>
      </tr>
      <tr>
      	 <td>1</td>
         <td>채우식</td>
         <td>01088163279</td>
         <td>c920216@naver.com</td>
         <td>회장</td>
      </tr>
   </tbody>
</table>

<nav id="pageNum">
<!-- 페이지넘버링 -->
  <ul class="pagination">
    <li class="disabled"><a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
<!-- 검색 -->
   <div class="dropdown" id="search" style="display:block;">
      <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true"><img src="https://cdn.pixabay.com/photo/2016/03/31/19/14/magnifying-glass-1294834_960_720.png" style="width:20px;"><span class="caret"></span></button>
        	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
             <li role="presentation"><a role="menuitem" tabindex="-1" href="#">이름</a></li>
             <li role="presentation"><a role="menuitem" tabindex="-1" href="#">연락처</a></li>
             <li role="presentation"><a role="menuitem" tabindex="-1" href="#">부서</a></li>
         </ul>
         
      <input type="text" class="form-control" id="client_id" name="client_id" style="width:200px; display:inline-block;">
      <a class="btn btn-default" href="#" role="button">검색</a>
   </div>
</nav>      
      </div>
   </div>
</div>
                                    <!-- contents end -->
     
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