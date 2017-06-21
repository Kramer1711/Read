package com.kramer.web.servlet.book;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kramer.dao.EBookDao;
import com.kramer.entity.EBook;
import com.kramer.util.ThisSystemUtil;

@WebServlet("/book/qry.do")
public class QryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			String key = req.getParameter("key");
			// 页码
			String pageNoStr = req.getParameter("pageNo");
			int pageNo = ThisSystemUtil.parseInt(pageNoStr, 1);
			// 每页大小
			int pageSize = 10;
			// 2 验证参数
			if (!ThisSystemUtil.isNone(key)) {
				key = key.trim();// 取出前后空格
			}
			// 3 执行业务逻辑
			EBookDao dao = new EBookDao();
			List<EBook> pageData = new ArrayList<>(pageSize);
			int total = dao.selectPaginationByKey(key, pageNo, pageSize, pageData);
			// 4 组装视图对象(vo)
			req.setAttribute("pageData", pageData);
			req.setAttribute("totalRows", total);
			req.setAttribute("currentPage", pageNo);
			req.setAttribute("pageSize", pageSize);
			req.setAttribute("key", key);
			req.setAttribute("totalPage", ThisSystemUtil.totalPage(total, pageSize));
			
			// 5页面跳转
			req.getRequestDispatcher("/page/booklist.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
