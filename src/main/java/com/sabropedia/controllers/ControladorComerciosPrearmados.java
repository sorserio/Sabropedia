package com.sabropedia.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.sabropedia.models.Comentario;
import com.sabropedia.services.ServicioCategorias;
import com.sabropedia.services.ServicioComentarios;
import com.sabropedia.services.ServicioComercios;
import com.sabropedia.services.ServicioUsuarios;
import com.sabropedia.services.ServicioUsuariosComercio;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorComerciosPrearmados {

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
	
	@GetMapping("/perfilLocal")
	public String local1(HttpSession sesion, Model modelo) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("categorias", this.servicioCategorias.obtenerTodasLasCategorias());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "perfilLocal.jsp";
		
	}
	
	@GetMapping("/perfilLocal2")
	public String local2(HttpSession sesion, Model modelo) {
		modelo.addAttribute("comercios", this.servicioComercios.obtenerTodosLosComercios());
		modelo.addAttribute("categorias", this.servicioCategorias.obtenerTodasLasCategorias());
		modelo.addAttribute("gerentes", this.servicioUsuariosComercio.obtenerTodosLosUsuarioComercios());
		modelo.addAttribute("usuarios", this.servicioUsuarios.obtenerTodosLosUsuarios());
		return "perfilLocal2.jsp";
		
	}
	
}
