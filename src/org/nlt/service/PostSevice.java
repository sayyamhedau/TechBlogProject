package org.nlt.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nlt.config.DatabaseConnection;
import org.nlt.model.Post;

public class PostSevice {

	public static boolean savePost(Post post) {
		boolean flag = false;
		Connection connection = DatabaseConnection.getConnection();

		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into posts(post_title,post_content,category_id,user_id,status) values(?,?,?,?,?)");

			ps.setString(1, post.getPost_title());
			ps.setString(2, post.getPost_content());
			ps.setInt(3, post.getCategoryid());
			ps.setInt(4, post.getUserid());
			ps.setInt(5, post.getStatus());

			ps.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	
	public static List<Post> getAllPosts() {
		List<Post> postList = new ArrayList<>();

		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("SELECT * FROM posts where status=1 order by post_id desc");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				int pid = resultSet.getInt("post_id");
				String post_title = resultSet.getString("post_title");
				String post_content = resultSet.getString("post_content");
				int userid = resultSet.getInt("user_id");
				int categoryid = resultSet.getInt("category_id");
				Date published_date = resultSet.getDate("published_date");
				int status = resultSet.getInt("status");

				Post post = new Post();
				post.setPid(pid);
				post.setPost_title(post_title);
				post.setPost_content(post_content);
				post.setPublishedDate(published_date);
				post.setCategoryid(categoryid);
				post.setUserid(userid);
				post.setStatus(status);

				postList.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postList;
	}

	
	public static List<Post> getAllPostByCategory(int categoryId) {
		List<Post> postList = new ArrayList<>();

		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("SELECT * FROM posts where category_id=? && status=1 order by post_id desc");
			ps.setInt(1, categoryId);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setPid(resultSet.getInt("post_id"));
				post.setCategoryid(resultSet.getInt("category_id"));
				post.setPost_content(resultSet.getString("post_content"));
				post.setPost_title(resultSet.getString("post_title"));
				post.setPublishedDate(resultSet.getDate("published_date"));
				post.setStatus(resultSet.getInt("status"));

				postList.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postList;
	}

	
	public static Post getPostByPostId(int postid) {
		Post post = null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from posts where post_id=" + postid);
			ResultSet resultSet = ps.executeQuery();
			if (resultSet.next()) {
				post = new Post();
				post.setPid(resultSet.getInt("post_id"));
				post.setCategoryid(resultSet.getInt("category_id"));
				post.setPost_content(resultSet.getString("post_content"));
				post.setPost_title(resultSet.getString("post_title"));
				post.setPublishedDate(resultSet.getTimestamp("published_date"));
				post.setStatus(resultSet.getInt("status"));
				post.setUserid(resultSet.getInt("user_id"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post;
	}
	
	
	public static List<Post> getPostByUser(int userid) {
		List<Post> postList = new ArrayList<>();
		Connection connection = DatabaseConnection.getConnection();

		try {
			PreparedStatement ps = connection.prepareStatement("select * from posts where user_id=?");
			ps.setInt(1, userid);

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				Post post = new Post();
				post.setPid(resultSet.getInt("post_id"));
				post.setCategoryid(resultSet.getInt("category_id"));
				post.setPost_content(resultSet.getString("post_content"));
				post.setPost_title(resultSet.getString("post_title"));
				post.setPublishedDate(resultSet.getDate("published_date"));
				post.setStatus(resultSet.getInt("status"));

				postList.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return postList;
	}
}
