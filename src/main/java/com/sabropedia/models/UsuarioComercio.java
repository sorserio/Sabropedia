package com.sabropedia.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "usuario_comercios")
public class UsuarioComercio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "Por favor proporciona tu nombre") 
	@Size(min = 3, message = "El nombre debe contener al menos 3 caracteres.")
	private String nombre;
	
	@NotBlank(message = "Por favor proporciona tu apellido") 
	@Size(min = 3, message = "El apellido debe contener al menos 3 caracteres.")
	private String apellido;
	
	@Column(unique = true)
	@NotBlank(message = "El campo es requerido")
	private String telefono;
	
	@Column(unique = true)
	@NotBlank(message = "El campo es requerido")
	@Email(message="Por favor ingresa un correo electronico valido")
	private String email;
	
	@NotBlank(message = "El campo es requerido")
	@Size(min= 8, message = "Debe contener al menos 8 caracteres")
	private String contraseña;
	
	@OneToOne(mappedBy = "gerente")
	private Comercio comercio;
	
	@Transient
	private String confirmarContraseña;

	public UsuarioComercio(Long id, String nombre, String apellido, String telefono, String email, String contraseña,
			String confirmarContraseña, Comercio comercio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.email = email;
		this.contraseña = contraseña;
		this.confirmarContraseña = confirmarContraseña;
		this.comercio = comercio;
	}
	
	public UsuarioComercio() {
		super();
		this.id = 0l;
		this.nombre = "";
		this.apellido = "";
		this.telefono = "";
		this.email = "";
		this.contraseña = "";
		this.confirmarContraseña = "";
		this.comercio = null;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
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

	public String getConfirmarContraseña() {
		return confirmarContraseña;
	}

	public void setConfirmarContraseña(String confirmarContraseña) {
		this.confirmarContraseña = confirmarContraseña;
	}

	public Comercio getComercio() {
		return comercio;
	}

	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}
	
	

}
