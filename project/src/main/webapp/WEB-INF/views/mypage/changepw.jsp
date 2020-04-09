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
   #table {
      	font-family:"Jua";
    }
    .control-label{
    	width: 100px;
    }
    .form-horizontal {
    	padding-top: 50px;
    	text-align: center;
        width:570px;
      	margin: 0 auto;
    }
    #idd,#pww {
       display:inline block;  
    }
    #resetbtn,#changepwbtn{
    	position: relative;
    	margin-top: 10px;
    	width: 180px;
    	left: 50px;
    }
    form{
    	padding: 0 0 220 0;
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
                     <!-- contents start -->
<div id="table">
      <div class="page-header" align="center">
     <h1>비밀번호변경</h1>
   </div>
   <form action="../mypage/changepw" class="form-horizontal" method="post">
     <div class="form-group" id="insertid" align="center">
       <label for="client_pw" class="col-sm-2 control-label" id="idd">현재비밀번호</label>
       <div class="col-sm-10">
         <input type="password" class="form-control" id="client_pw" name="client_pw"style="width:350px">
         <input type="hidden" class="form-control" id="client_id" name="client_id" value="${sessionScope.check.client_id}">
         <input type="hidden" class="form-control" id="client_pw2" name="client_pw2" value="${sessionScope.check.client_pw}">
       </div>
     </div>
     
     <div class="form-group" align="center">
       <label for="client_newpw1" class="col-sm-2 control-label" id="pww">새비밀번호</label>
       <div class="col-sm-10">
          <input type="password" class="form-control" id="client_newpw1" name="client_newpw1" placeholder="영문+숫자 조합 8자리이상" style="width:350px">
       </div>
     </div>
     
     <div class="form-group" align="center">
       <label for="client_newpw2" class="col-sm-2 control-label" id="pww2">새비밀번호(확인)</label>
       <div class="col-sm-10">
          <input type="password" class="form-control" id="client_newpw2" name="client_newpw2" placeholder="비밀번호를 한번 더 입력해주세요" style="width:350px">
       </div>
     </div>
     <div>
     	<button type="button" id="changepwbtn" class="btn btn-default">변경완료</button>
     	<button type="button" id="resetbtn" class="btn btn-default" onclick="location.href='../myinfo'">취소</button>
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
   $(document).ready(function() {
		
		$("#changepwbtn").on('click',function(){
			var id = $('#client_id').val();
			var pw = $('#client_pw').val();
			var pw2 = $('#client_pw2').val();
			var newpw1 = $('#client_newpw1').val();
			var newpw2 = $('#client_newpw2').val();
			
			 var newpw = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	         var pwcheck = newpw.test($("#client_newpw1").val());
			
			if(!pw || !newpw1 || !newpw2){
				alert('빈칸을 입력해주세요');
				return false;
			}else if(newpw1 != newpw2){
				alert('새비밀번호가 일치하지않습니다');
				return false;
			}else if(pw2 != pw){
				alert('현재비밀번호가 일치하지않습니다');
				return false;
			}else if(!pwcheck){
				alert('비밀번호는 영문+숫자 조합 8자리이상입니다');
				return false;
			}else{
				$.ajax({
					url:'../mypage/changepw',
					type:'POST',
					data:{client_pw:newpw1, client_id:id},
					success:function(){
						alert('비밀번호 변경이 완료되었습니다. 로그인을 다시 해주세요');
						location.href="../login";
					},
				});
			}
		});
		
   });
</script>
</body>
</html>
