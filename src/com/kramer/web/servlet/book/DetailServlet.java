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
import com.kramer.dao.EBookDao;
import com.kramer.dao.ReadRecordDao;
import com.kramer.entity.Chapter;
import com.kramer.entity.EBook;
import com.kramer.entity.ReadRecord;

@WebServlet("/details.do")
public class DetailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			String bookId = req.getParameter("bookId");
			
			HttpSession session = req.getSession();
			String username = session.getAttribute("username").toString();
			EBook eBook = new EBook();
			EBookDao eBookDao = new EBookDao();

			eBook = eBookDao.selectById(bookId);
			
			req.setAttribute("eBook", eBook);
			
			
			
			Chapter chapter = new Chapter();
			ChapterDao chapterDao = new ChapterDao();
			List<Chapter> chapters = new LinkedList<>();
			chapters = chapterDao.selectByBookId(bookId);
			req.setAttribute("chapters", chapters);
			req.setAttribute("username", req.getSession().getAttribute("username"));
			
			
			List<ReadRecord> records = new LinkedList<>();
			ReadRecordDao readRecordDao = new ReadRecordDao();
			records = readRecordDao.selectByUsername(username);
			
			req.setAttribute("records", records);
			
			req.getRequestDispatcher("/bookdetails.jsp").forward(req, resp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
