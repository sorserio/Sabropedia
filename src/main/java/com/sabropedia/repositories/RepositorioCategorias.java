package com.sabropedia.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sabropedia.models.Categoria;

@Repository
public interface RepositorioCategorias extends CrudRepository<Categoria, Long>{

}
