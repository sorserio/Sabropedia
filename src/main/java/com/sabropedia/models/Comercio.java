package com.sabropedia.models;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="comercio")
public class Comercio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(unique = true)
	@NotBlank(message = "Por favor proporcione el nombre de su comercio")
	@Size(min = 5, message = "El titulo debe tener como minimo 5 caracteres" )
	private String nombreComercio;
	
	@NotBlank(message = "Por favor proporcione la descripcion de su local")
	@Size(min = 10, message = "La descripcion debe tener como minimo 10 caracteres" )
	private String descripcion;
	
	@NotBlank(message = "Por favor proporcione la direccion de su local")
	@Size(min = 10, message = "La direccion debe tener como minimo 10 caracteres" )
	private String direccion;
	
	private double calificacionPromedio;
	
	@OneToMany
	@JoinTable(name = "comercios_categorias", joinColumns = @JoinColumn(name = "id_categoria"), inverseJoinColumns = @JoinColumn(name = "id_comercio"))
    private List<Categoria> categoria;
	
	private String imagenComercio;
	
	private String imagenLogo;
	
	private List<String> imagenesGaleria;
	
	@Transient
	private MultipartFile imagenComercioTransient;
	
	@Transient
	private MultipartFile imagenLogoTransient;
	
	@Transient
	private List<MultipartFile> imagenGaleriaTransient;
	
	@OneToOne
	@JoinColumn(name= "id_usuario")
	private UsuarioComercio gerente;
	
	@OneToMany(mappedBy = "comercio", cascade = CascadeType.ALL)
	private List<Comentario> comentarios;

	public Comercio(Long id, String nombreComercio, String descripcion, String direccion, double calificacionPromedio,List<Categoria> categoria, String imagenComercio,
			String imagenLogo, List<String> imagenesGaleria, UsuarioComercio gerente, List<Comentario> comentarios) {
		super();
		this.id = id;
		this.nombreComercio = nombreComercio;
		this.descripcion = descripcion;
		this.direccion = direccion;
		this.calificacionPromedio = calificacionPromedio;
		this.categoria = categoria;
		this.imagenComercio = imagenComercio;
		this.imagenLogo = imagenLogo;
		this.imagenesGaleria = imagenesGaleria;
		this.gerente = gerente;
		this.comentarios = comentarios;
	}
	
	public Comercio() {
		this.id = 0l;
		this.nombreComercio = "";
		this.descripcion = "";
		this.direccion = "";
		this.calificacionPromedio = 0;
		this.categoria = null;
		this.imagenComercio = null;
		this.imagenLogo = null;
		this.imagenesGaleria = null;
		this.gerente = null;
		this.comentarios = null;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombreComercio() {
		return nombreComercio;
	}

	public void setNombreComercio(String nombreComercio) {
		this.nombreComercio = nombreComercio;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public List<Categoria> getCategoria() {
		return categoria;
	}

	public void setCategoria(List<Categoria> categoria) {
		this.categoria = categoria;
	}

	public UsuarioComercio getGerente() {
		return gerente;
	}

	public void setGerente(UsuarioComercio gerente) {
		this.gerente = gerente;
	}

	public String getImagenComercio() {
		return imagenComercio;
	}

	public void setImagenComercio(String imagenComercio) {
		this.imagenComercio = imagenComercio;
	}

	public String getImagenLogo() {
		return imagenLogo;
	}

	public void setImagenLogo(String imagenLogo) {
		this.imagenLogo = imagenLogo;
	}


	public MultipartFile getImagenComercioTransient() {
		return imagenComercioTransient;
	}

	public void setImagenComercioTransient(MultipartFile imagenComercioTransient) {
		this.imagenComercioTransient = imagenComercioTransient;
	}

	public MultipartFile getImagenLogoTransient() {
		return imagenLogoTransient;
	}

	public void setImagenLogoTransient(MultipartFile imagenLogoTransient) {
		this.imagenLogoTransient = imagenLogoTransient;
	}

	public List<String> getImagenesGaleria() {
		return imagenesGaleria;
	}

	public void setImagenesGaleria(List<String> imagenesGaleria) {
		this.imagenesGaleria = imagenesGaleria;
	}

	public List<MultipartFile> getImagenGaleriaTransient() {
		return imagenGaleriaTransient;
	}

	public void setImagenGaleriaTransient(List<MultipartFile> imagenGaleriaTransient) {
		this.imagenGaleriaTransient = imagenGaleriaTransient;
	}
	
	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	public double getCalificacionPromedio() {
        return calificacionPromedio;
    }

    public void setCalificacionPromedio(double calificacionPromedio) {
        this.calificacionPromedio = calificacionPromedio;
    }

    public void actualizarCalificacionPromedio() {
        if (comentarios != null && !comentarios.isEmpty()) {
            double suma = comentarios.stream().mapToDouble(Comentario::getCalificacion).sum();
            this.calificacionPromedio = suma / comentarios.size();
        } else {
            this.calificacionPromedio = 0;
        }
    }
}
	
	
