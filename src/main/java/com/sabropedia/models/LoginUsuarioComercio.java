package com.sabropedia.models;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public class LoginUsuarioComercio {
	
	@NotBlank(message = "El campo es requerido")
	@Email(message="Por favor ingresa un correo electronico valido")
	private String email;
	
	@NotBlank(message = "El campo es requerido")
	@Size(min= 8, message = "Debe contener al menos 8 caracteres")
	private String contraseña;

	public LoginUsuarioComercio(String email, String contraseña) {
		super();
		this.email = email;
		this.contraseña = contraseña;
	}
	
	public LoginUsuarioComercio() {
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
