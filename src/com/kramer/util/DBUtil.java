package com.kramer.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import com.kramer.entity.Chapter;
import com.kramer.entity.EBook;

public class DBUtil {
	private static final String USER = "root";
	private static final String PASSWROD = "root";
	private static final String URL = "jdbc:mysql://localhost:3306/read";
	private static final ThreadLocal<Connection> THREAD_LOCAL = new ThreadLocal<Connection>();

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 返回connection
	 * 
	 * @return
	 */
	static public Connection getConnection() throws SQLException {
		Connection connection = THREAD_LOCAL.get();
		if (connection == null || connection.isClosed()) {
			connection = DriverManager.getConnection(URL, USER, PASSWROD);
			THREAD_LOCAL.set(connection);
		}
		return connection;
	}

	public static void closeConnection() throws SQLException {
		Connection connection = THREAD_LOCAL.get();
		if (connection != null && !connection.isClosed()) {
			connection.close();
		}
	}

	/**
	 * 转换utilDate为sqlDate
	 * 
	 * @param d
	 * @return
	 */
	public static java.sql.Date toSqlDate(java.util.Date d) {
		return new java.sql.Date(d.getTime());
	}

	public static String uuid() {
		String uuid = UUID.randomUUID().toString();
		char[] cs = new char[32];
		int j = 0;
		for (int i = uuid.length(); i-- > 0;) {
			if (uuid.charAt(i) != '-') {
				cs[j++] = uuid.charAt(i);
			}
		}
		return new String(cs);
	}
	
	public static void clearAllSqlDataOfBook() throws SQLException{
		Connection connection = getConnection();
		StringBuffer sqlChapter = new StringBuffer();
		sqlChapter.append(" delete from ").append(Chapter.TABLE_NAME);
		StringBuffer sqlEBook = new StringBuffer();
		sqlEBook.append(" delete from ").append(EBook.TABLE_NAME);
		PreparedStatement ps = connection.prepareStatement(sqlChapter.toString());
		ps.executeUpdate();
		ps = connection.prepareStatement(sqlEBook.toString());
		ps.executeUpdate();
	}
	
	
	
}
