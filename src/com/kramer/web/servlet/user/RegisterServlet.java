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

@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setCharacterEncoding("UTF=8");
			resp.setContentType("text/html;charset=UTF-8");
			// 获取数据
			// 注册信息
			String username = req.getParameter("username").trim();
			String password1 = req.getParameter("password1").trim();
			String password2 = req.getParameter("password2").trim();
			String email = req.getParameter("email").trim();

			// 检验
			UserDao dao = new UserDao();
			User user = new User();
			user = dao.selectById(username);
			if (user == null) {
				if (password1.equals(password2)) {
					User newUser = new User();
					newUser.setUsername(username);
					newUser.setPassword(password2);
					newUser.setEmail(email);
					dao.insert(newUser);
					// 使用request对象的getSession()获取session，如果session不存在则创建一个
					HttpSession session = req.getSession();
					// 将数据存储到session中
					session.setAttribute("username", newUser.getUsername());
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
			} else {
				req.setAttribute("message", "该用户已存在！");
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
