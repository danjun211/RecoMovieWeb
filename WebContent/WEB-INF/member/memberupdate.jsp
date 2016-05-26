<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page   import="java.util.*, com.entity.MemberEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty me}">
	<c:redirect url="/index.html"/>
</c:if>
<c:if test="${!empty me}">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Movie - kitri 4조 web프로젝트!</title>

<!-- Swiper CSS -->
<link rel="stylesheet" href="assets/css/swiper.min.css">

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/ourstyle.css" rel="stylesheet">
<link href="css/mypage.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="js/sessionCheck.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

   <!-- 입력 규칙 설정 -->
	<script type="text/javascript">
   var httpRequest = null;

   function createXMLHttpRequest() {
      //브라우저 셋팅
      if (window.XMLHttpRequest) {
         httpRequest = new XMLHttpRequest();
      } else {
         return null;
      }
   }

   function checkUpdatStat(){
      var id=document.getElementById("inputId").value;
      var cpw=document.getElementById("inputcurrentPw").value;
      var npw=document.getElementById("inputnewPw").value;
      var chkpw=document.getElementById("inputPwchk").value;
      var name=document.getElementById("inputName").value;
      var birth=document.getElementById("inputBirth").value;
      var addr=document.getElementById("roadAddress").value;
      var tel=document.getElementById("telname").value;
      var email=document.getElementById("emailname").value;
      // 필수 입력 요소 체크
	   if(cpw==""){
         alert("현재 비밀번호를 입력하여 주십시오.");
         event.preventDefault();
      } else if(npw!=chkpw){
         alert("비밀번호가 일치하지 않습니다.");
         event.preventDefault();
      }else if(!fnCheckPassword(id, npw)){
   	   event.preventDefault();
      } else if(addr==""){
         alert("주소를 입력하여 주십시오.");
         event.preventDefault();
      } else if(tel==""){
         alert("전화번호를 입력하여 주십시오.");
         event.preventDefault();
      } else if(email==""){
         alert("이메일을 입력하여 주십시오.");
         event.preventDefault();
      } else {
   	   var registForm = document.memberUpdatForm; 
   	   registForm.submit();
      }
   }

   function fnCheckPassword(uid, upw)
   {
       if(!/^[a-zA-Z0-9]{8,20}$/.test(upw))
       { 
           alert('비밀번호는 숫자와 영문자 조합으로 8~12자리를 사용해야 합니다.'); 
           return false;
       }
     
       var chk_num = upw.search(/[0-9]/g); 
       var chk_eng = upw.search(/[a-z]/ig);
       if(chk_num < 0 || chk_eng < 0)
       { 
           alert('비밀번호는 숫자와 영문자를 혼용하여야 합니다.'); 
           return false;
       }
       
       if(/(\w)\1\1\1/.test(upw))
       {
           alert('비밀번호에 같은 문자를 4번 이상 사용하실 수 없습니다.'); 
           return false;
       }
       if(upw.search(uid)>-1)
       {
           alert('ID가 포함된 비밀번호는 사용하실 수 없습니다.'); 
           return false;
       }

       return true;
   }

   $(document).ready(function(){
      /* 회원 탈퇴 이벤트 */
      $("#memberdelete").click(function(){
         var memberno=$("#myNo").attr("value");
         var q1 = confirm("정말 탈퇴하시겠습니까?");
         if (q1==true){
            var q2 =   confirm("진짜죠?");
            if(q2==true){
               $.post("memberdelete.do",
                     {
                        no: memberno
                     },
                     function(data, status){
                        alert("탈퇴하셨습니다. 또 오세요.");
               });
            }
         }
      });
   })
   </script>

   <style type="text/css">
      #wrapper{
         height: 100%;
         margin-top: 100px;
      }
      
     .nav li{
       letter-spacing: 5px;
      }
   </style>
</head>

<body id="page-top" class="index">
 <!-- ******************************************************************************** -->
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" style="padding:15px; background:#111; ">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="index.html">Movie</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li id="navbar-item1"> </li>
                    <li id="navbar-item2"> </li>
                    <li id="navbar-item3"> </li>  
                    <li id="navbar-item4"> </li>
                    <li id="navbar-item5"> </li>
                    <li id="navbar-item6"> </li>
                    <li id="navbar-item7"> </li>
                    <li id="navbar-item8"> </li>
                    <li>
                       <form id="searchform" class="input-append" method="GET" style="margin-top:12px;">
                          <div class="input-group">
                             <input id="moviename" type="text" title="Enter keyword(s) to find" name="kw" class="span2" maxlength="40" style="background-color: #163240;color: white;">
                             <button id="searchbtn" type="button" class="btn" data-toggle="modal" data-target="#searchModal">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                             </button>
                          </div>
                       </form>
                    </li>

                </ul>
                <ul class="nav pull-right">
                
                 </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

