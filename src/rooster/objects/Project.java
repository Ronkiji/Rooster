package rooster.objects;

public class Project {
	
	private int id;
	private String username;
	private String title;
	private String color;
	private String text;
	private int num_reminders;
	
	
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
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getColor() {
		return color;
	}
	
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public int getNum_reminders() {
		return num_reminders;
	}
	
	public void setNum_reminders(int num_reminders) {
		this.num_reminders = num_reminders;
	}
}
