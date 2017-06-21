package com.kramer.util.book;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;

import com.kramer.dao.ChapterDao;
import com.kramer.dao.EBookDao;
import com.kramer.dao.TypeDao;
import com.kramer.entity.Chapter;
import com.kramer.entity.EBook;
import com.kramer.entity.Type;
import com.kramer.util.DBUtil;
import com.sun.prism.Image;

import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.epub.EpubReader;

public class SaveBook {
	private static final String TITLE_MARK = "<b>书名</b>";
	private static final String AUTOHR_MARK = "<b>作者</b>";
	private static final String TYPE_MARK = "<b>主题</b>";
	private static final String RESUME_MARK = "<b>简介</b>";

	private static final String[] NO_MARK = new String[] { "cover", "title-page", "catalog", "page" };
	private static final String[] CHAPTER_MARK = new String[] { "<h1>", "</h1>", "<div class=\"content\">", "</div>" };

	private static final String TITLE = "title";
	private static final String TYPE = "type";
	private static final String AUTHOR = "author";
	private static final String RESUME = "resume";
	private static final String CHAPTER_TITLE = "chapterTitle";
	private static final String CHAPTER_CONTENT = "chapterContent";

	/**
	 * 读取epub并保存书籍信息及所以章节内容至MySql
	 * 
	 * @param filePath
	 * @throws Exception
	 */

	public static void SaveBookAll(String filePath, String coverPath) throws Exception {
		HashMap<String, String> bookData = new HashMap<>();
		SaveBookInformation(filePath, coverPath, bookData);

		String title = bookData.get(TITLE);
		String type = bookData.get(TYPE);
		String author = bookData.get(AUTHOR);
		String resume = bookData.get(RESUME);

		// 检查数据库中是否有该类型的小说，如果没有则添加
		Type type1 = new TypeDao().selectByTypeName(type);
		if (type1 == null) {
			new TypeDao().insert(new Type(DBUtil.uuid(), type));
		}

		EBook eBook = new EBook();
		eBook.setId(DBUtil.uuid());
		eBook.setName(title);
		eBook.setAuthor(author);
		eBook.setType(new TypeDao().selectByTypeName(type));
		eBook.setResume(resume);
		eBook.setUpLoadTime(DBUtil.toSqlDate(new Date()));

		// 书籍信息保存至数据库
		new EBookDao().insert(eBook);

		System.err.println(eBook.toString());

		List<HashMap<String, String>> chapters = new LinkedList<>();
		SaveBookContent(filePath, chapters);

		int chapterNumber = 0;
		int charNumber = 0;

		ChapterDao chapterDao = new ChapterDao();
		for (HashMap<String, String> cc : chapters) {
			Chapter chapter2 = new Chapter();
			chapter2.setBook(eBook);
			chapter2.setId(DBUtil.uuid());
			chapter2.setSerialNumber(Integer.valueOf(cc.get("SerialNumber")));
			chapter2.setChapter(cc.get("chapterTitle"));
			chapter2.setContent(cc.get("chapterContent"));
			chapter2.setUpLoadTime(DBUtil.toSqlDate(new Date()));
			// System.out.println(chapter2.toString());
			chapterDao.insert(chapter2);
			chapterNumber++;
			charNumber += chapter2.getContent().length();
		}
		eBook.setChapterNumber(chapterNumber);
		eBook.setCharNumber(charNumber);

		coverPath = coverPath.substring(coverPath.indexOf('/'));
		System.err.println("coverPath:"+coverPath);
		eBook.setCoverPath(coverPath);

		new EBookDao().update(eBook);

	}

	/**
	 * 
	 * @param filePath
	 *            文件路径
	 * @param information
	 *            返回书籍信息
	 * @throws Exception
	 */
	public static void SaveBookInformation(String filePath, String coverPath, HashMap<String, String> bookData)
			throws Exception {
		EpubReader epubReader = new EpubReader();

		InputStream inputStream = new FileInputStream(filePath);
		Book book = epubReader.readEpub(inputStream);

		// 书籍信息html ID
		String titleID = "title-page";
		Resource titleResource = book.getResources().getById(titleID);
		// 获取该html全部信息
		String titleContent = new String(titleResource.getData());
		// System.out.println(titleContent);

		String temp = null;
		String title = null;
		String type = null;
		String author = null;
		String resume = null;

		// 保存封面至服务器
		Resource resource = book.getCoverImage();
		byte[] img = resource.getData();

		FileImageOutputStream imgout = new FileImageOutputStream(new File(coverPath));
		imgout.write(img, 0, img.length);
		imgout.close();
		bookData.put("coverPath", coverPath);
		
		temp = img.toString();
		bookData.put("cover", temp);// 封面图片

		// 获取书名
		temp = titleContent.substring(titleContent.indexOf(TITLE_MARK));
		title = temp.substring(temp.indexOf("\">") + 2, temp.indexOf("</a"));
		bookData.put("title", title.trim());

		// 获取作者
		temp = titleContent.substring(titleContent.indexOf(AUTOHR_MARK));
		author = temp.substring(temp.indexOf("\">") + 2, temp.indexOf("</a"));
		bookData.put("author", author.trim());

		// 获取主题
		temp = titleContent.substring(titleContent.indexOf(TYPE_MARK));
		type = temp.substring(temp.indexOf("b>：") + 3, temp.indexOf("</li"));
		bookData.put("type", type.trim());

		// 获取简介
		temp = titleContent.substring(titleContent.indexOf(RESUME_MARK));
		temp = temp.substring(temp.indexOf("<pre>") + 5, temp.indexOf("</pre"));
		resume = temp.replace("　　", "</p><p>");
		bookData.put("resume", resume.trim());

		// 关闭I/O流
		inputStream.close();
	}

	/**
	 * 
	 * @param filePath
	 *            文件路径
	 * @param chapters
	 * @throws Exception
	 */
	public static void SaveBookContent(String filePath, List<HashMap<String, String>> chapters) throws Exception {

		EpubReader epubReader = new EpubReader();
		InputStream inputStream = new FileInputStream(filePath);

		Book book = epubReader.readEpub(inputStream);

		List<Resource> resources = book.getContents();

		String chapterTitle = null; // 章节标题
		String chapterContent = null; // 章节内容

		HashMap<String, String> chapter = new HashMap<>();
		String allContent = null;
		int index = 0;

		for (Resource rr : resources) {
			if (!rr.getId().equals(NO_MARK[0]) && !rr.getId().equals(NO_MARK[1]) && !rr.getId().equals(NO_MARK[2])
					&& !rr.getId().equals(NO_MARK[3])) {
				allContent = new String(rr.getData());
				chapterTitle = allContent.substring(allContent.indexOf(CHAPTER_MARK[0]) + CHAPTER_MARK[0].length(),
						allContent.indexOf(CHAPTER_MARK[1])).trim();
				chapterContent = allContent.substring(allContent.indexOf(CHAPTER_MARK[2]) + CHAPTER_MARK[2].length(),
						allContent.indexOf(CHAPTER_MARK[3]));

				String temp = new String();
				temp = chapterContent.replace("　　", "</p><p>");
				temp = temp.replace(
						"<p>手机阅读器、看书更方便。【<a href=\"http://download.qidian.com/apk/QDReader.apk?k=e\" target=\"_blank\">安卓版</a>】</p>",
						"");
				chapterContent = temp;

				chapter = new HashMap<>();
				chapter.put("SerialNumber", "" + index++);
				chapter.put("chapterTitle", chapterTitle.trim());
				chapter.put("chapterContent", chapterContent);
				chapters.add(chapter);
			}
		}

		inputStream.close();

	}
}
