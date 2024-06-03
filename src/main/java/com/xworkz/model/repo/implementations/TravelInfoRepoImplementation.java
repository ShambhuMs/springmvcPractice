package com.xworkz.model.repo.implementations;

import com.xworkz.dto.TravelInfoDTO;
import com.xworkz.model.repo.interfaces.TravelInfoRepo;
import org.springframework.stereotype.Repository;

@Repository
public class TravelInfoRepoImplementation implements TravelInfoRepo {
    @Override
    public boolean save(TravelInfoDTO travelInfoDTO) {
        System.out.println("Running save in TravelInfoRepoImplementation...");
        return true;
    }
}
