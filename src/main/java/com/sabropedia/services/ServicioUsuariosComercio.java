package com.sabropedia.services;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.sabropedia.models.LoginUsuarioComercio;
import com.sabropedia.models.UsuarioComercio;
import com.sabropedia.repositories.RepositorioUsuariosComercio;

@Service
public class ServicioUsuariosComercio {
	
	@Autowired
	private RepositorioUsuariosComercio repositorioUsuariosComercio;
	
	public UsuarioComercio crear (UsuarioComercio usuarioComercio) {
		String hashPassword = BCrypt.hashpw(usuarioComercio.getContraseña(), BCrypt.gensalt());
		usuarioComercio.setContraseña(hashPassword);
		return this.repositorioUsuariosComercio.save(usuarioComercio);
	}
	
	public List<UsuarioComercio> obtenerTodosLosUsuarioComercios() {
		return (List<UsuarioComercio>)this.repositorioUsuariosComercio.findAll();
	}
	
	public UsuarioComercio obtenerPorId(Long id) {
		return this.repositorioUsuariosComercio.findById(id).orElse(null);
	}

	public UsuarioComercio obtenerPorEmail(String email) {
		return this.repositorioUsuariosComercio.findByEmail(email).orElse(null);
	}

	public UsuarioComercio actualizar(UsuarioComercio usuarioComercio) {
		return this.repositorioUsuariosComercio.save(usuarioComercio);
	}

	public void eliminarPorId(Long id) {
		this.repositorioUsuariosComercio.deleteById(id);
	}

	public BindingResult validarRegistro(BindingResult validaciones, UsuarioComercio usuarioComercio) {
		if (!usuarioComercio.getContraseña().equals(usuarioComercio.getConfirmarContraseña())) {
			validaciones.rejectValue("confirmarContraseña", "contraseñaNoCoincide", "La contraseñas no coinciden.");
		}
		return validaciones;
	}

	public BindingResult validarLogin(BindingResult validaciones, LoginUsuarioComercio usuarioComercio) {
		UsuarioComercio usuarioComercioDb = this.obtenerPorEmail(usuarioComercio.getEmail());
		if (usuarioComercioDb == null) {
			validaciones.rejectValue("correo", "correoNoRegistrado",
					"El correo electrónico ingresado no se encuentra en nuestra base de datos.");
		} else {
			if (!BCrypt.checkpw(usuarioComercio.getContraseña(), usuarioComercioDb.getContraseña())) {
				validaciones.rejectValue("contraseña", "contraseñaIncorrecta", "Contraseña incorrecta.");
			}
		}
		return validaciones;
	}

}
