package com.kramer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.kramer.entity.EBook;
import com.kramer.entity.Type;
import com.kramer.util.DBUtil;
import com.kramer.util.ThisSystemUtil;

public class EBookDao {
	public void insert(EBook book) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 3sql语句的构建
		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + EBook.TABLE_NAME).append("(id,name,type_id,author,chapter_number,")
				.append("char_number,cover_path,resume,upLoadTime,remark,").append("type_name)").append("values")
				.append("(?,?,?,?,?		,?,?,?,?,?		,?)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, book.getId());
		ps.setString(i++, book.getName());
		ps.setString(i++, book.getType().getId());
		ps.setString(i++, book.getAuthor());
		ps.setInt(i++, book.getChapterNumber());

		ps.setInt(i++, book.getCharNumber());
		ps.setString(i++, book.getCoverPath());
		ps.setString(i++, book.getResume());
		ps.setDate(i++, DBUtil.toSqlDate(book.getUpLoadTime()));
		ps.setString(i++, book.getRemark());

		ps.setString(i++, book.getType().getType());
		// 执行
		ps.executeUpdate();// 增删改
	}

	public void delete(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + EBook.TABLE_NAME + " where " + EBook.ID + "=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ps.executeUpdate();
	}

	/**
	 * @param book
	 * @throws Exception
	 */
	public void update(EBook book) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("update " + EBook.TABLE_NAME).append(" set name=?,type_id=?,author=?,chapter_number=?,")
				.append("char_number=?,cover_path=?,resume=?,upLoadTime=?,remark=?,type_name=?").append(" where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, book.getName());
		ps.setString(i++, book.getType().getId());
		ps.setString(i++, book.getAuthor());
		ps.setInt(i++, book.getChapterNumber());

		ps.setInt(i++, book.getCharNumber());
		ps.setString(i++, book.getCoverPath());
		ps.setString(i++, book.getResume());
		ps.setDate(i++, DBUtil.toSqlDate(book.getUpLoadTime()));
		ps.setString(i++, book.getRemark());

		ps.setString(i++, book.getType().getType());

		ps.setString(i++, book.getId());
		ps.executeUpdate();
	}

	/**
	 * 通过id查找职工帐号信息
	 * 
	 * @param id
	 * @return 职工帐号信息
	 * @throws Exception
	 */
	public EBook selectById(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + EBook.TABLE_NAME + " where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}

	public List<EBook> selectAll() throws Exception {
		List<EBook> books = new LinkedList<>();
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ").append(EBook.TABLE_NAME);
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			books.add(this.row2entity(rs));
		}
		return books;
	}

	/**
	 * 关键词搜索
	 * 
	 * @param key
	 *            关键词
	 * @param pageNo
	 *            页码
	 * @param pageSize
	 *            页数
	 * @param pageData
	 *            数据
	 * @return
	 * @throws Exception
	 */
	public int selectPaginationByKey(String key, int pageNo, int pageSize, List<EBook> pageData) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 查询where条件
		StringBuilder whereSql = new StringBuilder();
		whereSql.append(" from " + EBook.TABLE_NAME);
		if (!ThisSystemUtil.isNone(key)) {
			key = "%" + key + "%";
			whereSql.append(" where name like ? or author like ? or type_name like ? or id = ?");
		}
		whereSql.append(" order by upLoadTime ");
		// 查询总记录数
		PreparedStatement ps = connection.prepareStatement("select count(*) " + whereSql);
		if (!ThisSystemUtil.isNone(key)) {
			ps.setString(1, key);
			ps.setString(2, key);
			ps.setString(3, key);
			ps.setString(4, key);
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
			ps.setString(4, key);
		}
		rs = ps.executeQuery();
		while (rs.next()) {
			pageData.add(this.row2entity(rs));
		}
		return total;
	}

	private EBook row2entity(ResultSet rs) throws Exception {
		EBook book = new EBook();
		Type type = new TypeDao().selectById(rs.getString("type_id"));
		book.setId(rs.getString(EBook.ID));
		book.setName(rs.getString(EBook.NAME));
		book.setType(type);
		book.setAuthor(rs.getString("author"));
		book.setChapterNumber(rs.getInt(EBook.CHAPTER_NUMBER));
		book.setCharNumber(rs.getInt(EBook.CHAR_NUMBER));
		book.setCoverPath(rs.getString(EBook.COVER_PATH));
		book.setResume(rs.getString("resume"));
		book.setUpLoadTime(rs.getDate("upLoadTime"));
		book.setRemark(rs.getString("resume"));
		return book;
	}
}
