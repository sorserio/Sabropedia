package com.sabropedia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sabropedia.models.Comentario;
import com.sabropedia.models.Comercio;
import com.sabropedia.repositories.RepositorioComentarios;
import com.sabropedia.repositories.RepositorioComercios;

@Service
public class ServicioComentarios {
	
	@Autowired
	private RepositorioComentarios repositorioComentarios;
	
	@Autowired 
	private RepositorioComercios repositorioComercios;
	
    public Comentario crear(Comentario comentario) {
        Comentario nuevoComentario = this.repositorioComentarios.save(comentario);
        actualizarCalificacionComercio(comentario.getComercio());
        return nuevoComentario;
    }

    public Comentario obtenerPorId(Long id) {
        return this.repositorioComentarios.findById(id).orElse(null);
    }

    public List<Comentario> obtenerTodos() {
        return (List<Comentario>) this.repositorioComentarios.findAll();
    }

    public Comentario actualizar(Comentario comentario) {
        Comentario comentarioActualizado = this.repositorioComentarios.save(comentario);
        actualizarCalificacionComercio(comentario.getComercio());
        return comentarioActualizado;
    }

    public void eliminarPorId(Long id) {
        Comentario comentario = this.repositorioComentarios.findById(id)
                .orElseThrow(() -> new RuntimeException("Comentario no encontrado"));
        Comercio comercio = comentario.getComercio();
        this.repositorioComentarios.deleteById(id);
        actualizarCalificacionComercio(comercio);
    }

    private void actualizarCalificacionComercio(Comercio comercio) {
        if (comercio != null) {
            List<Comentario> comentarios = repositorioComentarios.findByComercio(comercio);
            if (comentarios != null && !comentarios.isEmpty()) {
                double promedio = comentarios.stream()
                        .mapToDouble(Comentario::getCalificacion)
                        .average()
                        .orElse(0.0);
                comercio.setCalificacionPromedio(promedio);
            } else {
                comercio.setCalificacionPromedio(0.0);
            }
            repositorioComercios.save(comercio);
        }
    }

}