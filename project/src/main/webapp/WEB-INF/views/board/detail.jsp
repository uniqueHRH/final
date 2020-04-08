<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" %>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua|Noto+Sans+KR&display=swap" rel="stylesheet">
<c:url value="/" var="root"></c:url>
<html>
<head>
<meta charset="utf-8">
<title>DETAIL</title>
<link rel="stylesheet" type="text/css" href="${root }css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${root }css/travel.css" />
<style type="text/css">
	h1 {
		font-family: 'Jua';
	}
	form {
		width:700px;      
		margin:0 auto;
		font-family: 'Jua';
		font-size:18px;
	}
	#hambI {
		border:1px solid #474747;
		padding:0;
		border-radius:10px;
	}
	form {
		width:750px;
		margin:0 auto;
		align:center;
		text-align:center;
		padding:0px;
	}
	#board_theme1, #board_theme2, #board_theme3, #board_land, #board_sub, #client_nick1, #board_date, #board_count, #board_content, #replyBoard {
		background-color:white;
	}
	#board_sub {
		width:575px;
		align:left;
		text-align:left;
	}
	#board_theme1, #board_theme2, #board_theme3 {
		text-align:center;
		font-size:13px;
		font-weight:normal;
		width:90px;
		border-color:white;
	}
	#board_date {
		width:120px;
	}
	#client_nick1, #board_count {
		width:140px;
	}
	#board_content {
		width:700px;
		height:300px;
	}
	#btn {
		text-align:center;
		padding: 0 0 30 0;
	}
	/* 댓글 */
	#table {
		width:700px;
		margin:0 auto;
		border-color:gray;
		padding:10px;
		border:0;
		outline:0;
		background-color:#e8e8e8;
	}
	#replyBoard {
		width:700px;
		height:100px;
	}
	#reply {
		width:600px;
		height:30px;
		font-family:'Jua';
		border:0;
		outline:0;
	}
	#reply_content {
		width:600px;
	}
	#edit, #update, #cancel, #dele2, #insert {
		text-align:center;
		width:30px;
		height:25px;
		text-align:center;
		border:0;
		outline:0;
		background-color:#e8e8e8;
	}
	tbody th:nth-child(1) {
		width:110px;
	}
	tbody th:nth-child(2) {
		font-size:13px;
		font-weight:normal;
		color:gray;
	}
	tbody td:nth-child(1) {
		font-size:13px;
		width:640px;
		height:25px;
	}
	tbody td:nth-child(2) {
		width:67px;
	}
/* content */
	#contentM {
		margin:20px 20px;
		border:2px solid #e8e8e8;
		border-radius:10px;
	}
	#contentC {
		width:670px;
		margin:20px 5px;
		background-color:white;
		border:0;
		outline:0;
		text-align:left;
	}
	#board_thumb {
		margin:20px 5px;
	}
   
</style>

</head>
<body>
<jsp:include page="/WEB-INF/menubar.jsp"/>
   
<!-- contents start -->
      <div class="page-header" id="page-header" align="center">
     <h1>DETAIL</h1>
   </div>
      
<!-- 제목 -->
<form class="form-inline" method="POST">
   <div>
      <input type="text" class="form-control" id="board_sub" name="board_sub" value="[${bean.board_land }] ${bean.board_sub }" style="cursor:default" disabled>
      <input type="text" class="form-control" id="board_date" value="${bean.board_date }" style="cursor:default" disabled>
      <input type="hidden" id="board_no" name="board_no" value="${bean.board_no }">
   </div>
   <p></p>
   <div>
      <div class="form-group" align="left">
         <input type="hidden" class="form-control" id="board_theme" value="${bean.board_theme }" style="cursor:default" disabled>
         <input type="text" class="form-control" id="board_theme1" style="cursor:default" disabled>
         <input type="text" class="form-control" id="board_theme2" style="cursor:default" disabled>
         <input type="text" class="form-control" id="board_theme3" style="cursor:default" disabled>
      &nbsp; &nbsp;
         <label for="exampleInputName2">닉네임</label>
         <input type="text" class="form-control" id="client_nick1" value="${bean.client_nick1 }" style="cursor:default" disabled>
      </div>
      <div class="form-group">
         <label for="exampleInputEmail2">조회수</label>
         <input type="text" class="form-control" id="board_count" value="${bean.board_count }" style="cursor:default" disabled>
         <input type="hidden" id="log" name="log" value="${sessionScope.check.client_nick1}">
         <input type="hidden" id="staffLog" name="staffLog" value="${sessionScope.staffcheck.staff_name}">
      </div>
   </div>
   <p></p>
   <div contenteditable="false" id="contentM">
		<img src="${root }resources/${bean.board_thumb }" id="board_thumb"/>
		<input type="hidden" id="hiddenI" value="${bean.board_thumb }"/>
		<input type="text" id="contentC" value="${bean.board_content }" disabled/>
   </div>
   <p></p>
   <div id="btn">
      <button type="button" class="btn btn-default" id="subm">수정하기</button>
      <button type="button" class="btn btn-default" id="dele">삭제하기</button>
      <button type="button" class="btn btn-default" id="goList">목록으로</button>
      <p></p>
   </div>

