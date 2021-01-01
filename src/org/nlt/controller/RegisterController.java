package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nlt.model.User;
import org.nlt.service.UserService;

public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String gender = req.getParameter("gender");
		String bio = req.getParameter("bio");
		String address = req.getParameter("address");
		String city = req.getParameter("city");
		String state = req.getParameter("state");
		String zip = req.getParameter("zip");

		User user = new User(name, email, password, gender, bio, address, city, state, zip, 1);

		try {
			boolean saveUserStatus = UserService.saveUser(user);

			if (saveUserStatus) {
				out.println("<html>\r\n" + "<head>\r\n" + "<meta charset=\"ISO-8859-1\">\r\n"
						+ "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/bootstrap.css\">\r\n" + "</head>\r\n"
						+ "<body>");
				out.println("<div class=\"alert alert-success col-md-4\" role=\"alert\">\r\n"
						+ "  Your account has been created successfully!\r\n" + "</div>");
				out.println("<br><a href='login.jsp'>Login here...<a>");
			} else {
				out.println("Failed to create account");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
