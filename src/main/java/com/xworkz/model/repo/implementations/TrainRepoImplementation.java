package com.xworkz.model.repo.implementations;

import com.xworkz.dto.TrainDTO;
import com.xworkz.model.repo.interfaces.TrainRepo;
import org.springframework.stereotype.Repository;

@Repository
public class TrainRepoImplementation implements TrainRepo {
    @Override
    public boolean save(TrainDTO trainDTO) {
        System.out.println("Running save in TrainRepoImplementation...");
        return true;
    }
}
