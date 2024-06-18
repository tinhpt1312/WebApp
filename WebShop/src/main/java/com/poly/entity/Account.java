package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {

	@Id
	@NotBlank
	private String username;
	@NotBlank
	private String password;
	private String fullname;
	@NotBlank
	@Email
	private String email;
	private String photo;
	private Boolean activated;
	private Boolean admin;
	
	@OneToMany(mappedBy = "account")
	List<Order> orders;

}
