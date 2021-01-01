package org.nlt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nlt.model.User;
import org.nlt.service.UserService;

@MultipartConfig
public class UpdateController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		String bio = req.getParameter("user_bio");


		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currantUser");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setBio(bio);

		
		try {
			boolean updateUserStatus = UserService.updateUser(user);
			if(updateUserStatus) {
				resp.sendRedirect("profile.jsp");
			}
			else
				System.out.println("failed to updated");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
