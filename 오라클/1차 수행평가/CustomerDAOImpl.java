package FirstExam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAOImpl implements CustomerDAO{
	public int insert(CustomerDTO customer) {
		System.out.println("dto사용 메소드:"+customer);
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "insert into customer values(?,?,?,sysdate,1000,?)";
		int result = 0; 
		try {
			con = DBUtill.getConnect();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, customer.getId());
			stmt.setString(2, customer.getPass());
			stmt.setString(3, customer.getName());
			stmt.setString(4, customer.getAddr());
			result = stmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtill.close(null, stmt, con);
		}
		return result; 
	}
	
	public int delete(String id) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "delete customer where id = ?";
		int result = 0;
		try {
			con = DBUtill.getConnect();
			stmt = con.prepareStatement(sql);
			
			stmt.setString(1, id);
			
			result = stmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println("연결 실패"+e.getMessage());
		}finally {
			DBUtill.close(null, stmt, con);
		}
		return result;

	}
	public int update(String id, String addr) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("update customer ");
		sql.append("set addr = ? ");
		sql.append("where id = ? ");
		int result = 0;
		try {
			con = DBUtill.getConnect();
			stmt = con.prepareStatement(sql.toString());
			
			stmt.setString(1, addr);
			stmt.setString(2, id);
			
			result = stmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtill.close(null, stmt, con);
		}
		return result;
	}
}
