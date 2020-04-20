<%@page import="org.springframework.web.servlet.config.MvcNamespaceHandler"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
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
		padding-left:170px;
		font-family: 'Jua';
	}
	form {
		width:500px;      
		margin:0 auto;
		font-size:15px;
		padding:50 0;
	}
	#form_sub {
		padding:0 0 0 20;
	}
	form label {
	   width: 100px;
	   span: 0 5px;
	}
	form input {
	   width:280px;
	}
	#countDown {
	   border: 0px;
	   width: 100px;
	   background-color:white;
	}
	#code, #dice {
	   display: inline-block;
	}
	#loading {
		 width: 100%;  
		 height: 100%;  
		 top: 0px;
		 left: 0px;
		 position: fixed;  
		 opacity: 0.7;  
		 z-index: 99;   
		 text-align: center;
		 background-color:#898686;  
		 display: none;
	}
	#imgs{
	     display: none;
	     position:absolute;
	     left:45%;
	     top:45%;
	     z-index: 100;
	}
	#btn {
		text-align:center;
		padding:20 0 0 0;
	}
	#resetbtn, #confirmbtn {
	   text-align: center;
	   width:160px;
	}
</style>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
<!-- contents start -->
<div id="allContain">
	<div class="page-header" align="center">
		<h1>아이디 찾기</h1>
	</div>
   
   <div id="loading">
      <img id="imgs" src="../../imgs/loadingbar.gif"/>
   </div>
   
   
	<form action="../code_check" name="cac" class="form-horizontal" method="post">
		<div id="form_sub">
			<div>
				<label for="client_name" class="col-sm-2 control-label" id="idd">이름</label>
				<input type="text" class="form-control" id="client_name" name="client_name" placeholder="이름을 입력하세요" style="width:280px">
			</div>
			<p></p>
			<div>
				<label for="client_nick" class="col-sm-2 control-label" id="emaill">이메일</label>
				<input type="text" class="form-control" id="client_email" name="client_email" placeholder="이메일을 입력하세요" style="width:280px;float:left">
				&nbsp;<button class="btn btn-default" type="button" id="codebtn">인증요청</button>
			</div>
			<p></p>
			<div>
				<label for="code" class="col-sm-2 control-label">인증번호</label>
				<input type="text" class="form-control" id="code" name="code" placeholder="이메일로 전송된 인증번호를 입력하세요" style="width:280px">
				&nbsp;<input type="text" class="input" id="countDown" disabled>
				<input type="hidden" id="dice" name="dice" value="" style="display: none;">
			</div>
		</div>
		<div id="btn">
			<button type="submit" id="confirmbtn" class="btn btn-default btn-lg">확인</button>
			<button type="button" id="resetbtn" class="btn btn-default btn-lg" onclick="location.href='../login'">취소</button>
		</div>
	</form>   
</div>
      
      
                         <!-- contents end --> 
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript">
   $(document).ready(function() {
       
   
      //인증번호 요청
       $('#codebtn').on('click',function() {
         var Height = $(document).height();  
         var Width = $(window).width();  
         $('#loading').css({'width': Width,'height': Height});
          
         var name = $('#client_name').val();
         var email = $('#client_email').val();
         
         if(!name || !email){
            swal({
				   title: "이름과 이메일을 확인해주세요",
				   icon: "warning"
				})
            return false;
            event.preventDefault();
         }else{
            $.ajax({
               url:'../login/findid',
               type:'POST',
               data:{client_name:name, client_email:email},
               beforeSend:function(){
                  $('#loading').css('display','block');
                  $('#imgs').css('display','block');
                  
               },
                success:function(data){
                   var check = data.FindId
                   if(check == null){
                      $('#loading').css('display','none');
                      $('#imgs').css('display','none');
                      swal({
       				   title: "가입하신 이름과 이메일을 입력해주세요",
       				   icon: "info"
       					})
                   }else{
                     var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
                      var myVar;
                         function time(){
                             myVar = setInterval(alertFunc, 1000); 
                         }
                         time();
          
                        function alertFunc() {
                          var min = num / 60; 
                            min = Math.floor(min);
                          var sec = num - (60 * min);
                          var $input = $('.input').val(min + '분' + sec + '초');
                            if(num == 0){
                              clearInterval(myVar);
                              swal({
                  				   title: "요청 시간이 만료되었습니다.",
                  				   icon: "info"
                  					})
                              // num 이 0초가 되었을대 clearInterval로 타이머 종료
                          }
                          num--;
                        }
                      $('#loading').css('display','none');
                      $('#imgs').css('display','none');
                      $('input[name=dice]').attr('value',data.Dice);
                      swal({
         				   title: "인증번호를 발송했습니다.이메일을 확인해주세요",
         				   icon: "info"
         					})
                   }
                },
               error:function(){
                  swal({
    				   title: "요청에 실패하였습니다.",
    				   icon: "warning"
    					})
               }
            });
         }
       });
      
      
      //form submit 제한 , 인증확인
      $('#confirmbtn').on('click',function() {
         var name = $('#client_name').val();
         var email = $('#client_email').val();
         var code = $('#code').val();
         var dice = $('#dice').val();
         
         if(!name || !email){
        	 swal({
				   title: "이름과 이메일을 확인해주세요",
				   icon: "warning"
					})
            return false;
         }else if(!code){
        	 swal({
				   title: "인증번호를 입력해주세요",
				   icon: "info"
					})
            return false;
         }else if(code != dice){
            swal({
				   title: "인증번호가 일치하지않습니다",
				   icon: "warning"
					})
            return false;
         }else{
            return true;
         }
      });
   });
</script>
</body>
</html>
