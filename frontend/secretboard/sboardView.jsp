<%@page import="java.util.List"%>
<%@page import="vo.SboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<!-- board의 session -->
<% List<SboardVO> sbList = (List<SboardVO>)session.getAttribute("sbList"); %>
<% String memId = (String)session.getAttribute("mem_id"); %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/mainStyle.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sboardStyle.css">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="<%=request.getContextPath() %>/js/sbView.js"></script>

<script>
boardId = `<%=sbList.get(0).getSboard_id() %>`;
memId = `<%=memId%>`;
mypath = `<%=request.getContextPath() %>`;
$(function(){
	// 이미지 보여지는 부분
	imageView();
	
	// 좋아요 처리부분
	viewLikeOrUnlikeClick()
	
	// 모든 상태를 가져오는 함수
	viewState();
	
	// 신고 처리하는 함수
	sboardNotify();
	
	$('#delete').on('click', function(){
		if(confirm('정말 삭제하시겠습니까?')){ // 확인누르면 true반환 취소 누르면 false반환
			location.href="<%=request.getContextPath()%>/SboardDelete.do?sbId=<%=sbList.get(0).getSboard_id()%>";
		}
	})
	
	$('#modify').on('click', function(){
			location.href="<%=request.getContextPath()%>/secretboard/sboardUpdate.jsp";
	})
	
	<%if(sbList.get(0).getSboard_mdate() != null ){ %>
		mdate = "<%=sbList.get(0).getSboard_mdate() %>"
		dateView = elapsedTimeModify(mdate);
		console.log(dateView)
		$('.mDate').append(dateView);
	<%} %>

})

function imageView(){
	<%
	for(SboardVO vo : sbList){
	%>
		if("<%= vo.getSimg_origin_name()%>" != "null"){
			
		code = `<img src="<%=request.getContextPath()%>/SimageSrcView.do?imgName=<%=vo.getSimg_save_name()%>">`;
	 		$('.mem_img').append(code);
		}		
	<%
	}
	%>
	
}
	

</script>
</head>
<body>
<%@ include file="/module/header.jsp" %>
<h1><%=memId%></h1>
<div class="mem_sboard">
	<div class="mem_header">
		<input type="button" id="modify" value="수정">
		<input type="button" id="delete" value="삭제">
	</div>
	
	<div class="mem_top">
		<img src="<%=request.getContextPath()%>/images/기본프로필.png">
		<p class="m_writer">익명</p>
		<p class="m_date"><%= sbList.get(0).getSboard_cdate() %></p>
	</div>
	
	<div class="mem_img">
	</div>
	
	<div class="mem_title">
		<div class="mem_t">
			<%=sbList.get(0).getSboard_title() %>
		</div>
	</div>
	
	<div class="mem_content">
		<div class="mem_ct">
			<%=sbList.get(0).getSboard_content() %>
		</div>
		<br>

	</div>
	
	<div class="mDate">
		
	</div>
	<div class="mem_btns">
		<div class="m_hit">
			<img id="mHit" src="<%=request.getContextPath()%>/images/조회수.png">
			<p id="htext"></p>
		</div>
		<div class="m_like">
			<img id="mLike" src="<%=request.getContextPath()%>/images/좋아요-체크안함.png">
			<p id="lktext"></p>
		</div>
		<div class="m_unlike">
			<img id="mUnlike" src="<%=request.getContextPath()%>/images/싫어요-체크안함.png">
			<p id="untext"></p>
		</div>
		<div class="m_notify">
			<img id="mNotify" src="<%=request.getContextPath()%>/images/신고-체크안함.png">
		</div>
	</div>

</div>
	
 <%@ include file="/module/footer.jsp" %>		
</body>
</html>



