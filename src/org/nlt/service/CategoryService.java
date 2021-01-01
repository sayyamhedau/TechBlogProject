package org.nlt.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nlt.config.DatabaseConnection;
import org.nlt.model.Category;

public class CategoryService {

	public static List<Category> getAllCategories() {
		List<Category> categoryList = new ArrayList<>();

		Connection connection = DatabaseConnection.getConnection();
		PreparedStatement ps;
		try {

			ps = connection.prepareStatement("select * from categories where status=1");
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {
				int cid = resultSet.getInt("category_id");
				String category_name = resultSet.getString("category_name");
				String description = resultSet.getString("description");
				Date published_date = resultSet.getDate("published_date");
				categoryList.add(new Category(cid, category_name, description, published_date));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return categoryList;
	}

	
	
	public static Category getCategoryByCategoryId(int categoryid) {
		Category category = null;
		Connection connection = DatabaseConnection.getConnection();
		try {
			PreparedStatement ps = connection
					.prepareStatement("select * from categories where category_id=" + categoryid);
			ResultSet resultSet = ps.executeQuery();

			if (resultSet.next()) {
				category = new Category();

				category.setDescription(resultSet.getString("description"));
				category.setName(resultSet.getString("category_name"));
				category.setPublishedDate(resultSet.getTimestamp("published_date"));
				category.setStatus(resultSet.getInt("status"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return category;
	}
}
