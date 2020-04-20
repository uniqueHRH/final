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
<link rel="stylesheet" type="text/css" href="${root }css/boardWrite.css" />
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>


<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>INSERT</h1>
   </div>
      
	<form class="form-inline" method="POST" enctype="multipart/form-data">
	<!-- 입력 -->
		<div class="form-group">
			<label for="exampleInputName2">&nbsp; 제 목</label>
			<input type="text" class="form-control" id="board_sub" name="event_sub">
		</div>
		<div>
			&nbsp; <textarea class="form-control" id="board_content" name="event_content"></textarea>
		</div>
	<!-- file upload -->
		<div class="upload">
			<input type="file" id="board_img" name="file" />
			<a class="btn btn-default" role="button" id="dele">삭제</a>
			<div class="board_img"><img src=""/></div>
		</div>
	
	<!-- 버튼 -->
		<div id="btn">
		  <button type="submit" class="btn btn-default" id="subm">작성완료</button> &nbsp;
		  <button type="button" class="btn btn-default" id="btn2">취 &nbsp; &nbsp;소</button>
		</div>
	</form>
</div>
      

<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${root }ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('board_content');
		
		// 파일업로드
		$('#board_img').change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('.board_img img').attr('src', data.target.result).width(200);        
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		// 이미지 삭제
		$('#dele').on('click', function() {
			$('#board_img').val('');
			$('#img').attr('src','');

		});

		$('#subm').on('click', function() {
			var sub=$('#board_sub').val();
			var content=$('#board_content').val();
			
			if(sub=='') {
				swal({
					title: "제목을 입력해주세요",
					icon: "warning",
					button:"확인"
				})
				return false;
			} else if(CKEDITOR.instances.board_content.getData()=='') {
	            swal({
	               title: "내용을 입력해주세요",
	               icon: "warning",
	               button:"확인"
	            })
	            return false;
	         }
		});
		
		// 뒤로 버튼
		$('#btn2').on('click',function() {
			swal({
	            title: "작성을 취소하시겠습니까?",
	            icon: "warning",
	            buttons: ["아니요", "네"]
	         }).then((네) => {
	            if(네) {
	               location.href="../board/event";
	            }
	         })
		});
	});
	
</script>
</body>
</html>