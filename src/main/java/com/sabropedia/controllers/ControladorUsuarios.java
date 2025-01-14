package com.sabropedia.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sabropedia.models.LoginUsuario;
import com.sabropedia.models.LoginUsuarioComercio;
import com.sabropedia.models.Usuario;
import com.sabropedia.models.UsuarioComercio;
import com.sabropedia.services.ServicioUsuariosComercio;
import com.sabropedia.services.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
	@Autowired
	private ServicioUsuariosComercio servicioUsuariosComercio;
	

	
	@GetMapping("/")
	public String formRegistro(Model modelo) {
		modelo.addAttribute("usuario", new Usuario());
		return "registroPersona.jsp";
	}
	
	@GetMapping("/registroComercio")
	public String formRegistroComercio(Model modelo) {
		modelo.addAttribute("usuarioComercio", new UsuarioComercio());
		return "registroComercial.jsp";
	}
	
	@GetMapping("/login")
	public String formLogin(Model modelo){
		modelo.addAttribute("loginUsuario", new LoginUsuario());
		return "loginPersona.jsp";
	}
	
	@GetMapping("/loginLocal")
	public String formLoginComercio(Model modelo){
		modelo.addAttribute("loginUsuarioComercio", new LoginUsuarioComercio());
		return "loginComercio.jsp";
	}
	
	@GetMapping("/logout")
	public String logOut(HttpSession sesion) {
		sesion.invalidate();
		return "redirect:/";
		
	}
	
	
	@PostMapping("/procesa/registro")
	public String crearUsuario(@Valid @ModelAttribute("usuario") Usuario usuario,
	                           BindingResult validaciones, Model model, HttpSession sesion, @RequestParam("imagenPerfil") MultipartFile imagenPerfil) {
		this.servicioUsuarios.validarRegistro(validaciones, usuario);
	    if (validaciones.hasErrors()) {
	        return "registroPersona.jsp";
	    }
		try {
			if (!imagenPerfil.isEmpty()) {
				String nombreImg = ControladorImagenes.uploadImg(imagenPerfil);
				usuario.setPerfil(nombreImg);
			}
			servicioUsuarios.crear(usuario);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    sesion.setAttribute("idUsuario", usuario.getId());
		sesion.setAttribute("nombreCompleto", usuario.getNombre() + " " + usuario.getApellido());
	    return "redirect:/inicio";
	}

	
	@PostMapping("/procesa/login")
	public String login(@Valid @ModelAttribute("loginUsuario") LoginUsuario loginUsuario, BindingResult validaciones, Model modelo,
			HttpSession sesion) {
		this.servicioUsuarios.validarLogin(validaciones, loginUsuario);
		if (validaciones.hasErrors()) {
			return "loginPersona.jsp";
		}
		Usuario usuario = this.servicioUsuarios.obtenerPorEmail(loginUsuario.getEmail());
		sesion.setAttribute("nombreCompleto", usuario.getNombre() + " " + usuario.getApellido());
		sesion.setAttribute("idUsuario", usuario.getId());
		return "redirect:/inicio";
	}
	
	
	@PostMapping("/procesa/registroComercio")
	public String procesaRegistroLocal(@Valid @ModelAttribute("usuarioComercio") UsuarioComercio usuarioComercio, BindingResult validaciones, Model modelo, HttpSession sesion) {
		this.servicioUsuariosComercio.validarRegistro(validaciones, usuarioComercio);
		if (validaciones.hasErrors()) {
			return "registroComercial.jsp";
		}
		UsuarioComercio usuarioComercio2 = this.servicioUsuariosComercio.crear(usuarioComercio);
		sesion.setAttribute("nombreCompleto", usuarioComercio2.getNombre() + " " + usuarioComercio2.getApellido());
		sesion.setAttribute("idGerencial", usuarioComercio2.getId());
		return "redirect:/inicio";
	}
	
	@PostMapping("/procesa/loginComercio")
	public String loginComercio(@Valid @ModelAttribute("loginUsuarioComercio") LoginUsuarioComercio loginUsuarioComercio, BindingResult validaciones, Model modelo, HttpSession sesion) {
		this.servicioUsuariosComercio.validarLogin(validaciones, loginUsuarioComercio);
		if (validaciones.hasErrors()) {
			return "loginComercio.jsp";
		}
		UsuarioComercio usuarioComercio = this.servicioUsuariosComercio.obtenerPorEmail(loginUsuarioComercio.getEmail());
		sesion.setAttribute("nombreCompleto", usuarioComercio.getNombre() + " " + usuarioComercio.getApellido());
		sesion.setAttribute("idGerencial", usuarioComercio.getId());
		return "redirect:/inicio";
	}
	
	@GetMapping("/perfil/{id}")
	private String perfil(@PathVariable("id") Long id, HttpSession sesion, Model modelo, UsuarioComercio usuarioComercio) {
		if (sesion.getAttribute("idUsuario") == null) {
			return "redirect:/";
		}
		modelo.addAttribute("usuario", this.servicioUsuarios.obtenerPorId(id));
		return "perfil.jsp";
	}
	
}
