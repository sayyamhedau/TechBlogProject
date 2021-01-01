package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nlt.model.User;
import org.nlt.service.UserService;

public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String email = req.getParameter("email");
		String password = req.getParameter("password");

		User user = UserService.loginUser(email, password);

		if (user == null) {
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
			requestDispatcher.include(req, resp);
			out.println("<html>\r\n" + "<head>\r\n" + "<meta charset=\"ISO-8859-1\">\r\n"
					+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/bootstrap.css\">\r\n" + "</head>\r\n"
					+ "<body>");
			out.println(
					"<div class=\"alert alert-warning col-md-4\" style=\"margin-left: 13.4%;margin-top:3%\" role=\"alert\">\r\n"
							+ "  Email id or password something wrong!\r\n" + "</div>");
		
		} else {

			HttpSession session = req.getSession();
			session.setAttribute("currantUser", user);
			resp.sendRedirect("profile.jsp");
		}
	}
}
