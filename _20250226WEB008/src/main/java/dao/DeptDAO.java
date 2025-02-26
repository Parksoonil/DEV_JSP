package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dto.DeptDTO;

public class DeptDAO {
	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/spring5fs?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	private static final String USER = "root";
	private static final String PASS = "1234";

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rset;

	public void connect() {
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
			if(conn != null) {
				System.out.println("DB 연결 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<DeptDTO> selectAll() {
		ArrayList<DeptDTO> list = new ArrayList<>();
		try {
			connect();
			String sql = "select * from dept";
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				DeptDTO deptDTO = new DeptDTO(rset.getInt("deptno"), rset.getString("dname"), rset.getString("loc"));
				list.add(deptDTO);
				//System.out.print(rset.getString(1));
				//System.out.print(rset.getString(1));
				//System.out.println(rset.getString(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
