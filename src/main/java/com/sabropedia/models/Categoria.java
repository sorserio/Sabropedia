package com.sabropedia.models;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "categorias")
public class Categoria {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank
	private String nombre;
	
	@ManyToOne
	@JoinTable(name = "comercios_categorias", joinColumns = @JoinColumn(name = "id_categoria"), inverseJoinColumns = @JoinColumn(name = "id_comercio"))
	@Transient
	private Comercio comercio;

	public Categoria(Long id, String nombre, Comercio comercio) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.comercio = comercio;
	}
	
	public Categoria() {
		this.id = 0l;
		this.nombre = "";
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

	public Comercio getComercio() {
		return comercio;
	}

	public void setComercio(Comercio comercio) {
		this.comercio = comercio;
	}
	
	
	
}
