package rooster.objects;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;

public class ReminderDAO {

	Connection con = null;
	User user;
	Project project;

	public void setUser(User user) {
		this.user = user;
		System.out.println("Username in void method of ReminderDAO class is: " + user.getUsername());
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public boolean createReminder(Reminder reminder) {

		System.out.println("Username in the ReminderDAO class is: " + user.getUsername());

		String username = user.getUsername();
		int project_id = project.getId();
		String title = reminder.getTitle();
		Date date = reminder.getDate();
		int id = -1;

		con = DBConnection.createConnection();

		try {
			String query = "INSERT INTO rooster.reminder(username, project_id, title, due_date) VALUES (?, ?, ?, ?)";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, username);
			pst.setInt(2, project_id);
			pst.setString(3, title);
			pst.setDate(4, date);

			int x = pst.executeUpdate();

			ResultSet rs = pst.getGeneratedKeys(); // dunno where to use this
			if (rs.next()) {
				id = rs.getInt(1);
			}
			
			reminder.setId(id);

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("New reminder properly inserted into the database.");
				con.close();
				return true;
			} else {
				System.out.println("New reminder failed to insert into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public Reminder[] getReminderArray(int project_id, int status) {

		int length = 0;

		try { // retrieving # of rows in the rooster.project database
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT count(*) FROM rooster.reminder WHERE project_id = '" + project_id + "' AND status = '" + status + "'");
			if (rs.next()) {
				length = rs.getInt(1);
			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (length > 0) {
			Reminder[] reminder = new Reminder[length];

			try {
				Connection con = DBConnection.createConnection();
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM rooster.reminder WHERE project_id = '"
						+ project_id + "' AND status = '" + status + "' ORDER BY due_date IS NULL, due_date");
				ResultSet rs = stmt.executeQuery();

				for (int i = 0; rs.next() == true; i++) {
					reminder[i] = new Reminder();
					reminder[i].setId(Integer.parseInt(rs.getString(1)));
					reminder[i].setUsername(rs.getString(2));
					reminder[i].setProject_id(Integer.parseInt(rs.getString(3)));
					reminder[i].setTitle(rs.getString(4));
					if (rs.getString(5) != null) {
						reminder[i].setDate(Date.valueOf(rs.getString(5)));
					} else {
						reminder[i].setDate(null);
					}
					reminder[i].setStatus((byte) (Integer.parseInt(rs.getString(6))));
					
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return reminder;
		} else {
			return null;
		}
	}

	public Reminder[] getReminderArray(int status) {

		int length = 0;

		try { // retrieving # of rows in the rooster.project database
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT count(*) FROM rooster.reminder WHERE username = '"+ user.getUsername() + "' AND status = '" + status + "'");
			if (rs.next()) {
				length = rs.getInt(1);
			}

			con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (length > 0) {
			Reminder[] reminder = new Reminder[length];

			try {
				Connection con = DBConnection.createConnection();
				PreparedStatement stmt = con.prepareStatement("SELECT * FROM rooster.reminder WHERE username = '"
						+ user.getUsername() + "' AND status = '" + status + "' ORDER BY due_date IS NULL, due_date");
				ResultSet rs = stmt.executeQuery();

				for (int i = 0; rs.next() == true; i++) {
					reminder[i] = new Reminder();
					reminder[i].setId(Integer.parseInt(rs.getString(1)));
					reminder[i].setUsername(rs.getString(2));
					reminder[i].setProject_id(Integer.parseInt(rs.getString(3)));
					reminder[i].setTitle(rs.getString(4));
					if (rs.getString(5) != null) {
						reminder[i].setDate(Date.valueOf(rs.getString(5)));
					} else {
						reminder[i].setDate(null);
					}
					reminder[i].setStatus((byte) (Integer.parseInt(rs.getString(6))));

				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return reminder;
		} else {
			return null;
		}
	}
	public boolean completeReminder(int id) {

		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.reminder SET status = 1 WHERE id = '" + id + "' ";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Reminder set to complete in the database.");
				con.close();
				return true;
			} else {
				System.out.println("Reminder failed to set to complete in the database.");
				con.close();
				return false;
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	public boolean deleteReminder(int id) {

		con = DBConnection.createConnection();

		try {
			String query = "DELETE FROM rooster.reminder WHERE id = '" + id + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Reminder deleted from the database.");
				con.close();
				return true;
			} else {
				System.out.println("Reminder failed to delete from the database.");
				con.close();
				return false;
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
	
	public boolean deleteReminderByProject(int project_id) {

		con = DBConnection.createConnection();

		try {
			String query = "DELETE FROM rooster.reminder WHERE project_id = '" + project_id + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Reminders deleted from the database.");
				con.close();
				return true;
			} else {
				System.out.println("Reminders failed to delete from the database.");
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
