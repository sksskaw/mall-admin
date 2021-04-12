package gdu.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import gdu.mall.util.DBUtil;
import gdu.mall.vo.Category;

public class CategoryDao {
	
		//카테고리 Name 리스트 가져오기
		public static ArrayList<String> selectCategoryNameList() throws Exception {
			String sql = "SELECT category_name categoryName FROM category order by category_weight DESC, category_date ASC";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println("selectCategoryNameList stmt : "+stmt);
			
			ResultSet rs = stmt.executeQuery();
			ArrayList<String> list = new ArrayList<String>();
			
			while(rs.next()) {
				String str = "";
				str = rs.getString("categoryName");
				list.add(str);
			}
			return list;
		}
		
		// categoryName 중복체크 메서드
		public static String selectCategoryName(String categoryName) throws Exception {
			String sql = "SELECT category_Name categoryName FROM category WHERE category_Name = ?";
			
			String returnCategoryName = null;
			
			Connection conn = DBUtil.getConnection();
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println("selectCategoryName "+stmt);
			
			stmt.setString(1, categoryName);
			ResultSet rs = stmt.executeQuery();		
			if(rs.next()) {
				returnCategoryName = rs.getString("categoryName");
			}
			return returnCategoryName;
		}
	
		//카테고리 입력
		public static void insertCategory(String categoryName, int categoryWeight) throws Exception {
			String sql="INSERT INTO category(category_name, category_weight, category_date) VALUES(?,?,now())";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, categoryName);
			stmt.setInt(2, categoryWeight);
			System.out.println("insertCategory stmt : "+stmt);
			
			stmt.executeUpdate();
		}
	
		//카테고리 수정
		public static void updateCategory(int categoryWeight, String categoryName) throws Exception {
			String sql="UPDATE category SET category_weight =? WHERE category_name=?";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, categoryWeight);
			stmt.setString(2, categoryName);
			System.out.println("updateCategory stmt : "+stmt);
			
			stmt.executeUpdate();
		}

		//카테고리 삭제
		public static void deleteCategory(String categoryName) throws Exception {
			String sql="DELETE FROM category WHERE category_name =?";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, categoryName);
			System.out.println("deleteCategory stmt : "+stmt);
			
			stmt.executeUpdate();
		}
	
		//카테고리 리스트 가져오기
		public static ArrayList<Category> selectCategoryList() throws Exception {
			String sql = "SELECT category_name categoryName, category_weight categoryWeight, category_date categoryDate FROM category order by category_weight DESC, category_date ASC";
			
			Connection conn = DBUtil.getConnection();
			PreparedStatement stmt = conn.prepareStatement(sql);
			System.out.println("selectCategoryList stmt : "+stmt);
			
			ResultSet rs = stmt.executeQuery();
			ArrayList<Category> list = new ArrayList<Category>();
			
			while(rs.next()) {
				Category c = new Category();
				c.setCategoryName(rs.getString("categoryName"));
				c.setCategoryWeight(rs.getInt("categoryWeight"));
				c.setCategoryDate(rs.getString("categoryDate"));
				list.add(c);
			}
			return list;
		}
}
