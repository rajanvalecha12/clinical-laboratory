package com.training.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class SqlConnection {

	public static Connection getOracleConnection(){
			
			Connection con=null;
			
			try {
				
				Properties props=new Properties();
				
				 //FileReader reader =new FileReader(new File("DbConnection.properties"));
				 InputStream reader=Thread.currentThread().getContextClassLoader().getResourceAsStream("DbConnection.properties");
				 System.out.println("-------------------"+reader);
				 props.load(reader);
				 
					Class.forName(props.getProperty("db.className"));
				
					con = DriverManager.getConnection(props.getProperty("db.databaseURL"),props.getProperty("db.userName"),props.getProperty("db.passWord"));
				

			} catch (Exception e) {
				
				e.printStackTrace();
			}
			
			return con;
			
		}
		
	}