<!-- 댓글 출력 -->
   <div id="table">
      <table>
         <tbody id="tbody">
         <c:forEach items="${list }" var="beans">
            <tr id="tr1">
				<th id="th">${beans.client_nick1 }</th>
				<th id="th">${beans.reply_date }</th>
				<th><input type="hidden" id="repId" name="repId_${beans.reply_no }" value="${beans.client_nick1 }"><th>
			</tr>
			<tr id="tr2">
				<td colspan="2"><input type="text" id="reply" name="reply_${beans.reply_no }" value="${beans.reply_content }" disabled></td>
				<td>
					<button type="button" id="edit" name="edit_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/edit.png?raw=true" width="15px" height="20px"/></button>
					<button type="button" id="update" name="update_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/insert.png?raw=true" width="15px" height="20px"/></button>
					<button type="button" id="cancel" name="cancel_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/delete.png?raw=true" width="15px" height="15px"/></button>
					<button type="button" id="dele2" name="dele2_${beans.reply_no }" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/delete.png?raw=true" width="15px" height="15px"/></button>
				</td>
            </tr>
         <input type="hidden" id="reply_no" name="reply_no" value="${beans.reply_no}">
         </c:forEach>
         </tbody>
      </table>
      <p></p>
      <input type="text" class="form-control" id="reply_content" name="reply_content">
      <button type="button" id="insert" class="btn btn-default"><img src="https://github.com/uniqueHRH/final/blob/master/project/src/main/webapp/imgs/insert.png?raw=true" width="30px" height="27px" style="vertical-align:30px;"/></button>
   </div>
      
</form>

