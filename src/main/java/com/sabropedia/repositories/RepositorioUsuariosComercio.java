package com.sabropedia.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sabropedia.models.UsuarioComercio;

@Repository
public interface RepositorioUsuariosComercio extends CrudRepository<UsuarioComercio, Long>{
	Optional<UsuarioComercio> findByEmail(String email);
}
