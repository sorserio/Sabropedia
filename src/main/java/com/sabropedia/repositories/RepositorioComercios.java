package com.sabropedia.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sabropedia.models.Comercio;

@Repository
public interface RepositorioComercios extends CrudRepository<Comercio, Long>{

}
