<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="<%=request.getContextPath()%>/master/image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>adminIndex</title>
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/master/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/master/dist/css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<%	//로그인 정보 확인 세션 체크
	if(session.getAttribute("sessionManager") == null) {
		response.sendRedirect(request.getContextPath() + "/login.jsp");	
	} else {
		Manager manager = (Manager)(session.getAttribute("sessionManager"));
	
	
	ArrayList<Notice> noticeList = NoticeDao.selectNoticeListByPage(3, 0);
%>

    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin5">
                    <!-- This is for the sidebar toggle which is visible on mobile only -->
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/adminIndex.jsp">
                        <!-- Logo icon -->
                        <b class="logo-icon p-l-10">
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <img src="<%=request.getContextPath()%>/master/assets/images/logo-icon.png" alt="homepage" class="light-logo" />
                           
                        </b>
                        <!--End Logo icon -->
                         <!-- Logo text -->
                        <span class="logo-text">
                             <!-- dark Logo text -->
                             <img src="<%=request.getContextPath()%>/master/assets/images/logo-text.png" alt="homepage" class="light-logo" />
                            
                        </span>
                        <!-- Logo icon -->
                        <!-- <b class="logo-icon"> -->
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            <!-- Dark Logo icon -->
                            <!-- <img src="assets/images/logo-text.png" alt="homepage" class="light-logo" /> -->
                            
                        <!-- </b> -->
                        <!--End Logo icon -->
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Toggle which is visible on mobile only -->
                    <!-- ============================================================== -->
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i class="ti-more"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-left mr-auto">
                        <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>
                        <!-- ============================================================== -->
                        <!-- create new -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <span class="d-none d-md-block">Create New <i class="fa fa-angle-down"></i></span>
                             <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>   
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
                        <li class="nav-item search-box"> <a class="nav-link waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control" placeholder="Search &amp; enter"> <a class="srh-btn"><i class="ti-close"></i></a>
                            </form>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav float-right">
                        <!-- ============================================================== -->
                        <!-- Comment -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>
                            </a>
                             <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- End Comment -->
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        <!-- Messages -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" id="2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="font-24 mdi mdi-comment-processing"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown" aria-labelledby="2">
                                <ul class="list-style-none">
                                    <li>
                                        <div class="">
                                             <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-success btn-circle"><i class="ti-calendar"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Event today</h5> 
                                                        <span class="mail-desc">Just a reminder that event</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-info btn-circle"><i class="ti-settings"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Settings</h5> 
                                                        <span class="mail-desc">You can customize this template</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-primary btn-circle"><i class="ti-user"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Pavan kumar</h5> 
                                                        <span class="mail-desc">Just see the my admin!</span> 
                                                    </div>
                                                </div>
                                            </a>
                                            <!-- Message -->
                                            <a href="javascript:void(0)" class="link border-top">
                                                <div class="d-flex no-block align-items-center p-10">
                                                    <span class="btn btn-danger btn-circle"><i class="fa fa-link"></i></span>
                                                    <div class="m-l-10">
                                                        <h5 class="m-b-0">Luanch Admin</h5> 
                                                        <span class="mail-desc">Just see the my new admin!</span> 
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- End Messages -->
                        <!-- ============================================================== -->

                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="<%=request.getContextPath()%>/master/assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>
                            <div class="dropdown-menu dropdown-menu-right user-dd animated">
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="javascript:void(0)"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                                <div class="dropdown-divider"></div>
                                <div class="p-l-30 p-10"><a href="javascript:void(0)" class="btn btn-sm btn-success btn-rounded">View Profile</a></div>
                            </div>
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin5">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
					<!-- 관리자 화면 메뉴(네비게이션) include -->
					<div>
						<jsp:include page="/inc/adminMenu.jsp"></jsp:include>
					</div>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
             <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-12 d-flex no-block align-items-center">
                        <h4 class="page-title">운영자 홈</h4>
                        <div class="ml-auto text-right">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Waiting list for approval</h4>
                            </div>
                            <div class="comment-widgets scrollable">
                            <%
								ArrayList<Manager> managerList = ManagerDao.selectManagerListByZero();
								for(Manager m : managerList){
							%>
							<!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="<%=request.getContextPath()%>/master/assets/images/users/1.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">manager_id : <%=m.getManagerId()%></h6>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">가입일 : <%=m.getManagerDate().substring(0, 10)%></span> 
                                         	<form action="<%=request.getContextPath()%>/manager/updateManagerLevelAction.jsp" method="post">
												<input type="hidden" name="managerNo" value="<%=m.getManagerNo()%>">
												<select name="managerLevel">
													<%
														for(int i=0; i<3; i++){
															if(m.getManagerLevel() == i){
															%>
																<option value="<%=i%>" selected="selected"><%=i%></option>
															<%
															} else {
															%>
																<option value="<%=i%>"><%=i%></option>
															<%
															}
														}
														%>
												</select>
												<button class="btn btn-success btn-sm">수정</button>
											</form>
                                        </div>
                                    </div>
                                </div>
							<%
								}
							%>                  
                                
                            </div>
                        </div>
                        <!-- card new -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title m-b-0">Notice</h4>
                            </div>
                            <ul class="list-style-none">
                            	<%
									for(Notice n : noticeList) { // for each문
								%>
                                <li class="d-flex no-block card-body">
                                    <i class="fa fa-check-circle w-30px m-t-5"></i>
                                    <div>
                                        <a href="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>" class="m-b-0 font-medium p-0"><%=n.getNoticeTitle()%></a>
                                        <span class="text-muted">작성자 <%=n.getManagerId()%></span>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="tetx-right">
                                            <h5 class="text-muted m-b-0"><%=n.getNoticeDate().substring(0,11)%></h5>
                                            <span class="text-muted font-16"></span>
                                        </div>
                                    </div>
                                </li>
                               	<%
									}
								%>
                            </ul>
                        </div>
                    </div>
                    <!-- column -->

                    <div class="col-lg-6">
                        <!-- card -->
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Login user information</h4>
                            </div>
                            <div class="comment-widgets scrollable" style="max-height: 130px;">
                                <!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="<%=request.getContextPath()%>/master/assets/images/users/2.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium"><%=manager.getManagerId()%></h6>
                                        <span class="m-b-15 d-block"><%=manager.getManagerName()%>님 환영합니다. 관리자 레벨 <%=manager.getManagerLevel()%></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">오늘 들어온 책</h4>
                            </div>
                            <div class="comment-widgets scrollable">
                            <%
								ArrayList<Ebook> ebookList = EbookDao.selectTodayInsertList();
								for(Ebook e : ebookList){
							%>
							<!-- Comment Row -->
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="<%=request.getContextPath()%>/img/<%=e.getEbookImg()%>" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">제목 : <%=e.getEbookTitle()%> 저자 : <%=e.getEbookAuthor()%></h6>
                                        <h6 class="font-medium">카테고리 : <%=e.getCategoryName()%> &nbsp;&nbsp;출판사 : <%=e.getEbookCompany()%></h6>
                                        <h6 class="font-medium">가격 : <%=e.getEbookPrice()%> 원</h6>
                                    </div>
                                </div>
							<%
								}
							%>                  
                                
                            </div>
                        </div>
                        
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Matrix-admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
<%		
	}
%>	

    <script src="<%=request.getContextPath()%>/master/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath()%>/master/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/extra-libs/sparkline/sparkline.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath()%>/master/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath()%>/master/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath()%>/master/dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <!-- <script src="dist/js/pages/dashboards/dashboard1.js"></script> -->
    <!-- Charts js Files -->
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/excanvas.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/jquery.flot.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="<%=request.getContextPath()%>/master/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="<%=request.getContextPath()%>/master/dist/js/pages/chart/chart-page-init.js"></script>
</body>
</html>