<!-- ******************************************************************************** -->
<div id="wrapper">
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-2"></div>

			<div class="col-sm-8 text-center" style="
			    font-weight: 600;
			    font-size: 18px;
			">
				<ul class="nav nav-pills nav-stacked">
					<li><a href="mybookingstat.do">내 예약 정보</a></li>
					<li class="active"><a href="memberupdate.do">회원정보수정</a></li>
					<li>
						<input id="myNo" type="hidden" value=${me.memberno}>
						<a id="memberdelete">회원탈퇴</a></li>
				</ul>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
<!-- ******************************************************************************** -->
   <div id="contents" style="margin-top: 20px;">
      <div class="row">
         <div class="col-sm-2"></div>
         <div class="col-sm-8">
            <form class="form-horizontal" name="memberUpdatForm" action="updateproc.do" method="post">
               <input type="hidden" name="no" value=${me.memberno} />
               <div class="form-group">
                  <label for="inputId" class="col-sm-3 control-label">아이디</label>
                  <div class="col-sm-8">
                     <input type="text" name="id" class="form-control" id="inputId"
                        placeholder="아이디" readonly value=${me.id} />
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputcurrentPw" class="col-sm-3 control-label">현재 비밀번호</label>
                  <div class="col-sm-8">
                     <input type="password" name="currentpw" class="form-control"
                        id="inputcurrentPw" placeholder="현재 비밀번호">
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputnewPw" class="col-sm-3 control-label">새 비밀번호</label>
                  <div class="col-sm-8">
                     <input type="password" name="newpw" class="form-control"
                        id="inputnewPw" placeholder="새 비밀번호">
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputPwchk" class="col-sm-3 control-label">비밀번호확인</label>
                  <div class="col-sm-8">
                     <input type="password" name="pwchk" class="form-control"
                        id="inputPwchk" placeholder="비밀번호확인">
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputName" class="col-sm-3 control-label">이름</label>
                  <div class="col-sm-8">
                     <input type="text" name="name" class="form-control"
                        id="inputName" placeholder="이름" readonly
                        value=${me.name}>
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputName" class="col-sm-3 control-label">성별</label>
                  <div class="col-sm-8">
                     <input type="text" name="sex" class="form-control" id="inputSex"
                        placeholder="성별" readonly
                        value=${me.sex}>
                  </div>
               </div>
     		 <div class="form-group"  ng-hide="hideformobile">
                      <div class="col-sm-2 text-right">
                        <label for="inputBirth" class="control-label">생년월일</label>
                      </div>
                        <div class="col-sm-5 input-append datepicker">
                         <input type="date" id="inputBirth" name="birth" readonly value=${me.birth} class="form-control">
                        </div>                      
                    </div>
               <div class="form-group">
                  <label for="inputName" class="col-sm-3 control-label">주소</label>
                  <div class="col-sm-8">
                     <div class="row">
                        <div class="col-sm-6">
                           <input type="text" name="postcode" class="form-control"
                              id="postcode" placeholder="우편번호">
                        </div>
                        <div class="col-sm-6">
                           <input type="button" class="form-control" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-sm-12">
                           <input type="text" name="addr" class="form-control"
                              id="roadAddress" placeholder="도로명주소"
                              value=${me.addr}>
                        </div>
                     </div>
                     <span id="guide" style="color: #999"></span>
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputName" class="col-sm-3 control-label">전화번호</label>
                  <div class="col-sm-8">
                     <input type="tel" name="tel" class="form-control" id="telname"
                        placeholder="전화번호" value=${me.tel}>
                  </div>
               </div>
               <div class="form-group">
                  <label for="inputName" class="col-sm-3 control-label">이메일</label>
                  <div class="col-sm-8">
                     <input type="text" name="email" class="form-control"
                        id="emailname" placeholder="이메일" value=${me.email}>
                  </div>
               </div>
               <div class="form-group">
                  <div class="col-sm-10 col-sm-offset-1">
                     <input type="button" class="form-control" value="확인" onclick="checkUpdatStat()"/>
                  </div>
               </div>
            </form>
         </div>
         <div class="col-sm-2"></div>
      </div>
   </div>
</div>
<!-- ************************************************************************************ -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2014</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>

<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>
</html>
</c:if>
