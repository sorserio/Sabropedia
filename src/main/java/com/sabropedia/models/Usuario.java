package com.sabropedia.models;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name= "usuarios")
public class Usuario {
	
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
	@Email(message="Por favor ingresa un correo electronico valido")
	private String email;
	
	@NotBlank(message = "El campo es requerido")
	@Size(min= 8, message = "Debe contener al menos 8 caracteres")
	private String contraseña;
	
	@Transient
	private String confirmarContraseña;
	
	@Transient
	private MultipartFile imagenPerfil;
	
	private String perfil;
	
	@OneToMany(mappedBy = "creador")
	private List<Comentario> comentarios;

	public Usuario(Long id, String nombre, String apellido, String email, String contraseña,
			String confirmarContraseña, String perfil, List<Comentario> comentarios) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
		this.contraseña = contraseña;
		this.confirmarContraseña = confirmarContraseña;
		this.perfil = perfil;
		this.comentarios = comentarios;
	}
	
	public Usuario() {
		super();
		this.id = 0l;
		this.nombre = "";
		this.apellido = "";
		this.email = "";
		this.contraseña = "";
		this.confirmarContraseña = "";
		this.perfil = "";
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

	public String getPerfil() {
		return perfil;
	}

	public void setPerfil(String perfil) {
		this.perfil = perfil;
	}

	public MultipartFile getImagenPerfil() {
		return imagenPerfil;
	}

	public void setImagenPerfil(MultipartFile imagenPerfil) {
		this.imagenPerfil = imagenPerfil;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	
	
	

}
