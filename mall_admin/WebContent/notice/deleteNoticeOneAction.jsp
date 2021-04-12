<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="gdu.mall.dao.*" %>
<%@ page import="gdu.mall.vo.*" %>
<%@ page import="java.util.*" %>
<%
	// 관리자만 접근할 수 있게 하는 메소드 (level 2 이상만 공지 삭제 가능함)
	Manager manager = (Manager)session.getAttribute("sessionManager");
	if(manager == null || manager.getManagerLevel() < 2) {
		System.out.println("관리자 권한이 부족합니다. 상위 관리자에게 문의하세요");
		response.sendRedirect(request.getContextPath()+"/adminIndex.jsp");
		return; // 코드 실행 멈춤
	}
	
	// noticeOne에서 값 받아옴
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	// 디버깅
	System.out.println(noticeNo+"<-- deleteNoticeOneAction의 noticeNo");
	
	//댓글이 있는 공지글인지 질문?
	int rowCnt = CommentDao.selectCommentCnt(noticeNo);
	if(rowCnt > 0){// 댓글이 하나라도 있으면 공지글 삭제 불가
		System.out.println(noticeNo + " 공지글의 댓글이 " + rowCnt+"개 있습니다. 글을 삭제하시려면 댓글을 모두 지워주세요");
		response.sendRedirect(request.getContextPath()+"/notice/noticeOne.jsp?noticeNo=" + noticeNo);
		return;
	}
	
	// Dao 호출
	NoticeDao.deleteNoticeOne(noticeNo);
	
	// 공지 삭제 후 공지 목록으로 재요청
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>