package rooster.objects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ProjectDAO {

	Connection con = null;
	User user;

	public void setUser(User user) {
		this.user = user;
		System.out.println("Username in void method of ProjectDAO class is: " + user.getUsername());
	}

	public boolean createProject(Project project) {

		System.out.println("Username in the ProjectDAO class is: " + user.getUsername());

		String username = user.getUsername();
		String title = project.getTitle();
		String color = project.getColor();

		int id = -1;

		con = DBConnection.createConnection();

		try {
			String query = "INSERT INTO rooster.project(username, title, color) VALUES (?, ?, ?)";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, username);
			pst.setString(2, title);
			pst.setString(3, color);

			int x = pst.executeUpdate();

			ResultSet rs = pst.getGeneratedKeys(); // dunno where to use this
			if (rs.next()) {
				id = rs.getInt(1);
			}

			project.setId(id);

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("New project properly inserted into the database.");
				con.close();
				return true;
			} else {
				System.out.println("New project failed to insert into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public Project autofill(Project project, int id) {
		

		try {
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM rooster.project WHERE id = '" + id + "'");
			while (rs.next()) {
				project.setId(Integer.parseInt(rs.getString(1)));
				project.setUsername(rs.getString(2));
				project.setTitle(rs.getString(3));
				project.setColor(rs.getString(4));
				project.setText(rs.getString(5));
				project.setNum_reminders(Integer.parseInt(rs.getString(6)));
			}
			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return project;
	}

	public Project[] getProjectArray(String username) {

		int length = 0;

		try { // retrieving # of rows in the rooster.project database
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT count(*) FROM rooster.project WHERE username = '" + username + "'");
			if (rs.next()) {
				length = rs.getInt(1);
			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Project[] project = new Project[length];

		try {
			Connection con = DBConnection.createConnection();
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM rooster.project WHERE username = '" + username + "'");
			ResultSet rs = stmt.executeQuery();

			for (int i = 0; rs.next() == true; i++) {
				project[i] = new Project();
				project[i].setId(Integer.parseInt(rs.getString(1)));
				project[i].setUsername(rs.getString(2));
				project[i].setTitle(rs.getString(3));
				project[i].setColor(rs.getString(4));
				project[i].setText(rs.getString(5));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return project;
	}

	public boolean authenticateProject(String username, int id) {
		try {
			Connection con = DBConnection.createConnection();
			PreparedStatement stmt = con.prepareStatement(
					"SELECT * FROM rooster.project WHERE username = '" + username + "' AND id = '" + id + "'");
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean saveText(Project project, String text) {

		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.project SET text = '" + text + "' WHERE id = '" + project.getId()
					+ "' AND username = '" + project.getUsername() + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Text properly saved into the database.");
				con.close();
				return true;
			} else {
				System.out.println("Text failed to save into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean updateTitle(Project project, String title) {

		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.project SET title = '" + title + "' WHERE id = '" + project.getId()
					+ "' AND username = '" + project.getUsername() + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Title properly updated into the database.");
				con.close();
				return true;
			} else {
				System.out.println("Title failed to save into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	public boolean deleteProject(int id) {

		con = DBConnection.createConnection();
		
		
		
		
		try {
			String query = "DELETE FROM rooster.project WHERE id = '" + id + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Project deleted from the database.");
				con.close();
				return true;
			} else {
				System.out.println("Project failed to delete from the database.");
				con.close();
				return false;
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

}
