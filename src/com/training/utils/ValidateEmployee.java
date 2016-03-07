package com.training.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.training.utils.*;

public class ValidateEmployee {
	private Connection con;
	
	public ValidateEmployee() {
		super();
		// TODO Auto-generated constructor stub
		con = SqlConnection.getOracleConnection();
		System.out.println(con);
	}

	public boolean Validate(User usr){
		String sql = "SELECT * FROM employeerecord WHERE userid=? AND password=?";
		boolean check = false;
		try{
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, usr.getuserId());
			pstmt.setString(2, usr.getPassWord());
			ResultSet rs = pstmt.executeQuery();
			check = rs.next();
		} catch (Exception e){
			e.printStackTrace();
		}
		return check;
	}
}
