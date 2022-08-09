package com.codingdojo.java_exam.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.java_exam.models.BabyNames;

@Repository
public interface BabyRepository extends CrudRepository<BabyNames, Long> {
	
	List<BabyNames> findAll();

}
