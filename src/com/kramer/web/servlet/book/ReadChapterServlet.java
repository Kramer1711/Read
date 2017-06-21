package com.kramer.web.servlet.book;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kramer.dao.ChapterDao;
import com.kramer.dao.ReadRecordDao;
import com.kramer.dao.UserDao;
import com.kramer.entity.Chapter;
import com.kramer.entity.ReadRecord;
import com.kramer.util.book.Record;

@WebServlet("/readChapter.do")
public class ReadChapterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String chapterId = req.getParameter("chapterId");
			HttpSession session = req.getSession();
			
			//记录
			if(session.getAttribute("username")!=null){
				String username = session.getAttribute("username").toString();
				
				ReadRecord readRecord = new ReadRecord();
				
				readRecord.setChapter(new ChapterDao().selectById(chapterId));
				readRecord.setUser(new UserDao().selectById(username));
				
				Record.record(readRecord);
				
				//
				List<ReadRecord> records = new LinkedList<>();
				ReadRecordDao readRecordDao = new ReadRecordDao();
				records = readRecordDao.selectByUsername(username);
				
				req.setAttribute("records", records);
			}
			
			Chapter chapter = new Chapter();
			ChapterDao chapterDao = new ChapterDao();
			chapter = chapterDao.selectById(chapterId);
			
			req.setAttribute("chapter", chapter);


			
			
			req.getRequestDispatcher("/reading.jsp").forward(req, resp);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	

}
