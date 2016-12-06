package net.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.sql.DataSource;

import net.Dto.ReligionDto;

public class ReligionDao {
	DataSource ds;
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	ReligionDto sDto= new ReligionDto();
	
	private final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://localhost:3306/dev22db07?useUnicode=true&characterEncoding=euckr";
	private final String username = "dev22id07";
	private final String password = "dev22pw07";
	
	public ArrayList<ReligionDto> searchReligion(){
		ArrayList<ReligionDto> list = new ArrayList<ReligionDto>();
		try{
			conn=this.getConnection();
			String sql = "select * from religion ORDER BY no asc";
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next()){
				sDto= new ReligionDto();
				sDto.setNo(rs.getInt("no"));
				sDto.setRlName(rs.getString("name"));
				list.add(sDto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.close(conn, stmt, rs);
		}
		
		return list;
		
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
