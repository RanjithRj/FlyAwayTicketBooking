package in.co.fly.away.ticket.bean;

//import java.sql.Timestamp;
//import java.util.Date;

public class UserBean extends BaseBean {

	
	private String firstName;
	private String lastName;
	private String login;
	private String password;
	private String confirmPassword;
	private long roleId;
	

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	
	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}


	public String getKey() {
		return id + "";
	}

	public String getValue() {

		return firstName + " " + lastName;
	}
}
