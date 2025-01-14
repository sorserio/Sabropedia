package com.sabropedia.controllers;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sabropedia.models.LoginUsuario;
import com.sabropedia.models.LoginUsuarioComercio;
import com.sabropedia.models.Usuario;
import com.sabropedia.models.UsuarioComercio;
import com.sabropedia.services.ServicioUsuarios;
import com.sabropedia.services.ServicioUsuariosComercio;

@Controller
public class ControladorRecuperar {

    @Autowired
    private ServicioUsuarios servicioUsuarios;

    @Autowired
    private ServicioUsuariosComercio servicioUsuariosComercio;

    @GetMapping("/recuperar")
    public String recuperaContrasena(Model modelo) {
        modelo.addAttribute("loginUsuario", new LoginUsuario());
        return "reset.jsp";
    }

    @GetMapping("/recuperarLocal")
    public String recuperaContrasenaLocal(Model modelo) {
        modelo.addAttribute("loginUsuarioComercio", new LoginUsuarioComercio());
        return "resetComercio.jsp";
    }

    @PostMapping("/procesa/recuperar")
    public String procesarRecuperacion(@ModelAttribute("loginUsuario") LoginUsuario loginUsuario, Model modelo) {
        Usuario usuario = servicioUsuarios.obtenerPorEmail(loginUsuario.getEmail());
        if (usuario == null) {
            modelo.addAttribute("error", "El correo no está registrado.");
            return "reset.jsp";
        }

        if (loginUsuario.getContraseña() == null || loginUsuario.getContraseña().isEmpty()) {
            modelo.addAttribute("error", "Debe ingresar una nueva contraseña.");
            return "reset.jsp";
        }

        String hashedPassword = BCrypt.hashpw(loginUsuario.getContraseña(), BCrypt.gensalt());
        usuario.setContraseña(hashedPassword);
        servicioUsuarios.actualizar(usuario);

        modelo.addAttribute("mensaje", "Contraseña actualizada correctamente.");
        return "redirect:/login";
    }

    @PostMapping("/procesa/recuperarLocal")
    public String procesarRecuperacionLocal(@ModelAttribute("loginUsuarioComercio") LoginUsuarioComercio loginUsuarioComercio , Model modelo) {
        UsuarioComercio usuarioComercio = servicioUsuariosComercio.obtenerPorEmail(loginUsuarioComercio.getEmail());
        if (usuarioComercio == null) {
            modelo.addAttribute("error", "El correo no está registrado.");
            return "resetComercio.jsp";
        }

        if (loginUsuarioComercio.getContraseña() == null || loginUsuarioComercio.getContraseña().isEmpty()) {
            modelo.addAttribute("error", "Debe ingresar una nueva contraseña.");
            return "resetComercio.jsp";
        }

        String hashedPassword = BCrypt.hashpw(loginUsuarioComercio.getContraseña(), BCrypt.gensalt());
        usuarioComercio.setContraseña(hashedPassword);
        servicioUsuariosComercio.actualizar(usuarioComercio);

        modelo.addAttribute("mensaje", "Contraseña actualizada correctamente.");
        return "redirect:/loginLocal";
    }
}