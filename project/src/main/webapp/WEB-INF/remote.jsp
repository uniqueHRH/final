<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
/* ������ */ 
	#remote {
		position:fixed;
		left:1580px;
		top:700px;
		width:150px;
	}
	#kakao-talk-channel-chat-button {
		width:150px;
	}
	.kakaoChat {
		text-align:center;
		padding:0;
		margin:0;
	}
	#top {
		height:40px;
	}
</style>
</head>
<body>

<!-- ������ -->
	<div class="btn-group-vertical fixed-top" id="remote" role="group" aria-label="...">
		<div id="kakao-talk-channel-chat-button" class="kakaoChat"></div>
		<button type="button" class="btn btn-default" id="top">TOP ��</button>
	</div>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	//������ top
	$('#top').on('click',function() {
		$('html,body').scrollTop(0);
	});

	//<![CDATA[
	// ����� ���� JavaScript Ű�� ������ �ּ���.
	Kakao.init('acc658a670e9ed5918d11647040b5bc5');
	// īī���� ä�� 1:1ä�� ��ư�� �����մϴ�.
	Kakao.Channel.createChatButton({
	  container: '#kakao-talk-channel-chat-button',
	  channelPublicId: '_wxfwxfxb' // īī���� ä�� Ȩ URL�� ��õ� id�� �����մϴ�.
	});
	//]]>
});
</script>
</body>
</html>