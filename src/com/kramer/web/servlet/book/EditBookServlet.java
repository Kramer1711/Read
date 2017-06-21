package com.kramer.web.servlet.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kramer.dao.EBookDao;
import com.kramer.dao.TypeDao;
import com.kramer.entity.EBook;
import com.kramer.entity.Type;
import com.kramer.util.ThisSystemException;


@WebServlet("/editBook.do")
public class EditBookServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			List<Type> typeList = new TypeDao().selectAll();
			req.setAttribute("typeList", typeList);
			typeList.get(1).getId();
			String id = req.getParameter("ebookId");
			EBook eBook = new EBookDao().selectById(id);
			req.setAttribute("eBook", eBook);
			req.getRequestDispatcher("/admin/pages/book/bookupdate.jsp").forward(req, resp);
		} catch (ThisSystemException e) {
			req.setAttribute("messags", e.getMessage());
		} catch (Exception e) {
			req.setAttribute("message", "系统繁忙，请稍后再试！");
			e.printStackTrace();
		}
	}
}
