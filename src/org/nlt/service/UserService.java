package org.nlt.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.nlt.config.DatabaseConnection;
import org.nlt.model.User;

public class UserService {

	public static boolean saveUser(User user) {
		boolean flag = false;

		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into users(name,email,password,gender,bio,address,city,state,zip,status) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getBio());
			ps.setString(6, user.getAddress());
			ps.setString(7, user.getCity());
			ps.setString(8, user.getState());
			ps.setString(9, user.getZipCode());
			ps.setInt(10, 1);

			int executeUpdate = ps.executeUpdate();

			if (executeUpdate > 0)
				flag = true;
			else
				flag = false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static User loginUser(String email, String password) {
		User user = null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from users where email=? && password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setBio(rs.getString("bio"));
				user.setAddress(rs.getString("address"));
				user.setCity(rs.getString("city"));
				user.setState(rs.getString("state"));
				user.setZipCode(rs.getString("zip"));
				user.setLastLoggedIn(rs.getDate("lastLoggedIn"));
				user.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return user;
	}

	public static boolean updateUser(User user) {
		boolean flag = false;
		Connection connection = DatabaseConnection.getConnection();

		try {

			PreparedStatement ps = connection
					.prepareStatement("update users set name=?,email=?,password=?,bio=? where id=?");

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getBio());
			ps.setInt(5, user.getId());

			int executeUpdateStatus = ps.executeUpdate();

			if (executeUpdateStatus > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	public static User getUserbyUserid(int userid) {
		User user = null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from users where id=?");
			ps.setInt(1, userid);

			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {
				user = new User();

				user.setId(resultSet.getInt("id"));
				user.setBio(resultSet.getString("bio"));
				user.setCity(resultSet.getString("city"));
				user.setEmail(resultSet.getString("email"));
				user.setGender(resultSet.getString("gender"));
				user.setName(resultSet.getString("name"));
				user.setAddress(resultSet.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
