package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nlt.model.Post;
import org.nlt.model.User;
import org.nlt.service.PostSevice;

public class AddPostController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();

		String cid = req.getParameter("cid");
		String post_title = req.getParameter("pTitle");
		String post_content = req.getParameter("pContent");

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("currantUser");

		Post post = new Post(post_title, post_content, user.getId(), Integer.valueOf(cid), 1);
		
		try {
			boolean savePostStatus = PostSevice.savePost(post);

			if (savePostStatus)
				resp.sendRedirect("profile.jsp");
			else
				out.println("failed");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
