package com.kramer.test;


import java.util.Date;

import com.kramer.dao.ChapterDao;
import com.kramer.dao.EBookDao;
import com.kramer.entity.EBook;
import com.kramer.util.DBUtil;
import com.kramer.util.book.SaveBook;
import com.kramer.entity.Chapter;

public class Demo {

	public static void main(String[] args) throws Exception {
		String filePath = "C:/Users/Kramer/Downloads/1004853338.epub";
//		SaveBook.SaveBookContent(filePath);
		
		
//		String filePath = "C:/Users/Kramer/Downloads/1005226649.epub";
//		String filePath = "F:/Java/eclipseWorkspace/.metadata/.plugins/org.eclipse.wst.server.core"
//				+ "/tmp0/wtpwebapps/Read/WEB-INF/upload/1/6/920c2bb8-2073-4b5f-91cd-b63c5345f669_1735921.epub";
//		String filePath = "F:/Java/eclipseWorkspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Read/WEB-INF/upload/0/1/ad66009a-f0ea-4fbf-8184-9b16864c19fb_1735921.epub";
//		EBook eBook = new EBook();
//		EBookDao bookDao = new EBookDao();
//		
//		HashMap<String, String> information = new HashMap<>();
//		
//		SaveBook.SavaBookInformation(filePath);
//		
//		//检查数据库中是否有该类型的小说，如果没有则添加
//		String typeName = information.get("type").trim();
//		Type type = new TypeDao().selectByTypeName(typeName);
//		if(type == null){
//			new TypeDao().insert(new Type(DBUtil.uuid(),typeName));
//		}
//		
//		eBook.setId(DBUtil.uuid());
//		eBook.setName(information.get("title"));
//		eBook.setAuthor(information.get("author"));
//		eBook.setType(new TypeDao().selectByTypeName(information.get("type")));
//		eBook.setResume(information.get("resume"));
//		eBook.setUpLoadTime(DBUtil.toSqlDate(new Date()));
//		
//		System.out.println(eBook.toString());
//		
////		bookDao.insert(eBook);
	}
}
