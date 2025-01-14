package com.sabropedia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sabropedia.models.Comercio;
import com.sabropedia.repositories.RepositorioComercios;

@Service
public class ServicioComercios {
	
	@Autowired
	private RepositorioComercios repositorioComercios;
	
	public Comercio crear(Comercio comercio) {
		return this.repositorioComercios.save(comercio);
	}
	
	public Comercio obtenerPorId(Long id) {
		return this.repositorioComercios.findById(id).orElse(null);
	}

	public List<Comercio> obtenerTodosLosComercios() {
		return (List<Comercio>) this.repositorioComercios.findAll();
	}

	public Comercio actualizar(Comercio comercio) {
		return this.repositorioComercios.save(comercio);
	}

	public void eliminarPorId(Long id) {
		this.repositorioComercios.deleteById(id);
	}

}
