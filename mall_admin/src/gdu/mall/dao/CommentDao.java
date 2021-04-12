package gdu.mall.dao;
import java.sql.*;
import java.util.ArrayList;

import gdu.mall.util.*;
import gdu.mall.vo.*;

public class CommentDao {
	
	public static int selectCommentCnt(int noticeNo) throws Exception {
		int cnt = 0;
		String sql="select count(*) from comment where notice_no=?";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeNo);
		System.out.println("selectCommentCnt " + stmt); // 디버깅
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			cnt = rs.getInt("count(*)");
		}
		return cnt;
	}
	
	public static void insertComment(Comment comment) throws Exception {
		String sql = "INSERT INTO comment (notice_no, manager_id, comment_content, comment_date) VALUES (?, ?, ?, NOW())";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, comment.getNoticeNo());
		stmt.setString(2, comment.getManagerId());
		stmt.setString(3, comment.getCommentContent());
		System.out.println("insertComment " + stmt); // 디버깅
		
		stmt.executeUpdate();
	}
	
	public static ArrayList<Comment> selectCommentListByNoticeNo(int noticeNo) throws Exception {
		String sql = "select * from comment where notice_no=? order by comment_date DESC";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, noticeNo);
		System.out.println("selectCommentListByNoticeNo " + stmt); // 디버깅
		
		ResultSet rs = stmt.executeQuery();
		ArrayList<Comment> list = new ArrayList<Comment>();
		
		while(rs.next()) {
			Comment c = new Comment();
			c.setCommentNo(rs.getInt("comment_no"));
			c.setNoticeNo(rs.getInt("notice_no"));
			c.setManagerId(rs.getString("manager_id"));
			c.setCommentContent(rs.getString("comment_content"));
			c.setCommentDate(rs.getString("comment_date"));
			list.add(c);
		}
		return list;
	}
	
	// 관리자 레벨 2로 접근했을 경우 레벨2는 다 지울 수 있는 권한
	public static void deleteComment(int commentNo) throws Exception {
		String sql = "delete from comment where comment_no=?";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, commentNo);
		System.out.println("deleteComment " + stmt); // 디버깅
		
		stmt.executeUpdate();
	}
	
	// 관리자 레벨 1인경우 자기가 작성한 것만 지울 수 있다.
	public static void deleteComment(int commentNo, String managerId) throws Exception {
		String sql = "delete from comment where comment_no=? and manager_id=?";
		
		//DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, commentNo);
		stmt.setString(2, managerId);
		System.out.println("deleteComment " + stmt); // 디버깅
		
		stmt.executeUpdate();
	}
}
