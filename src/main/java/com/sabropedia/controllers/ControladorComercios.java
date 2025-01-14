package com.sabropedia.controllers;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sabropedia.models.Categoria;
import com.sabropedia.models.Comentario;
import com.sabropedia.models.Comercio;
import com.sabropedia.models.UsuarioComercio;
import com.sabropedia.services.ServicioCategorias;
import com.sabropedia.services.ServicioComentarios;
import com.sabropedia.services.ServicioComercios;
import com.sabropedia.services.ServicioUsuarios;
import com.sabropedia.services.ServicioUsuariosComercio;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorComercios {
	
	@Autowired
	private ServicioComercios servicioComercios;
	
	@Autowired 
	private ServicioUsuariosComercio servicioUsuariosComercio;
	
	@Autowired
	private ServicioCategorias servicioCategorias;
	
	@Autowired
	private ServicioComentarios servicioComentarios;
	
	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
	@GetMapping("/inicio")
	private String prueba(HttpSession sesion, Model modelo) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("categorias", this.servicioCategorias.obtenerTodasLasCategorias());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "index.jsp";
	}
	
	@GetMapping("/categorias/{id}")
	public String categorias(@PathVariable("id") Long id, Model modelo) {
	    Categoria categoriaSeleccionada = this.servicioCategorias.obtenerPorId(id);
	    List<Comercio> comerciosFiltrados = this.servicioComercios.obtenerTodosLosComercios().stream()
	        .filter(comercio -> comercio.getCategoria().stream()
	            .anyMatch(categoria -> categoria.getId().equals(categoriaSeleccionada.getId())))
	        .collect(Collectors.toList());

	    modelo.addAttribute("categoria", categoriaSeleccionada);
	    modelo.addAttribute("categorias", this.servicioCategorias.obtenerTodasLasCategorias());
	    modelo.addAttribute("comercios", comerciosFiltrados);

	    return "categorias.jsp";
	}
	
	@GetMapping("/restaurantes")
	private String restaurantes(HttpSession sesion, Model modelo, UsuarioComercio usuarioComercio) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "restaurantes.jsp";
	}
	
	@GetMapping("/heladerias")
	private String heladerias(HttpSession sesion, Model modelo, UsuarioComercio usuarioComercio) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "heladerias.jsp";
	}

	
	@GetMapping("/cafeterias")
	private String cafeterias(HttpSession sesion, Model modelo, UsuarioComercio usuarioComercio) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "cafeterias.jsp";
	}
	
	@GetMapping("/foodtrucks")
	private String foodTrucks(HttpSession sesion, Model modelo, UsuarioComercio usuarioComercio) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "foodtrucks.jsp";
	}
	
	
	@GetMapping("/form/agregar")
	public String agregar(HttpSession sesion, Model modelo) {
		if (sesion.getAttribute("idGerencial") == null) {
			return "redirect:/";
		}
		modelo.addAttribute("comercio", new Comercio());
		modelo.addAttribute("categorias", servicioCategorias.obtenerTodasLasCategorias());
		return "agregar.jsp";
	}
	
	@GetMapping("/form/editar/{id}")
	public String editar(@PathVariable("id") Long id, HttpSession sesion, Model modelo, @ModelAttribute("comercio") Comercio comercio) {
		if (sesion.getAttribute("idGerencial") == null) {
			return "redirect:/";
		}
		modelo.addAttribute("comercio", this.servicioComercios.obtenerPorId(id));
		return "editar.jsp";
	}
	
	@PostMapping("/guardar")
	public String guardar(
	        HttpSession sesion,
	        @Valid @ModelAttribute("comercio") Comercio comercio,
	        BindingResult validaciones,
	        Model modelo,
	        @RequestParam("imagenComercioTransient") MultipartFile imagenComercioTransient,
	        @RequestParam("imagenLogoTransient") MultipartFile imagenLogoTransient,
	        @RequestParam("imagenGaleriaTransient") List<MultipartFile> imagenGaleriaTransient) {

	    if (sesion.getAttribute("idGerencial") == null) {
	        return "redirect:/";
	    }
	    if (validaciones.hasErrors()) {
	        modelo.addAttribute("categorias", servicioCategorias.obtenerTodasLasCategorias());
	        return "agregar.jsp";
	    }
	    if (imagenComercioTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenComercio", "Debe subir una imagen para el comercio.");
	        return "agregar.jsp";
	    }

	    if (imagenLogoTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenLogo", "Debe subir un logo.");
	        return "agregar.jsp";
	    }

	    if (imagenGaleriaTransient == null || imagenGaleriaTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenGaleria", "Debe subir al menos una imagen para la galería.");
	        return "agregar.jsp";
	    }

	    try {

	        if (!imagenComercioTransient.isEmpty()) {
	            String nombreImg = ControladorImagenes.uploadImg(imagenComercioTransient);
	            comercio.setImagenComercio(nombreImg);
	        }

	        if (!imagenLogoTransient.isEmpty()) {
	            String nombreImg = ControladorImagenes.uploadImg(imagenLogoTransient);
	            comercio.setImagenLogo(nombreImg);
	        }

	        if (!imagenGaleriaTransient.isEmpty()) {
	            List<String> rutasGaleria = ControladorImagenes.uploadImgs(imagenGaleriaTransient);
	            comercio.setImagenesGaleria(rutasGaleria);
	        }
	        this.servicioComercios.crear(comercio);
	    } catch (Exception e) {
	        e.printStackTrace();
	        modelo.addAttribute("error", "Error al procesar las imágenes. Inténtelo nuevamente.");
	        modelo.addAttribute("categorias", servicioCategorias.obtenerTodasLasCategorias());
	        return "agregar.jsp";
	    }

	    return "redirect:/inicio";
	}
	
	@PutMapping("/actualizar/{id}")
	public String actualizar(@PathVariable("id") Long id, HttpSession sesion, @Valid @ModelAttribute("local") Comercio comercio, BindingResult validaciones, Model modelo,
			@RequestParam("imagenComercioTransient") MultipartFile imagenComercioTransient,
	        @RequestParam("imagenLogoTransient") MultipartFile imagenLogoTransient,
	        @RequestParam("imagenGaleriaTransient") List<MultipartFile> imagenGaleriaTransient) {
		if (sesion.getAttribute("idGerencial") == null) {
			return "redirect:/";
		}
		if(validaciones.hasErrors()) {
			return "editar.jsp";
		}
	    if (imagenComercioTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenComercio", "Debe subir una imagen para el comercio.");
	        return "agregar.jsp";
	    }

	    if (imagenLogoTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenLogo", "Debe subir un logo.");
	        return "agregar.jsp";
	    }

	    if (imagenGaleriaTransient == null || imagenGaleriaTransient.isEmpty()) {
	        modelo.addAttribute("errorImagenGaleria", "Debe subir al menos una imagen para la galería.");
	        return "agregar.jsp";
	    }

	    try {
	        if (!imagenComercioTransient.isEmpty()) {
	            String nombreImg = ControladorImagenes.uploadImg(imagenComercioTransient);
	            comercio.setImagenComercio(nombreImg);
	        }

	        if (!imagenLogoTransient.isEmpty()) {
	            String nombreImg = ControladorImagenes.uploadImg(imagenLogoTransient);
	            comercio.setImagenLogo(nombreImg);
	        }

	        if (!imagenGaleriaTransient.isEmpty()) {
	            List<String> rutasGaleria = ControladorImagenes.uploadImgs(imagenGaleriaTransient);
	            comercio.setImagenesGaleria(rutasGaleria);
	        }
	        this.servicioComercios.actualizar(comercio);
	    } catch (Exception e) {
	        e.printStackTrace();
	        modelo.addAttribute("error", "Error al procesar las imágenes. Inténtelo nuevamente.");
	        modelo.addAttribute("categorias", servicioCategorias.obtenerTodasLasCategorias());
	        return "agregar.jsp";
	    }
		return "redirect:/inicio";
		
		
	}
	
	@DeleteMapping("/eliminar/{id}")
	public String eliminar(@PathVariable("id") Long id, HttpSession sesion) {
		if (sesion.getAttribute("idGerencial") == null) {
			return "redirect:/";
		}
		this.servicioComercios.eliminarPorId(id);
		return "redirect:/";
		
	}
	
	@GetMapping("/detalle/{id}")
	public String detalle(@PathVariable("id") Long id, HttpSession sesion, Model modelo) {
		modelo.addAttribute("comercio", this.servicioComercios.obtenerPorId(id));
		modelo.addAttribute("comentario", new Comentario());
		return "detalles.jsp";
		
	}
	
	@GetMapping("/form/comentar/{id}")
	public String comentar(@PathVariable("id") Long id, HttpSession sesion, Model modelo) {
		if (sesion.getAttribute("nombreCompleto") == null) {
			return "redirect:/";
		}
		modelo.addAttribute("local", this.servicioComercios.obtenerPorId(id));
		modelo.addAttribute("comentario", new Comentario());
		return "comentar.jsp";
	}	
		
	@PostMapping("/comentar")
	public String comentar(HttpSession sesion, @Valid @ModelAttribute("comentario") Comentario comentario, BindingResult validaciones, @RequestParam("imagen") MultipartFile imagen) {
		if (sesion.getAttribute("nombreCompleto") == null) {
			return "redirect:/";
		}
		if(validaciones.hasErrors()) {
			return "detalles.jsp";
		}
		try {
			if (!imagen.isEmpty()) {
				String nombreImg = ControladorImagenes.uploadImg(imagen);
				comentario.setImagenReseña(nombreImg);
			}
			servicioComentarios.crear(comentario);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/inicio";
	}

}
