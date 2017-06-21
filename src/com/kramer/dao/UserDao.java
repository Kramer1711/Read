package com.kramer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kramer.entity.User;
import com.kramer.util.DBUtil;


public class UserDao {
	public void insert(User user) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 3sql语句的构建
		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + User.TABLE_NAME).append("(username,password,name,sex,email)")
				.append("values")
				.append(" (?,?,?,?,?	)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		
		
		int i = 1;
		ps.setString(i++, user.getUsername());
		ps.setString(i++, user.getPassword());
		ps.setString(i++, user.getName());
		ps.setString(i++, user.getSex());
		ps.setString(i++, user.getEmail());
		// 执行
		ps.executeUpdate();// 增删改
	}

	public void delete(String username) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + User.TABLE_NAME + " where " + User.USERNAME + "=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, username);
		ps.executeUpdate();
	}

	/**
	 * @param user
	 * @throws Exception
	 */
	public void update(User user) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("update " + User.TABLE_NAME)
				.append(" set password=?,name=?,sex=?,email=?")
				.append(" where username=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, user.getPassword());
		ps.setString(i++, user.getName());
		ps.setString(i++, user.getSex());
		ps.setString(i++, user.getUsername());
		ps.setString(i++, user.getEmail());
		ps.executeUpdate();
	}

	/**
	 * 通过id查找职工帐号信息
	 * 
	 * @param id
	 * @return 职工帐号信息
	 * @throws Exception
	 */
	public User selectById(String username) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + User.TABLE_NAME + " where username=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}

	public int selectPaginationByKey(String key, int pageNo, int pageSize, List<User> pageData) {
		return 0;
	}

	private User row2entity(ResultSet rs) throws SQLException {
		User user = new User();
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setName(rs.getString("name"));
		user.setSex(rs.getString("sex"));
		user.setEmail(rs.getString(User.EMAIL));
		return user;
	}
}
