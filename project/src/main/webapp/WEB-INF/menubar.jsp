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
		top:25;
		width:350px;
	}
	/* �޴��� */
	#top1 {
		height:100px;
		font-family: 'Jua';
	}
	#top2 {
		background-color:141414;
		height:100px;
		line-height:30px;
	}
	#menubar {
		margin:0 auto;
		text-align:center;
		padding:35 270 0 500;
	}
	#menubar>li {
		padding:0 20px 0 0;
		text-align:center;
	}
	#menubar>li>a {
		font-size:20px;
		font-weight:bold;
		color:white;
		padding:20 60;
		text-align:center;
	}
	#menubar li>ul>li>a {
		font-size:15px;
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
				<div id="top3" align="center">
					<!-- �޴��� -->
					<ul class="nav navbar-nav" id="menubar">
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">��&nbsp; &nbsp; &nbsp;��</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }tour/eastasia">�߱�/�Ϻ�</a></li>
					       		<li><a href="${root }tour/southeastasia">�����ƽþ�</a></li>
					       		<li><a href="${root }tour/america">�� �� �� ī</a></li>
					       		<li><a href="${root }tour/europe">�� &nbsp; &nbsp; &nbsp; &nbsp;��</a></li>
					       		<li><a href="${root }tour/pacific">�� �� �� ��</a></li>
					       		<li><a href="${root }tour/africa">�� �� �� ī</a></li>
					       		<li><a href="${root }tour/theme">�� �� �� ��</a></li>
							</ul>
				        </li>
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Ŀ�´�Ƽ</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }board/review">�����ı�</a></li>
					       		<li><a href="${root }board/partner">���౸�ϱ�</a></li>
					       		<li><a href="${root }board/free">�����Խ���</a></li>
							</ul>
				        </li>
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> �̺�Ʈ </a></li>
				        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">������</a>
							<ul class="dropdown-menu" role="menu">
					            <li><a href="${root }board/notice">�� &nbsp; &nbsp; &nbsp; &nbsp;��</a></li>
							    <li><a href="${root }board/qna">���ֹ�������</a></li>
							</ul>
				        </li>
				        <c:if test="${sessionScope.staffcheck ne null }">
					        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">�����ڼ���</a>
								<ul class="dropdown-menu" role="menu">
						            <li><a href="${root }system/staff">���� ����</a></li>
						       		<li><a href="${root }system/guide">���̵����</a></li>
						       		<li><a href="${root }system/client">ȸ������</a></li>
						       		<li><a href="${root }system/paid">��������</a></li>
						       		<li><a href="${root }system/report">�Ű����</a></li>
								</ul>
					        </li>
				        </c:if>
					</ul>
				</div>   <!-- �޴��� -->
				
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
</div>
</body>
</html>