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
	#footerM {
		margin:100 0 0 0;
		padding:50px;
		background-color:#e8e8e8;
		font-family:"Jua";
		text-align:center;
	}
	.footerS, .footerM, .footerF {
		font-size:15px;
		width:430px;
		height:200px;
		margin:0 auto;
		display:inline-block;
		padding:0px;
		text-align:center;
	}
	.pas {
		display:inline-block;
		width:280px;
	}
	p{
		margin:0 auto;
		padding:0 0 0 300px;
	}
</style>
</head>
<body>
<div id="footerM">
	<div class="pas"></div>
	<div class="footerS">
		(��) �����뼳��<br/><br/>
		��ǥ��: ȫ�浿<br/><br/>
		����ڵ�Ϲ�ȣ : 123-45-67890
	</div>
	<div class="footerM">
		����Ǹž��Ű��ȣ : ����01-0013ȣ<br/><br/>
		��������� ��Ϲ�ȣ : ��2020-000001ȣ<br/><br/>
		������������ : 22�� 1õ���� ����
	</div>
	<div class="footerF">
		1234-5678<br/><br/>
		12345@traveler.com<br/><br/>
		[06134] ���� ������ �������5�� 11 ������ 2��, 3��<br/>
	</div>
		<p>COPYRIGHT �� HANATOUR SERVICE INC. ALL RIGHT RESERVED</p>
</div>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript">
</script>
</body>
</html>