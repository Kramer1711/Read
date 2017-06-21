package com.kramer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.kramer.entity.EBook;
import com.kramer.entity.ReadRecord;
import com.kramer.util.DBUtil;
import com.sun.corba.se.pept.transport.ContactInfo;

public class ReadRecordDao {
	public void insert(ReadRecord readRecord) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 3sql语句的构建
		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + ReadRecord.TABLE_NAME).append("(id,user_id,book_id,chapter_id,time)")
				.append("values").append(" (?,?,?,?,?	)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		
		int i = 1;
		ps.setString(i++, DBUtil.uuid());
		ps.setString(i++, readRecord.getUser().getUsername());
		ps.setString(i++, readRecord.getChapter().getBook().getId());
		ps.setString(i++, readRecord.getChapter().getId());
		ps.setDate(i++, DBUtil.toSqlDate(new Date()));
		// 执行
		ps.executeUpdate();// 增删改
	}

	public void delete(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + ReadRecord.TABLE_NAME + " where " + ReadRecord.ID + "=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ps.executeUpdate();
	}

	/**
	 * @param readRecord
	 * @throws Exception
	 */
	public void update(ReadRecord readRecord) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("update " + ReadRecord.TABLE_NAME).append(" set user_id=?,book_id=?,chapter_id=?,time=?")
				.append(" where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, readRecord.getUser().getUsername());
		ps.setString(i++, readRecord.getChapter().getBook().getId());
		ps.setString(i++, readRecord.getChapter().getId());
		ps.setDate(i++, DBUtil.toSqlDate(new Date()));
		ps.setString(i++, readRecord.getId());
		ps.executeUpdate();
	}



	public ReadRecord selectByUserAndChapter(ReadRecord readRecord) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from " + ReadRecord.TABLE_NAME).append(" where user_id = ? and book_id = ?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, readRecord.getUser().getUsername());
		ps.setString(i++, new ChapterDao().selectById(readRecord.getChapter().getId()).getBook().getId());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}

	/**
	 * 通过id查找
	 * 
	 * @param id
	 * @return 信息
	 * @throws Exception
	 */
	public ReadRecord selectById(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + ReadRecord.TABLE_NAME + " where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}

	/**
	 * 搜索某用户的阅读记录
	 * 
	 * @param username
	 * @return
	 * @throws Exception
	 */

	public List<ReadRecord> selectByUsername(String username) throws Exception {
		List<ReadRecord> records = new LinkedList<>();

		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from " + ReadRecord.TABLE_NAME + " where " + ReadRecord.USER_ID + " = ?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, username);
		
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			records.add(this.row2entity(rs));
		}
		return records;
	}

	/**
	 * 
	 * @param key
	 * @param pageNo
	 * @param pageSize
	 * @param pageData
	 * @return
	 */

	public int selectPaginationByKey(String key, int pageNo, int pageSize, List<ReadRecord> pageData) {
		return 0;
	}

	private ReadRecord row2entity(ResultSet rs) throws Exception {
		ReadRecord readRecord = new ReadRecord();
		readRecord.setId(rs.getString(ReadRecord.ID));
		readRecord.setUser(new UserDao().selectById(rs.getString(ReadRecord.USER_ID)));
		readRecord.setBook(new EBookDao().selectById(rs.getString(ReadRecord.BOOK_ID)));
		readRecord.setChapter(new ChapterDao().selectById(rs.getString(ReadRecord.CHPATER_ID)));
		readRecord.setTime(rs.getDate(ReadRecord.TIME));
		return readRecord;
	}
}
