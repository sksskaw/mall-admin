package gdu.mall.dao;
import java.sql.*;
import java.util.*;
import gdu.mall.util.*;
import gdu.mall.vo.*;

public class OrdersDao {
	
	//주문 상태 변경
	public static void updateOrdersState(OrdersAndEbookAndClient oec) throws Exception {
		String sql = "UPDATE orders SET orders_state=? WHERE orders_no = ?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, oec.orders.getOrdersState());
		stmt.setInt(2, oec.orders.getOrdersNo());
		System.out.println("updateOrdersState "+stmt);
		
		stmt.executeUpdate();
	}
	
	//total count
	public static int totalCount() throws Exception {
		// 변수 초기화
		int totalRow = 0;
		
		// 쿼리 작성
		String sql = "SELECT COUNT(*) cnt FROM orders";
		
		// DB 연결
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		System.out.println(stmt + " <-- OrdersDao totalcount의 stmt"); // 디버깅
		ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				totalRow = rs.getInt("cnt");
		}
		
		// 리턴값
		return totalRow;
	}
	//orders join ebook join client 리스트
	public static ArrayList<OrdersAndEbookAndClient> ordersList(int rowPerPage, int beginRow) throws Exception {
		String sql="SELECT o.orders_no, o.ebook_no, e.ebook_title, o.client_no, c.client_mail, o.orders_date, o.orders_state FROM ebook e, orders o, client c WHERE o.ebook_no = e.ebook_no AND o.client_no = c.client_no ORDER BY o.orders_no desc limit ?, ?";
		ArrayList<OrdersAndEbookAndClient> list = new ArrayList<>();
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndEbookAndClient oec = new OrdersAndEbookAndClient();
			Orders o = new Orders();
			Ebook e = new Ebook();
			Client c = new Client();
			
			o.setOrdersNo(rs.getInt("orders_no"));
			o.setEbookNo(rs.getInt("ebook_no"));
			o.setClientNo(rs.getInt("client_no"));
			o.setOrdersDate(rs.getString("orders_date"));
			o.setOrdersState(rs.getString("orders_state"));
			
			e.setEbookTitle(rs.getString("ebook_title"));
			c.setClientMail(rs.getString("client_mail"));
			
			oec.orders = o;
			oec.ebook = e;
			oec.client = c;
			
			list.add(oec);
		}
		return list;
	}
}
