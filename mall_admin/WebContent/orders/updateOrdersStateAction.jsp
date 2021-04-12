<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*"%>
<%@ page import="gdu.mall.vo.*"%>
<%
	//관리자 인증 코드
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 1){
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return;
	}
	
	request.setCharacterEncoding("utf-8");
	
	OrdersAndEbookAndClient oec = new OrdersAndEbookAndClient();
	oec.orders = new Orders();
	
	oec.orders.setOrdersNo(Integer.parseInt(request.getParameter("ordersNo")));
	oec.orders.setOrdersState(request.getParameter("ordersState"));
	System.out.println("ordersNo : "+ oec.orders.getOrdersNo() + " ordersState : "+ oec.orders.getOrdersState()); //디버깅
	
	OrdersDao.updateOrdersState(oec);
	
	response.sendRedirect(request.getContextPath()  + "/orders/ordersList.jsp");
%>