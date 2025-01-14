package com.sabropedia.repositories;


import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sabropedia.models.Comentario;
import com.sabropedia.models.Comercio;

@Repository
public interface RepositorioComentarios extends CrudRepository<Comentario, Long>{
	List<Comentario> findByComercio(Comercio comercio);
}
