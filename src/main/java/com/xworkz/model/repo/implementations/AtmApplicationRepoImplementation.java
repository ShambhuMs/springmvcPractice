package com.xworkz.model.repo.implementations;

import com.xworkz.dto.AtmDTO;
import com.xworkz.model.repo.interfaces.AtmApplicationRepo;
import org.springframework.stereotype.Repository;

@Repository
public class AtmApplicationRepoImplementation implements AtmApplicationRepo {
    @Override
    public boolean save(AtmDTO atmDTO) {
        System.out.println("Running save method in AtmApplicationImplementation..."+atmDTO);
        return false;
    }
}
