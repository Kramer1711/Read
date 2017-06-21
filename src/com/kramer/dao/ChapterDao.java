package com.kramer.dao;

import java.awt.image.DataBufferDouble;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.kramer.entity.Chapter;
import com.kramer.entity.EBook;
import com.kramer.entity.Type;
import com.kramer.util.DBUtil;
import com.kramer.util.ThisSystemUtil;

import javafx.util.converter.PercentageStringConverter;

public class ChapterDao {
	public void insert(Chapter chapter) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 3sql语句的构建
		StringBuilder sql = new StringBuilder();
		sql.append("insert into " + Chapter.TABLE_NAME).append("(id,book_id,serial_number,chapter,content,")
				.append("upLoadTime,remark)").append("values").append("(?,?,?,?,?	,?,?)");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;

		ps.setString(i++, chapter.getId());
		ps.setString(i++, chapter.getBook().getId());
		ps.setInt(i++, chapter.getSerialNumber());
		ps.setString(i++, chapter.getChapter());
		ps.setString(i++, chapter.getContent());

		ps.setDate(i++, DBUtil.toSqlDate(chapter.getUpLoadTime()));
		ps.setString(i++, chapter.getRemark());
		// 执行
		ps.executeUpdate();// 增删改
	}

	public void delete(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("delete from " + Chapter.TABLE_NAME + " where " + Chapter.ID + "=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ps.executeUpdate();
	}

	/**
	 * @param chapter
	 * @throws Exception
	 */
	public void update(Chapter chapter) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("update " + Chapter.TABLE_NAME)
				.append(" set book_id=?,serial_number=?,chapter=?,content=?,upLoadTime=?,remark=?")
				.append(" where id=?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, chapter.getBook().getId());
		ps.setInt(i++, chapter.getSerialNumber());
		ps.setString(i++, chapter.getChapter());
		ps.setString(i++, chapter.getContent());
		ps.setDate(i++, DBUtil.toSqlDate(chapter.getUpLoadTime()));

		ps.setString(i++, chapter.getRemark());
		ps.setString(i++, chapter.getId());
		ps.executeUpdate();
	}

	/**
	 * 通过chapterID查找章节
	 * 
	 * @param id
	 * @return 章节信息
	 * @throws Exception
	 */
	public Chapter selectById(String id) throws Exception {
		Connection connection = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from " + Chapter.TABLE_NAME + " where id = ?");
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.row2entity(rs);
		}
		return null;
	}
	
	/**
	 * 输入bookID，查找该书籍的所有章节信息
	 * @param bookId
	 * @return 某书的所有章节信息
	 * @throws Exception
	 */

	public List<Chapter> selectByBookId(String bookId) throws Exception {
		List<Chapter> chapters = new LinkedList<>();
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();

		sql.append("select * from ").append(Chapter.TABLE_NAME).append(" where ").append(Chapter.BOOK_ID).append(" = '")
				.append(bookId).append("' order by ").append(Chapter.SERIAL_NUMBER);
		PreparedStatement ps = connection.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			chapters.add(this.row2entity(rs));
		}
		return chapters;
	}

	/**
	 * 输入当前章节，返回下一章节 ,如果当前为最后一章，则返回null
	 * 
	 * @param currentChapter
	 *            当前章节
	 * @return nextChapter 下一章节
	 * @throws Exception
	 */
	public Chapter selectNextByChapter(Chapter currentChapter) throws Exception {
		Chapter nextChapter = new Chapter();
		EBook eBook = currentChapter.getBook();
		// 是否为最后一章，是返回null
		if (currentChapter.getSerialNumber() >= eBook.getChapterNumber() - 1) {
			return null;
		}
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		// 根据bookID和章节序号
		sql.append("select * from ").append(Chapter.TABLE_NAME).append(" where ").append(Chapter.BOOK_ID)
				.append(" = ? and ").append(Chapter.SERIAL_NUMBER).append(" = ? ");

		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, currentChapter.getBook().getId());
		ps.setInt(i++, currentChapter.getSerialNumber() + 1);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			nextChapter = this.row2entity(rs);
		}
		return nextChapter;
	}

	/**
	 * 输入当前章节，返回上一章节 ,如果当前为第一章节则返回null
	 * 
	 * @param curentChapter
	 *            当前章节
	 * @return preChapter 上一章节
	 * @throws Exception
	 */
	public Chapter selectPreByChapter(Chapter currentChapter) throws Exception {
		Chapter preChapter = new Chapter();
		EBook eBook = currentChapter.getBook();
		// 是否为第一章，是返回null
		if (currentChapter.getSerialNumber() <= 0) {
			return null;
		}
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		// 根据bookID和章节序号
		sql.append("select * from ").append(Chapter.TABLE_NAME).append(" where ").append(Chapter.BOOK_ID)
				.append(" = ? and ").append(Chapter.SERIAL_NUMBER).append(" = ? ");

		PreparedStatement ps = connection.prepareStatement(sql.toString());
		int i = 1;
		ps.setString(i++, currentChapter.getBook().getId());
		ps.setInt(i++, currentChapter.getSerialNumber() - 1);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			preChapter = this.row2entity(rs);
		}
		return preChapter;
	}
	
	/**
	 * 
	 * @return 所有章节信息
	 * @throws Exception
	 */

	public List<Chapter> selectAll() throws Exception {
		List<Chapter> chapters = new LinkedList<>();
		Connection connection = DBUtil.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from ").append(Chapter.TABLE_NAME);
		PreparedStatement ps = connection.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			chapters.add(this.row2entity(rs));
		}
		return chapters;
	}

	public int selectPaginationByKey(String key, int pageNo, int pageSize, List<Chapter> pageData) throws Exception {
		Connection connection = DBUtil.getConnection();
		// 查询where条件
		StringBuilder whereSql = new StringBuilder();
		whereSql.append(" from " + Chapter.TABLE_NAME);
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

	
	private Chapter row2entity(ResultSet rs) throws Exception {
		Chapter chapter = new Chapter();
		chapter.setId(rs.getString(Chapter.ID));
		chapter.setBook(new EBookDao().selectById(rs.getString(Chapter.BOOK_ID)));
		chapter.setSerialNumber(rs.getInt(Chapter.SERIAL_NUMBER));
		chapter.setChapter(rs.getString(Chapter.CHAPTER));
		chapter.setContent(rs.getString(Chapter.CONTENT));
		chapter.setUpLoadTime(rs.getDate(Chapter.UP_LOAD_TIME));
		chapter.setRemark(rs.getString(Chapter.REMARK));
		return chapter;
	}
}
