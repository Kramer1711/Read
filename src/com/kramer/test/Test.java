package com.kramer.test;

import com.kramer.dao.ChapterDao;
import com.kramer.dao.ReadRecordDao;
import com.kramer.dao.UserDao;
import com.kramer.entity.ReadRecord;
import com.kramer.util.DBUtil;

public class Test {

	static char Di = '第';
	static char Zhang = '章';

	public static void main(String[] args) throws Exception {
//		ReadRecord readRecord = new ReadRecord();
//		readRecord.setId(DBUtil.uuid());
//		readRecord.setChapter(new ChapterDao().selectById("025bdb74282e09aab444fc293e93f521"));
//		readRecord.setUser(new UserDao().selectById("kramer"));
//		
//		ReadRecordDao dao = new ReadRecordDao();
//		System.out.println(dao.selectById("19bfb43ac100ab0808b407591d1b5834").toString());
//		
//		
		

//		EpubReader epubReader = new EpubReader();
//		String filePath = "C:/Users/Kramer/Downloads/1004853338.epub";
//		InputStream inputStream = new FileInputStream(filePath);
//
//		Book book = epubReader.readEpub(inputStream);
//
//		Resource resource = book.getCoverImage();
//		Metadata resource2 = book.getMetadata();
//
//		byte[] img = resource.getData();
//
//		String newFilename = "e:\\cover.jpg";
//		FileImageOutputStream imgout = new FileImageOutputStream(new File(newFilename));
//		imgout.write(img, 0, img.length);
//		imgout.close();
//
//		System.out.println();

		// 数据库重置！！
		 DBUtil.clearAllSqlDataOfBook();
		/*
		 * InputStream inputStream = new
		 * FileInputStream("C:/Users/Kramer/Downloads/小说/遮天/22286.txt");
		 * InputStreamReader reader = new InputStreamReader(inputStream, "GBK");
		 * StringBuffer buffer = new StringBuffer(); while (reader.ready()) {
		 * buffer.append((char) reader.read()); }
		 * System.out.println(buffer.toString()); reader.close();
		 * inputStream.close();
		 */

		/*
		 * StringBuffer temp = new StringBuffer(); for (int i = 0; i <
		 * buffer.length(); i++) { if (buffer.charAt(i) == Di) {
		 * System.out.println(i); for (int j = 1; j <= 10; j++) { if
		 * (buffer.charAt(i + j) == Zhang) temp.append(i); } } else {
		 * System.out.print("|"); } } System.out.println(temp.length());
		 * StringBuffer chapter = new StringBuffer(); int j = 0; for (int i = 0;
		 * i < buffer.length(); i++) { System.out.println(temp.charAt(j)); int
		 * tempNumber1 = (int) temp.charAt(j++); int tempNumber2 = (int)
		 * temp.charAt(j++); if (i > tempNumber1 && i < tempNumber2) {
		 * chapter.append(buffer.charAt(i)); } }
		 * System.out.println(chapter.toString());
		 * 
		 * // System.out.println(buffer.toString()); reader.close();
		 * inputStream.close();
		 */
	}
}
