package com.xworkz.model.repo.implementations;

import com.xworkz.dto.HallDTO;
import com.xworkz.model.repo.interfaces.HallTicketRepo;
import org.springframework.stereotype.Repository;

@Repository
public class HallTicketRepoImplementation implements HallTicketRepo {
    @Override
    public boolean save(HallDTO hallDTO) {
        System.out.println("Running save HallTicketRepoImplementation");
        return true;
    }
}
