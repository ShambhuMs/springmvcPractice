package com.xworkz.model.repo.implementations;

import com.xworkz.dto.RoomDTO;
import com.xworkz.model.repo.interfaces.RoomRepo;
import org.springframework.stereotype.Repository;

@Repository
public class RoomRepoImplementation implements RoomRepo {
    @Override
    public boolean save(RoomDTO roomDTO) {
        System.out.println("Running save in RoomRepoImplementation...");
        return true;
    }
}