<jsp:include page="/WEB-INF/socket.jsp"/>
<jsp:include page="/WEB-INF/footer.jsp"/>
<script type="text/javascript" src="${root }js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${root }js/bootstrap.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
		$('#subm').hide();
		$('#dele').hide();
		
		$('button[name^=cancel_').hide();
		$('button[name^=update_').hide();
		$('button[name^=edit_').hide();
		$('button[name^=dele2_').hide();
		
		// 이미지가 없을 때 출력되지 않도록
		var img=$('#hiddenI').val();
		var text='none.png';
		
		if(img.indexOf(text)!=-1) {
			$('#board_thumb').remove();
		}
		if(img=='') {
			$('#board_thumb').remove();
		}
      // 테마 출력
		var themeVal=$('#board_theme').val();
		var themeLength=themeVal.length;
		var themeSplit=themeVal.split(',');
      
		for(i=0; i<themeSplit.length; i++) {
			var themeFir=themeSplit[0];
			var themeSec=themeSplit[1];
			var themeThi=themeSplit[2];
			
			if(themeSec==undefined) {
				$('#board_theme1').val('#'+themeFir);
				$('#board_theme2').val('');
				$('#board_theme3').val('');
			} else if(themeThi==undefined) {
				$('#board_theme1').val('#'+themeFir);
				$('#board_theme2').val('#'+themeSec);
				$('#board_theme3').val('');
			} else {
				$('#board_theme1').val('#'+themeFir);
				$('#board_theme2').val('#'+themeSec);
				$('#board_theme3').val('#'+themeThi);
			}
		};
      
		// 작성자+관리자만 수정/삭제 가능
		var mas=$('#client_nick1').val();
		var log=$('#log').val();
		var repLog=$('input[name^=repId_').val();
		var staffLog=$('#staffLog').val();
		
		if(mas==log) {
			$('#subm').show();
			$('#dele').show();
		}
		if(staffLog) {
			$('#subm').show();
			$('#dele').show();
		}
		
		$('input[name^=repId').each(function() {
			var log=$('#log').val();
			var id=$(this).val();
			var num=$(this).attr('name');
			num=num.split('_');
			num=num[1];
			
			if(log==id) {
				$('button[name^=edit_'+num+']').show();
				$('button[name=dele2_'+num+']').show();
			} else if(staffLog) {
				$('button[name^=edit_'+num+']').show();
				$('button[name=dele2_'+num+']').show();
			}
		});
		
      // 수정버튼
      $('#subm').on('click',function() {
         location.href="../reviewUp/${bean.board_no}";
      });
      
      // 삭제버튼
		$('#dele').on('click',function() {
			var con=confirm('삭제하시겠습니까?');
			var replyCnt=$('#reply').length;
			
			if(con) {
				$.ajax({
	                  url:'../reviewDel',
	                  type:'POST',
	                  data:{key:$('input[type=hidden]').val()},
	                  success:function() {
	                      alert('삭제되었습니다');
	                      location.href="../review";
	                  },
	                  error:function() {
	                     alert('삭제에 실패했습니다');
	                  }
	            });
			}
		});
      
		// 목록버튼
		$('#goList').on('click',function() {
			location.href="../review";
		});
	      
		// 입력 버튼
		var log=$('#log').val();
		var staffLog=$('#staffLog').val();
		
		if(log) {
  			$('#reply_content').attr('disabled',false);
		} else if(staffLog) {
  			$('#reply_content').attr('disabled',false);
  		} else {
			$('#reply_content').val('로그인 후 이용이 가능합니다').attr('disabled',true);
			return false;
  		}
			
		$('#insert').on('click',function() {
			var text=$('#reply_content').val();
			var no=$('#board_no').val();
			var reply=$('#reply_content').val();
			
			if(!text) {
				alert('내용을 입력해주세요');
				return false;
				event.preventDefault();
			} else {
				$.ajax({
		            url:'../reviewRepIn',
		            type:'POST',
   		            cache:false,
		            data:{board_no:$('#board_no').val(), client_nick1:log, reply_content:reply},
		            success:function() {
		            	reload();
		            },
		            error:function() {
		               alert('다시 시도해주세요');
		            }
	         	});
			}
      	});
      
		// 댓글 수정버튼
		$('button[name^=edit]').on('click',function() {
     		var name=$(this).attr('name');
     		var num=name.replace('edit_','');   // 버튼의 값

     		$('button[name=edit_'+num+']').on('click',function() {
				$('input[name=reply_'+num+']').attr('disabled',false);
				$('button[name=edit_'+num+']').hide();
				$('button[name=dele2_'+num+']').hide();
				$('button[name=update_'+num+']').show();
				$('button[name^=cancel_'+num+']').show();
				$('button[name=cancel_'+num+']').on('click',function() {
					var con=confirm('수정을 취소하시겠습니까?');
					if(con) {
						reload();
					}
				});
				
				$('button[name=update_'+num+']').on('click',function() {
					var text=$('input[name=reply_'+num+']').val();
					var con=confirm('수정하시겠습니까?');
					
					if(con) {
						$.ajax({
				            url:'../reviewRepUp',
				            type:'POST',
				            data:{reply_no:num, reply_content:text},
				            success:function() {
				            	reload();
								alert('성공');
							},
							error:function() {
								alert('다시 시도해주세요');
							}
						});
					} 
				});
     		});
		});
      
      // 삭제버튼
     	$('button[name^=dele2]').on('click',function() {
     		var name=$(this).attr('name');
     		var num=name.replace('dele2_','');   // 버튼의 값
     		
     		$('button[name=dele2_'+num+']').on('click',function() {
     			var con=confirm('삭제하시겠습니까?');
     			
     			if(con) {
     				 $.ajax({
     		            url:'../reviewRepDel',
     		            type:'POST',
     		            cache:false,
     		            data:{key:num},
     		            success:function(obj) {
     		            	alert('삭제완료!');
     		            	reload();
     		            },
     		            error:function() {
     		               alert('다시 시도해주세요');
     		            }
     		         });
     			}
     		});
     	});
      
      function reload() {
    	  location.reload();
      }
      
      function time() {
    	  setTimeout('time()',2000);
      }
   });
   
</script>
</body>
</html>
