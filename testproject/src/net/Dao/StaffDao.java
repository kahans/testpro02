package net.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import net.Dto.StaffDto;


public class StaffDao {
	DataSource ds;
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/dev22db07?useUnicode=true&characterEncoding=euckr";
	private final String username = "dev22id07";
	private final String password = "dev22pw07";

	
	
	
	//insert staff 등록
	public int insertStaff(StaffDto staff){
		int count = 0;
		
		try{
			conn=this.getConnection();
			String sql = "INSERT INTO staff(name, sn, graduateday,schoono,religionno) values(?,?,?,?,?)";
			
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, staff.getName());
			stmt.setString(2, staff.getSn());
			stmt.setString(3, staff.getGraduateday());
			stmt.setString(4, staff.getSchoolNo());
			stmt.setString(5, staff.getReligionNo());
			count=stmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, null);
		}
		System.out.println(count+"dao.java 확인 지나 갔는지?");
		return count;
		
	}
	private Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName(driverClassName);
		conn = DriverManager.getConnection(url, username, password);
		System.out.println("드라이버 연결");
		return conn;
	}

	private void close(Connection conn, Statement stmt, ResultSet rs) {
		if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		if (stmt != null) {try {stmt.close();} catch (SQLException e) {e.printStackTrace();}}

	}
	
}
