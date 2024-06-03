package com.xworkz.model.repo.implementations;

import com.xworkz.dto.PgDTO;
import com.xworkz.model.repo.interfaces.PgRepo;
import org.springframework.stereotype.Repository;

@Repository
public class PgRepoImplementation implements PgRepo {
    @Override
    public boolean save(PgDTO pgDTO) {
        System.out.println("Running save in PgRepoImplementation...");
        return true;
    }
}
