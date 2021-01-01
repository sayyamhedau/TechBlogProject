package org.nlt.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nlt.service.LikeService;

public class PostLikeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		String operation = req.getParameter("operation");
		String postid = req.getParameter("pid");
		String userid = req.getParameter("uid");

		if (operation.equalsIgnoreCase("like")) {
			boolean flag = LikeService.saveLike(Integer.parseInt(postid), Integer.parseInt(userid));
			out.println(flag);
		}
	}
}
