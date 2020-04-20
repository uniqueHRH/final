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
<link rel="stylesheet" type="text/css" href="${root }css/boardUpdate.css" />
<style type="text/css">

</style>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>


<!-- contents start -->
<div id="allContain">
	<div class="page-header" id="page-header" align="center">
		<h1>이벤트</h1>
	</div>
	      
	<!-- 제목 -->
	<form class="form-inline" method="POST" enctype="multipart/form-data">
		<div class="form-group" id="sub">
			<input type="text" class="form-control" id="board_sub" name="event_sub" value="${bean.event_sub }">
			<input type="hidden" id="board_no" name="board_no" value="${bean.board_no }">
		</div>
		<div id="sub_sub">
			<label for="exampleInputName2">닉네임</label>
			<input type="text" class="form-control" id="client_nick1" name="client_nick1" value="관리자" style="cursor:default" disabled>
		&nbsp; &nbsp;
			<label for="exampleInputEmail2">작성일</label>
			<input type="email" class="form-control" id="board_date" name="event_date" value="${bean.event_date }" style="cursor:default" disabled>
		&nbsp; &nbsp;
			<label for="exampleInputEmail2">조회수</label>
			<input type="email" class="form-control" id="board_count" name="event_count" value="${bean.event_count }" style="cursor:default" disabled>
		</div>
		<div id="textarea">
			<textarea class="form-control" id="board_content" name="event_content">${bean.event_content }</textarea>
		</div>
	<!-- 이미지 수정 -->
		<div class="upload">
			<input type="file" id="board_img" name="file" />
			<a class="btn btn-default" role="button" id="deleImg">삭제</a>
			<div class="board_img">
				<img src="${root }resources/${bean.event_thumb }" id="uploadI"/>
				<input type="hidden" name="event_thumb" value="${bean.event_thumb }"/>
				<input type="hidden" name="event_img" value="${bean.event_img }"/>
			</div>
			
		</div>
		<p></p>	
		
		<div id="btn">
			<button type="submit" class="btn btn-default" id="subm">수정완료</button> &nbsp;
			<button type="reset" class="btn btn-default" id="dele">초기화</button> &nbsp;
			<button type="button" class="btn btn-default" id="goList">작성취소</button>
		</div>
	</form>
</div>   

<!-- contents end -->
<jsp:include page="/WEB-INF/remote.jsp"/>
<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${root }ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		CKEDITOR.replace('board_content');
		// 이미지 수정
		$('#board_img').change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('.board_img img').attr('src', data.target.result).width(200);        
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		$('#deleImg').on('click', function() {
			$('#board_img').val('');
			$('#uploadI').attr('src','');

		});
		
		// 목록버튼
		$('#goList').on('click',function() {
			swal({
				text: "작성내용이 사라집니다\n그래도 돌아가시겠습니까?",
				icon: "warning",
				buttons: ["아니요", "네"]
			}).then((네) => {
				if(네) {
					location.href="../eventDe/${bean.board_no}";
				}
			})
		});      
   });
</script>
</body>
</html>
