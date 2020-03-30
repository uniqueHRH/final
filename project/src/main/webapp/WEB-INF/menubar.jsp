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
	#logo {
		position:fixed;
		top:30;
		left:700;
		width:350px;
	}
	
	/* �޴��� */
	#top1 {
		height:110px;
		font-family: 'Jua';
	}
	#top2 {
		background-color:141414;
		height:110px;
		line-height:30px;
	}
	#top3 {
		position:fixed;
		font-size:17px;
		font-family: 'Jua';
		background-color:141414;
		width:260px;
		height:1000px;
		text-align:center;
		list-style:none;
	}
/* �޴� */
	#tourM, #boardM, #serviceM, #eventM, #systemM {
		font-size:23px;
		text-align:center;
		color:white;
		padding:15 70;
		border-bottom:1px solid #e8e8e8;
		cursor:pointer;
	}
/* ���� �޴� */
	#menubar>div>a {
		padding:20 80;
		font-size:18px;
		color:white;
		text-decoration:none;
	}
	#tourS, #boardS, #serviceS, #systemS {
		background-color:#0F0F0F;
	}
	#menubar>div>a:hover {
		background-color:#e8e8e8;
		font-weight:bold;
		font-size:20px;
		color:black;
	}
	#login {
	}
	#login li>a {
		color:white;
		padding:20;
	}
	#login li>ul>li>a {
		color:black;
		text-align:center;
	}
	body {
		padding-top:100px;
	}
	#ser {
		padding:400px 0 0 0;
		position:fixed;
	}
	p {
		color:white;
		font-weight:none;
		font-size:13px;
		display:inline-block;
	}
	#kakao-talk-channel-chat-button {
		width:50px;
		padding:0;
		margin:0;
		display:inline-block;
	}
</style>
</head>
<body>
<div id="mainTop">
	<nav class="navbar navbar-default navbar-fixed-top" id="top1">
		<div class="container-fluid" id="top2">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<a href="${root }"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/logo.png?raw=true" id="logo"></a>
				<!-- �α��� -->
				<div id="login">
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${sessionScope.check eq null && sessionScope.staffcheck eq null }">
							<li><a href="${root }main/login">�α���</a></li>
					        <li><a href="${root }main/admin">ȸ������</a></li>
			        	</c:if>
						
						<!-- �����α��ν� -->
				        <li class="dropdown">
					        <c:if test="${sessionScope.staffcheck ne null }">
					        	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">����������<span class="caret"></span></a>
					        	<ul class="dropdown-menu" role="menu">
					        		<li><a href="${root }main/staffinfo">����������</a></li>
				            		<li><a href="${root }main/logout">�α׾ƿ�</a></li>
					        	</ul>
					        </c:if>
						</li>
				        <!-- ȸ���α��ν� -->
				        <c:if test="${sessionScope.check ne null }">
					        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${sessionScope.check.client_nick1} ��<span class="caret"></span></a>
					        	<ul class="dropdown-menu" role="menu">
					        		<li><a href="${root }main/message">������</a></li>
					        		<li><a href="#">�ֱٺ���ǰ</a></li>
					        		<li><a href="${root }main/wish">���ѻ�ǰ</a></li>
					        		<li><a href="#">������ǰ</a></li>
					        		<li><a href="#">��������</a></li>
					        		<li><a href="${root }main/myinfo">����������</a></li>
					        		<li><a href="${root }main/logout">�α׾ƿ�</a></li>
					        	</ul>
							</li>
						</c:if>
					</ul>
				</div>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	
	
	<div id="top3">
		<div id="menubar">
	        <li id="tourM">��&nbsp; &nbsp; &nbsp;��</li>
        	<div id="tourS">
			    <a href="${root }tour/eastasia">�߱� /�Ϻ�</a>
			    <a href="${root }tour/southeastasia">�����ƽþ�</a>
		    	<a href="${root }tour/america">�� �� �� ī</a>
	    		<a href="${root }tour/europe">�� &nbsp; &nbsp; &nbsp; &nbsp;��</a>
	       		<a href="${root }tour/pacific">�� �� �� ��</a>
	       		<a href="${root }tour/africa">�� �� �� ī</a>
	       		<a href="${root }tour/theme">�� �� �� ��</a>
	       	</div>
	        <li id="boardM">Ŀ�´�Ƽ</li>
        	<div id="boardS">
	            <a href="${root }board/review">���� �ı�</a>
	            <a href="${root }board/partner">���౸�ϱ�</a>
	       		<a href="${root }board/free">�����Խ���</a>
		        <a href="${root }board/event">�� &nbsp;�� &nbsp;Ʈ</a>
	       	</div>
	       	<li id="eventM">�̺�Ʈ</li>
	        <li id="serviceM">������</li>
        	<div id="serviceS">
	            <a href="${root }board/notice">�� &nbsp; &nbsp; &nbsp; &nbsp;��</a>
			    <a href="${root }board/qna">���ֹ�������</a>
	       	</div>
	        
	        <c:if test="${sessionScope.staffcheck ne null }">
	        <li id="systemM">�����ڼ���</li>
        	<div id="systemS">
	            <a href="${root }system/staff">���� ����</a>
	       		<a href="${root }system/guide">���̵����</a>
	       		<a href="${root }system/client">ȸ�� ����</a>
	       		<a href="${root }system/paid">���� ����</a>
	       		<a href="${root }system/report">�Ű� ����</a>
	       	</div>
	        </c:if>
		</div>
		<div id="ser">
			<p>īī���� ��㹮�� &nbsp; <div id="kakao-talk-channel-chat-button"></div> &nbsp; &nbsp; </p><br/>
			<p> &nbsp; ������ ���ǽð� : 09:00 ~ 18:00 (��~��)</p> 
		</div>
	</div>
</div>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tourS').hide();
		$('#boardS').hide();
		$('#serviceS').hide();
		$('#systemS').hide();
		
		$('#tourM').on('click',function() {
			$('#tourS').toggle();
		});
		$('#boardM').on('click',function() {
			$('#boardS').toggle();
		});
		$('#serviceM').on('click',function() {
			$('#serviceS').toggle();
		});
		$('#systemM').on('click',function() {
			$('#systemS').toggle();
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