package com.xworkz.model.repo.implementations;

import com.xworkz.dto.BusPassDTO;
import com.xworkz.model.repo.interfaces.BusPassRepository;
import org.springframework.stereotype.Repository;

@Repository
public class BusPassRepoImplementation implements BusPassRepository {
    @Override
    public boolean save(BusPassDTO busPassDTO) {
        System.out.println("Running save in BusPassRepoImplementation");
        return true;
    }
}
