package com.kramer.web.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kramer.dao.UserDao;
import com.kramer.entity.User;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setCharacterEncoding("UTF=8");
			resp.setContentType("text/html;charset=UTF-8");
			// 获取数据
			// 登录信息
			String username = req.getParameter("username");
			String password = req.getParameter("password");

			// 检验
			UserDao dao = new UserDao();
			User user = dao.selectById(username);
			if (password.equals(user.getPassword())) {
				// 使用request对象的getSession()获取session，如果session不存在则创建一个
				HttpSession session = req.getSession();
				// 将数据存储到session中
				session.setAttribute("username", username);
				// 页面跳转
				req.getRequestDispatcher("/index.do").forward(req, resp);
				// 获取session的Id
				// String sessionId = session.getId();
				// 判断session是不是新创建的
				// if (session.isNew()) {
				// resp.getWriter().print("session创建成功，session的id是：" +
				// sessionId);
				// } else {
				// resp.getWriter().print("服务器已经存在该session了，session的id是：" +
				// sessionId);
				// }
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
