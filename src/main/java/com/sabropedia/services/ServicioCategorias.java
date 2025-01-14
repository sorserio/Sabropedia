package com.sabropedia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sabropedia.models.Categoria;
import com.sabropedia.repositories.RepositorioCategorias;

@Service
public class ServicioCategorias {

	@Autowired
	private RepositorioCategorias repositorioCategorias;
	
	public Categoria crear(Categoria categoria) {
		return this.repositorioCategorias.save(categoria);
	}

	public Categoria obtenerPorId(Long id) {
		return this.repositorioCategorias.findById(id).orElse(null);
	}

	public List<Categoria> obtenerTodasLasCategorias() {
		return (List<Categoria>) this.repositorioCategorias.findAll();
	}

	public Categoria actualizar(Categoria categoria) {
		return this.repositorioCategorias.save(categoria);
	}

	public void eliminarPorId(Long id) {
		this.repositorioCategorias.deleteById(id);
	}
}
