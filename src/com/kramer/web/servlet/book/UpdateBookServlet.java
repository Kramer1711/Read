package com.kramer.web.servlet.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kramer.dao.EBookDao;
import com.kramer.dao.TypeDao;
import com.kramer.entity.EBook;
import com.kramer.entity.Type;

@WebServlet("/updateBook.do")
public class UpdateBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String bookId = req.getParameter("bookId");
		String bookName = req.getParameter("bookName");
		String bookAuthor = req.getParameter("bookAuthor");
		String bookTypeId = req.getParameter("type");
		String bookResume = req.getParameter("bookResume");

		try {
			TypeDao typeDao = new TypeDao();
			Type type = typeDao.selectById(bookTypeId);

			EBookDao bookDao = new EBookDao();
			EBook eBook = bookDao.selectById(req.getParameter("bookId"));
			eBook.setName(bookName);
			eBook.setAuthor(bookAuthor);
			eBook.setType(type);
			eBook.setResume(bookResume);
			bookDao.update(eBook);

			req.setAttribute("eBook", eBook);
			req.setAttribute("message", "修改成功！");

		} catch (Exception e) {
			req.setAttribute("message", "系统繁忙，请稍后重试！");
			req.getRequestDispatcher("/editBook.do?ebookId=" + bookId).forward(req, resp);
			e.printStackTrace();
		}
		req.getRequestDispatcher("/editBook.do?ebookId=" + bookId).forward(req, resp);
	}

}
