package com.kramer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.kramer.entity.Type;
import com.kramer.util.DBUtil;
import com.kramer.util.ThisSystemUtil;

public class TypeDao {
	public void insert(Type type) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 3sql语句的构建
		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + Type.TABLE_NAME)
			.append(" (" + Type.ID + "," + Type.TYPE + "," + Type.REMARK)
			.append(") ").append("values").append("(?,?,?)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, type.getId());
		ps.setString(i++, type.getType());
		ps.setString(i++, type.getRemark());
		// 执行
		ps.executeUpdate();// 增删改
	}

	public void delete(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + Type.TABLE_NAME + " where " + Type.ID + "=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ps.executeUpdate();
	}

	/**
	 * @param type
	 * @throws Exception
	 */
	public void update(Type type) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("update " + Type.TABLE_NAME).append(" set type=?,remark=?")
				.append(" where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, type.getType());
		ps.setString(i++, type.getRemark());
		ps.setString(i++, type.getId());
		System.out.println(sql.toString());
		ps.executeUpdate();
	}

	/**
	 * 通过id查找职工帐号信息
	 * 
	 * @param id
	 * @return 职工帐号信息
	 * @throws Exception
	 */
	public Type selectById(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + Type.TABLE_NAME + " where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}
	/**
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Type selectByTypeName(String typeName) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + Type.TABLE_NAME + " where type like ?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, typeName);
		System.out.println(ps.toString());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}
	
	/**
	 * 
	 * @return all types
	 * @throws SQLException
	 */
	public List<Type> selectAll() throws SQLException{
		List<Type> types = new LinkedList<>();
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from " + Type.TABLE_NAME);
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			types.add(this.row2entity(rs));
		}
		return types;
	}
	
	
	public int selectPaginationByKey(String key, int pageNo, int pageSize, List<Type> pageData) throws SQLException {
		Connection connection = DBUtil.getConnection();
		// 查询where条件
		StringBuilder whereSql = new StringBuilder();
		whereSql.append(" from " + Type.TABLE_NAME);
		if (!ThisSystemUtil.isNone(key)) {
			key = "%" + key + "%";
			whereSql.append(" where name like ? or author like ? or type like ?");
		}
		whereSql.append(" order by id ");
		// 查询总记录数
		PreparedStatement ps = connection.prepareStatement("select count(*) " + whereSql);
		if (!ThisSystemUtil.isNone(key)) {
			ps.setString(1, key);
			ps.setString(2, key);
			ps.setString(3, key);
		}
		ResultSet rs = ps.executeQuery();
		int total = 0;
		if (rs.next()) {
			total = rs.getInt(1);
		}
		// 如果有记录则分页查询
		if (total == 0) {
			return total;
		}
		// 构建分页sql
		StringBuilder sql = new StringBuilder();
		sql.append("select *  ");
		sql.append(whereSql);
		sql.append(" limit ").append((pageNo - 1) * pageSize).append(",").append(pageSize);
		ps = connection.prepareStatement(sql.toString());
		if (!ThisSystemUtil.isNone(key)) {
			ps.setString(1, key);
			ps.setString(2, key);
			ps.setString(3, key);
		}
		rs = ps.executeQuery();
		while (rs.next()) {
			pageData.add(this.row2entity(rs));
		}
		return total;
	}

	private Type row2entity(ResultSet rs) throws SQLException {
		Type type = new Type();
		type.setId(rs.getString(Type.ID));
		type.setType(rs.getString(Type.TYPE));
		type.setRemark(rs.getString(Type.REMARK));
		return type;
	}
}
