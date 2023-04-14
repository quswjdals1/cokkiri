<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.4.min.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
<script type="text/javascript">
Kakao.init('9356f76605d93d198112a946e2890199'); // 사용하려는 앱의 JavaScript 키 입력
$(function() {	
	$('.loginbutton').on('click', function() {
		var id = $('.id').val().trim();
		var pw = $('.pw').val().trim();
		
		// Ajax 요청
		$.ajax({
			url : '<%=request.getContextPath()%>/memberLogin.do',
			type : 'post',
			data : {"id" : id, 
					"pw" : pw},
			success : function(res){
				if(res.result == "true"){
					if(id=="admin"){
						alert("관리자 페이지로 이동 슝");
						//window.location.href="";
					} else {
						window.location.href="<%=request.getContextPath()%>/home/main.jsp";
					}
				} else {
					alert("아이디 또는 비밀번호가 다릅니다.");
				}
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
		
	})
	
	
})

</script>
<link rel="stylesheet" type="text/css" href="../css/loginform.css">
<style type="text/css">
@font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

.logintoptest {
	margin-left: 3px;
	margin-right: 3px;
	margin-bottom: 5px;
}

.logontext{
	font-size: 18px;
	font-weight: 700;
}

.findpassword{
	font-size: 12px;
	font-weight: 700;
	float : right;
	margin-top: 3px;
	opacity: 0.5;
}

form {
	margin-top: 9px;
}

button:active {
	outline: none;
	box-shadow: none;
}

.iddiv input,.passdiv input,.loginbuttondiv button{
	height: 44px;
	width: 100%;
	padding : 10px 14px;
	font-size: 16px;
	font-weight: 400;
	box-sizing: border-box;
}

.loginbox input::placeholder {
	color : rgb(199, 199, 204);
}

.iddiv input{
	width : 100%;
	border : 2px solid rgb(229, 229, 234);
	border-radius: 10px 10px 0px 0px;
	
}
.passdiv input{
	border-radius: 0px 0px 10px 10px;
	border : 2px solid rgb(229, 229, 234);
	border-top: 0px;
}

.loginbuttondiv button {
	margin-top : 9px;
	width : 100%;
	background : rgb(56, 102, 223);
	border-radius: 10px;
	color : white;
	border: none;
}

.loginother {
	margin-top: 30px;
}

.loginother p,.loginother ul{
	margin: 0;
}

.loginother p{
	display: inline-block;
	font-size: 12px;
	font-weight: 700;
	padding-top: 14px;
	float: left;
	opacity: 0.5;
}

.loginother{
	width : 100%;
}

.loginother ul {
	list-style: none;
	float: right;
}

.loginother ul li img{
	display : inline-block;
	width : 38px;
}

input:focus {outline:none;}
</style>
</head>
<body>

<div class="root">

<nav>
	<img src="../images/코끼리로고심볼가로.png" id="cokkirilogo">
	<input type="button" value="회원가입" id="memUpdate" onclick="location.href='<%=request.getContextPath() %>/login/memUpdate.jsp'">
</nav>
<div class="main">
	<div class="loginbox">
		<div class="logintoptest">
			<span class="logontext">로그인</span>
			<a class="findpassword">아이디</a>
		</div>
			<div class="iddiv">
				<input type="text" name="id" placeholder="아이디" class="id">
			</div>
			<div class="passdiv">
				<input type="password" name="pw" placeholder="비밀번호" class="pw">
			</div>
			<div class="loginbuttondiv">
				<button type="submit" class="loginbutton">로그인</button>
			</div>
		<div class="loginother">
			<p>다른 방법으로 로그인하기</p>
			<ul>
				<li><a type="button" class="kakaoimg" id="kakaoLoginBtn"><img src="../images/카카오톡동그란로고.png"></a></li>
			</ul>
		</div>
	</div>
</div>
<footer>
	<p>Copyright© Cokkiri(주) All rights reserved.</p>
	
</footer>
</div>
</body>
</html>