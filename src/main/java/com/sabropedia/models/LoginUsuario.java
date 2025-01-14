package com.sabropedia.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class LoginUsuario {

	@NotBlank(message = "El campo es requerido.")
	@Email(message = "Por favor ingresa un correo electrónico válido.")
	private String email;

	@NotBlank(message = "El campo es requerido.")
	@Size(min = 8, message = "Debe contener al menos 8 caracteres.")
	private String contraseña;

	public LoginUsuario(String email, String contraseña) {
		super();
		this.email = email;
		this.contraseña = contraseña;
	}
	
	public LoginUsuario() {
		super();
		this.email = "";
		this.contraseña = "";
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	
	
	
	
}
