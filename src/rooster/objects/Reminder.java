package rooster.objects;
import java.sql.Date;

public class Reminder {
	
	private int id;
	private String username;
	private int project_id;
	private String title;
	private Date due_date;
	public byte getStatus() {
		return status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}

	private byte status;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getProject_id() {
		return project_id;
	}
	
	public void setProject_id(int project_id) {
		this.project_id = project_id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Date getDate() {
		return due_date;
	}
	
	public void setDate(Date date) {
		this.due_date = date;
	}
}

