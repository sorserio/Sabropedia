package com.sabropedia.models;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="comentarios")
public class Comentario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 10, max = 400, message = "Debe contener entre 10 y 400 caracteres.")
	private String mensaje;
	
	@Min(value = 1, message = "El valor debe ser mayor a 1.")
	@Max(value = 5, message = "El valor debe ser menor a 5.")
	private Double calificacion;
	
	
	private String imagenReseña;
	
	@Transient
	private MultipartFile imagen;

	@ManyToOne
	@JoinColumn(name = "id_comercio")
	private Comercio comercio;
	
	@ManyToOne
	@JoinColumn(name= "id_usuario")
	private Usuario creador;
	

	public Comentario(Long id, String mensaje, Double calificacion, String imagenReseña,Comercio comercio, Usuario creador) {
		super();
		this.id = id;
		this.mensaje = mensaje;
		this.calificacion = calificacion;
		this.imagenReseña = imagenReseña;
		this.comercio = comercio;
		this.creador = creador;
	}
	
	public Comentario() {
		super();
		this.id = 0l;
		this.mensaje = "";
		this.calificacion = 0.0;
		this.imagenReseña = null;
		this.comercio = null;
		this.creador = null;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public double getCalificacion() {
		return calificacion;
	}

	public void setCalificacion(Double calificacion) {
		this.calificacion = calificacion;
	}


	public Usuario getCreador() {
		return creador;
	}

	public void setCreador(Usuario creador) {
		this.creador = creador;
	}


	public Comercio getComercio() {
		return comercio;
	}

	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}

	public String getImagenReseña() {
		return imagenReseña;
	}

	public void setImagenReseña(String imagenReseña) {
		this.imagenReseña = imagenReseña;
	}

	public MultipartFile getImagen() {
		return imagen;
	}

	public void setImagen(MultipartFile imagen) {
		this.imagen = imagen;
	}

	
	
	
	
	
	
}
