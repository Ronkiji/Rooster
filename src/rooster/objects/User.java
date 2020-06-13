package rooster.objects;

public class User {
	
	private String name;
	private String username;
	private String password;
	private String confirmPassword;
	private String icon;
	private byte darkmode;
	
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public byte getDarkmode() {
		return darkmode;
	}

	public void setDarkmode(byte darkmode) {
		this.darkmode = darkmode;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
}
