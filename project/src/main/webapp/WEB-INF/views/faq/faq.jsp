<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" import="com.bit.project.model.entity.*, java.util.List"%>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<link rel="stylesheet" type="text/css" href="${root }css/board.css" />
<style type="text/css">
	#theme {
		width:900;
		margin:0;
		padding:20 20 20 20;
		background-color:#e8e8e8;
		border-radius:15px;
	}
	#queIns {
		width:780px;
		height:32px;
		border-radius:0;
		resize:none;
		display:inline-block;
		padding:5 10;
		margin:0 20;
	}
	#ansIns {
		width:780;
		height:100;
		display:inline-block;
		resize:none;
		padding:5 10;
		margin:8 20;
	}
	#btnIns {
		width:800;
	}
	#ins {
		display:inline-block;
	}
	#list {
		padding:30 0 0 0;
	}
	input {
		width:850px;
		border:0;
		outline:0;
		border-radius:15px;
	}
	#tab_s {
		width:850px;
	}
	.question {
		padding:20 0 20 20;
		background-color:#e8e8e8;
		font-size:18px;
		cursor:pointer;
		margin:5 0;
		border-bottom:1px solid gray;
	}
	.answer {
		padding:25 0 25 35;
		font-size:17px;
		background-color:white;
	}
	#pageNum {
		padding:30 0;
	}
</style>
</head>
<body>	
<jsp:include page="/WEB-INF/menubar.jsp"/>


<!-- contents start -->
	<div id="table">
<div class="page-header" id="page-header" align="center">
	<h1>F A Q</h1>
</div>

	<div class="topMenu" id="theme" align="left">
		<input type="hidden" id="loginCk" value="${sessionScope.staffcheck.staff_name}"/>
		<textarea id="queIns" placeholder="질문을 입력해주세요"></textarea>
		<textarea id="ansIns" placeholder="답변을 입력해주세요"></textarea>
		<div id="btnIns" align="right">
			<a class="btn btn-default" role="button" id="ins">완료</a>
			<a class="btn btn-default" role="button" id="res">취소</a>
		</div>
	</div>
<!-- 리스트 출력 -->
	<div id="list">
		<c:forEach items="${list }" var="bean">
			<div id="tab">
				<input type="text" id="qus_${bean.faq_no }" class="question"value="${bean.faq_question }" readonly>
			</div>
			<div id="tabs">
				<input type="text" id="ans_${bean.faq_no }" class="answer" value="${bean.faq_answer }">
				<div id="tab_s" align="right">
					<a class="btn btn-default" role="button" id="upd_${bean.faq_no }">수정</a>
					<a class="btn btn-default" role="button" id="ins_${bean.faq_no }">완료</a>
					<a class="btn btn-default" role="button" id="can_${bean.faq_no }">취소</a>
					<a class="btn btn-default" role="button" id="del_${bean.faq_no }">삭제</a>
				</div>
			</div>
			<div>
			</div>
		</c:forEach>
	</div>

<nav id="pageNum">
<!-- 검색 -->
   <div class="topMenu" id="search">
		<select id="searchType">
		    <option value="faq_question">질 &nbsp; 문</option>
		</select>
      <input type="text" class="form-control" id="keyword" name="keyword" style="width:200px; display:inline-block;">
		<a class="btn btn-default" href="#" role="button" id="searchGo">G O</a>
	</div>
	
</nav>

<!-- 리모컨 -->
	<div class="btn-group-vertical fixed-top" id="remote" role="group" aria-label="...">
		<div id="kakao-talk-channel-chat-button"></div>
		<button type="button" class="btn btn-default" id="top">TOP ▲</button>
	</div>
	</div>


<!-- contents end -->
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		// 리모컨 top
		$('#top').on('click',function() {
			$('html,body').scrollTop(0);
		});
		
		//<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('acc658a670e9ed5918d11647040b5bc5');
	    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
	    Kakao.Channel.createChatButton({
	      container: '#kakao-talk-channel-chat-button',
	      channelPublicId: '_wxfwxfxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
	    });
	  //]]>

	    var id=$('#loginCk').val();
	    if(id=='') {
			$('#theme').hide();
	    }
	    
	   $('#ins').on('click',function() {
		   var question=$('#queIns').val();
		   var answer=$('#ansIns').val();
		   
		   $.ajax({
			   url:'../board/faqIns',
			   type:'POST',
			   data:{faq_question:question, faq_answer:answer},
			   success:function() {
				   reload();
			   },
			   error:function() {
				   console.log('다시 시도해주세요');
				}
		   });
	   }); 
	    $('#res').on('click',function() {
	    	var con=confirm('작성을 취소하시겠습니까?');
	    	if(con) {
	    		reload();
	    	}
	    });
//////////////////////////////////////////////////////////////////////////////////////////		
		// 리스트 출력
		$('input[id^=ans_]').hide();
		$('a[id^=upd_]').hide();
		$('a[id^=ins_]').hide();
		$('a[id^=can_]').hide();
		$('a[id^=del_]').hide();
		
		$('input[id^=qus_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			
			var log=$('#loginCk').val();
			
			$('input[id^=ans_'+num+']').toggle();
			if(log) {
				$('a[id^=upd_'+num+']').toggle();
				$('a[id^=del_'+num+']').toggle();
			}
		});
		
		// 수정
		$('a[id^=upd_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			
			$('input[id=qus_'+num+']').off('click');
			$('input[id=qus_'+num+']').attr('readonly',false);
			$('input[id=ans_'+num+']').attr('readonly',false);
			$('a[id=upd_'+num+']').toggle();
			$('a[id=ins_'+num+']').toggle();
			$('a[id=can_'+num+']').toggle();
			$('a[id=del_'+num+']').toggle();
			
			$('a[id=ins_'+num+']').on('click',function() {
				var question=$('input[id=qus_'+num+']').val();
				var answer=$('input[id=ans_'+num+']').val();
				$.ajax({
					url:'../board/faqUp',
					type:'POST',
					data:{faq_question:question, faq_answer:answer, faq_no:num},
					success:function() {
						reload();
					},
					error:function() {
						console.log('다시 시도해주세요');
					}
				});   // ajax
			});   // click
			$('a[id=can_'+num+']').on('click',function() {
				var con=confirm('작성을 취소하시겠습니까?');
				if(con) {
					reload();
				}
			});
		});
		
		// 삭제
		$('a[id^=del_]').on('click',function() {
			var btn=$(this).attr('id');
			var num=btn.split('_');
			var num=num[1];
			var con=confirm('삭제하시겠습니까?');
			
			if(con) {
				$.ajax({
					url:'../board/faqDel',
					type:'POST',
					data:{key:num},
					success:function() {
						reload();
					},
					error:function() {
						console.log('다시 시도해주세요');
					}
				});   // ajax
				}
			});
//////////////////////////////////////////////////////////////////////////////////////////		
		// 검색
		$('#searchGo').on('click',function() {
			var url='${root }board/faq';
			url=url+'?searchType='+$('#searchType').val();
			url=url+'&keyword='+$('#keyword').val();
			
			location.href=url;
			console.log(url);
		});
		
		
		
		function reload() {
	    	  location.reload();
	      }
   });
		
		
</script>
</body>
</html>