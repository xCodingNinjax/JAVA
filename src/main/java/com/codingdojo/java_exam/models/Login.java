package com.codingdojo.java_exam.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;


public class Login {

	@NotEmpty(message="Email is required")
    @Email(message="Please enter a valid email")
    private String email;
    
    @NotEmpty(message="Password is required")
    private String password;
    
    public Login() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}
