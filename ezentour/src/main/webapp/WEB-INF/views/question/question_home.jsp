<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/header.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>EzenTour</title>

    <!-- Favicon -->
    <link rel="icon" href="${path}/resources/img/core-img/favicon.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/style.css">

</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- /Preloader -->

	<%@ include file="../include/menu.jsp" %>
	
	  <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(${path}/resources/img/bg-img/17.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcrumb-content text-center">
                        <h2 class="page-title">자유 게시판</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div> 
    <!-- Breadcrumb Area End -->
    
    <!-- Board Area Start -->
   <div class="ui middle aligned center aligned grid">
        <div class="column">
            <h2 class="ui teal image header">
                게시판 페이지
            </h2>
            <div class="ui large form">
                <div class="ui stacked segment">
                    
                    <table class="ui celled table">
                        <thead>
                            <tr>
                                <th>작성 번호</th>
                                <th>제목</th>
                                <th>등록자</th>
                                <th>등록일</th>
                            </tr>
                            <tr>
                            	<td>1</td>
                            	<td>게시판은 이렇게</td>
                            	<td>유상원</td>
                            	<td>2019.07.04</td>
                            </tr>
                        </thead>
                        <tbody id="list">
                        </tbody>
                    </table>
                </div>
                <div class="ui error message"></div>
				<div class="col-12" >
				<div class="welcome-text text-center">
				<a href="#" class="btn roberto-btn mt-30" data-animation="fadeInUp" data-delay="700ms">글쓰기</a>
				</div><br><br>
				</div><br><br>
            </div>
        </div>
    </div>
    		
    <!-- Board Area End -->
    
					
        <!-- **** All JS Files ***** -->
    <!-- jQuery 2.2.4 -->
    <script src="${path }/resources/js/jquery.min.js"></script>
    <!-- Popper -->
    <script src="${path }/resources/js/popper.min.js"></script>
    <!-- Bootstrap -->
    <script src="${path }/resources/js/bootstrap.min.js"></script>
    <!-- All Plugins -->
    <script src="${path }/resources/js/roberto.bundle.js"></script>
    <!-- Active -->
    <script src="${path }/resources/js/default-assets/active.js"></script>
    <script src="${path}/resources/js/jquery3.3.1.min.js"></script>
	<script src="${path}/resources/css/semantic.min.js"></script>
</body>
</html>