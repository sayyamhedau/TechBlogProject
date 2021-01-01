package org.nlt.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * final int SIZE = 1048;
		 * 
		 * resp.setContentType("text/plain"); resp.setHeader("Content-disposition",
		 * "attachment; filename=sample.txt");
		 * 
		 * try (InputStream in =
		 * req.getServletContext().getResourceAsStream("/WEB-INF/sample.txt");
		 * OutputStream out = resp.getOutputStream()) { byte[] buffer = new byte[SIZE];
		 * 
		 * int numBytesRead; while ((numBytesRead = in.read(buffer)) > 0) {
		 * out.write(buffer, 0, numBytesRead); } }
		 */

		String filename = req.getParameter("filename");

		switch (filename) {
		case "sample1":
			fileDownload(req, resp, filename);
			resp.sendRedirect("profile.jsp");
			break;
		case "sample2":
			fileDownload(req, resp, filename);
			resp.sendRedirect("profile.jsp");
			break;
		case "sample3":
			fileDownload(req, resp, filename);
			resp.sendRedirect("profile.jsp");
			break;
		case "sample4":
			fileDownload(req, resp, filename);
			resp.sendRedirect("profile.jsp");
			break;
		case "sample5":
			fileDownload(req, resp, filename);
			resp.sendRedirect("profile.jsp");
			break;
		default:
			resp.sendRedirect("profile.jsp");
			break;
		}
	}

	public static void fileDownload(HttpServletRequest req, HttpServletResponse resp, String filename) {
		int SIZE = 1048;

		resp.setContentType("text/plain");
		resp.setHeader("Content-disposition", "attachment; filename=" + filename + ".txt");

		try (InputStream in = req.getServletContext().getResourceAsStream("/textfiles/" + filename + ".txt");
				OutputStream out = resp.getOutputStream()) {
			byte[] buffer = new byte[SIZE];

			int numBytesRead;
			while ((numBytesRead = in.read(buffer)) > 0) {
				out.write(buffer, 0, numBytesRead);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
