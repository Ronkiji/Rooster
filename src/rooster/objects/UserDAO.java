package rooster.objects;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {

	Connection con = null;

	public boolean registerUser(User user) {
		String name = user.getName();
		String username = user.getUsername();
		String password = user.getPassword();
		String confirmpw = user.getConfirmPassword();

		if (password.equals(confirmpw)) {
			try {
				con = DBConnection.createConnection();
				Statement stmt;
				stmt = con.createStatement();
				ResultSet rs = stmt
						.executeQuery("SELECT username FROM rooster.user WHERE username = '" + username + "'");

				if (!rs.next()) {
					PreparedStatement pst = null;
					String query = "INSERT INTO rooster.user(username, name, password) VALUES (?, ?, ?)";
					pst = con.prepareStatement(query);
					pst.setString(1, username);
					pst.setString(2, name);
					pst.setString(3, password);
					
					int x = pst.executeUpdate();
					if (x > 0) { // If properly inserted, set response status to success
						System.out.println("New user properly inserted into the database");
						return true;
					} else {
						System.out.println("New user failed to insert into the database.");
						return false;
					}
				} else {
					System.out.println("New user failed to insert into the database.");
					return false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("New user's password and confirm password do not match.");
		return false;
	}
	
	public boolean authenticateUser(User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		if(username != null && password != null) {

			try { // this is for login - extracting information from database
				con = DBConnection.createConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT username, password FROM rooster.user WHERE username = '"+username+"' and password = BINARY '"+password+"'");
				
				if(rs.next()) {
					System.out.println("User found in the database, login sucessful.");
					con.close();
					return true;				
				} else {
					System.out.println("User credentials not found in database.");
					con.close();
					return false;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("Either user's username or password is null.");
		return false;
	}
	
	public User autofill(User user, String username) { // this will fill all the remaining information about the user

		try {
			Connection con = DBConnection.createConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT * FROM rooster.user WHERE username = '" + username + "'");
			while(rs.next()) {
				user.setUsername(rs.getString(1));
				user.setName(rs.getString(2));
				user.setDarkmode(rs.getByte(4));
				user.setIcon(rs.getString(5));
			}
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public boolean updateName(User user, String name) {
		
		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.user SET name = '" + name + "' WHERE username = '" + user.getUsername() + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Name properly saved into the database.");
				con.close();
				return true;
			} else {
				System.out.println("Name failed to save into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	public boolean updatePfp(User user, String pfp) {
		
		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.user SET icon = '" + pfp + "' WHERE username = '" + user.getUsername() + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Pfp properly saved into the database.");
				con.close();
				return true;
			} else {
				System.out.println("Pfp failed to save into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public void deleteUser(User user) {

	}
	
	public boolean changeMode(User user, int mode) {
		System.out.println("ran the changeMode function");
		con = DBConnection.createConnection();

		try {
			String query = "UPDATE rooster.user SET darkmode = '" + mode + "' WHERE username = '" + user.getUsername() + "'";
			PreparedStatement pst = null;
			pst = con.prepareStatement(query);

			int x = pst.executeUpdate();

			if (x > 0) { // If properly inserted, set response status to success
				System.out.println("Pfp properly saved into the database.");
				con.close();
				return true;
			} else {
				System.out.println("Pfp failed to save into the database.");
				con.close();
				return false;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("changeMode returned failed");

		return false;
	}
}
