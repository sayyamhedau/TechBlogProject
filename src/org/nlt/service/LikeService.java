package org.nlt.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.nlt.config.DatabaseConnection;

public class LikeService {
	public static boolean saveLike(int postId, int userId) {
		boolean flag = false;

		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("insert into postlikes(postid,userid,status) values(?,?,?)");
			ps.setInt(1, postId);
			ps.setInt(2, userId);
			ps.setInt(3, 1);

			ps.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	
	
	public static int totalCountOnPost(int postid) {
		int count = 0;

		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("select count(*) from postlikes where postId=?");
			ps.setInt(1, postid);
			
			ResultSet resultSet = ps.executeQuery();
			if (resultSet.next()) {
				count = resultSet.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	
	
	public static boolean isLikeByUser(int postid, int userid) {
		boolean flag = false;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from postlikes where postId=? and userId=?");
			ResultSet resultSet = ps.executeQuery();
			if (resultSet.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
}
