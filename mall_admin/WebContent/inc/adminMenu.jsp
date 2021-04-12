<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<ul id="sidebarnav" class="p-t-30">
    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/adminIndex.jsp" aria-expanded="false"><i class="mdi mdi-home"></i><span class="hide-menu">[운영자 홈]</span></a></li>
    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/manager/managerList.jsp" aria-expanded="false"><i class="mdi mdi-account-card-details"></i><span class="hide-menu">[운영자 관리]</span></a></li>
    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/client/clientList.jsp" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">[고객 관리]</span></a></li>
    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/category/categoryList.jsp" aria-expanded="false"><i class="mdi mdi-format-list-bulleted"></i><span class="hide-menu">[상품 카테고리 관리]</span></a></li>
    <li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/ebook/ebookList.jsp" aria-expanded="false"><i class="mdi mdi-book-open-page-variant"></i><span class="hide-menu">[ebook 관리]</span></a></li>
	<li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/orders/ordersList.jsp" aria-expanded="false"><i class="mdi mdi-briefcase-check"></i><span class="hide-menu">[주문 관리]</span></a></li>
	<li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/notice/noticeList.jsp" aria-expanded="false"><i class="mdi mdi-calendar-text"></i><span class="hide-menu">[공지사항 관리]</span></a></li>
	<li class="sidebar-item"><a class="sidebar-link waves-effect waves-dark sidebar-link" href="<%=request.getContextPath()%>/manager/logoutManagerAction.jsp" aria-expanded="false"><i class="mdi mdi-power"></i><span class="hide-menu">[로그아웃]</span></a></li>
</ul>