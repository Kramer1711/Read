package com.kramer.web.servlet.index;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kramer.dao.EBookDao;
import com.kramer.dao.ReadRecordDao;
import com.kramer.dao.TypeDao;
import com.kramer.dao.UserDao;
import com.kramer.entity.EBook;
import com.kramer.entity.ReadRecord;
import com.kramer.entity.Type;
import com.kramer.entity.User;
import com.kramer.util.ThisSystemUtil;

@WebServlet("/index.do")
public class IndexServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		try {
			HttpSession session  = req.getSession();
			String username = session.getAttribute("username").toString();
			User user = new UserDao().selectById(username);
			
			req.setAttribute("username", user.getUsername());
			
			// 全部分类信息
			TypeDao typeDao = new TypeDao();
			List<Type> types = typeDao.selectAll();
			req.setAttribute("typeList", types);

			// 主页显示的书籍信息
			String key = req.getParameter("key");
			// 页码
			String pageNoStr = req.getParameter("pageNo");
			int pageNo = ThisSystemUtil.parseInt(pageNoStr, 1);
			// 每页大小
			int pageSize = 5;
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
			
			List<ReadRecord> records = new LinkedList<>();
			ReadRecordDao readRecordDao = new ReadRecordDao();
			records = readRecordDao.selectByUsername(username);
			
			req.setAttribute("records", records);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
