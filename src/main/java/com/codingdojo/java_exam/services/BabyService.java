package com.codingdojo.java_exam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.java_exam.models.BabyNames;
import com.codingdojo.java_exam.repositories.BabyRepository;

@Service
public class BabyService {
    private final BabyRepository repo;
    
    public BabyService(BabyRepository repo) {
        this.repo = repo;
    }

    public List<BabyNames> all() {
        return repo.findAll();
    }

    public BabyNames create(BabyNames add) {
        return repo.save(add);
    }

    public BabyNames update(BabyNames add) {
        return repo.save(add);
    }
 
    public BabyNames find(Long id) {
        Optional<BabyNames> optional = repo.findById(id);
        if(optional.isPresent()) {
            return optional.get();
        } else {
            return null;
        }
    }
    public void delete(Long id) {
    	repo.deleteById(id);
    }

}


