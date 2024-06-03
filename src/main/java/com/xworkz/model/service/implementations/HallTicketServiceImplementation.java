package com.xworkz.model.service.implementations;

import com.xworkz.dto.HallDTO;
import com.xworkz.model.repo.interfaces.HallTicketRepo;
import com.xworkz.model.service.interfaces.HallTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HallTicketServiceImplementation implements HallTicketService {
  @Autowired
  private HallTicketRepo hallTicketRepo;
    @Override
    public boolean saveData(HallDTO hallDTO) {
        System.out.println("Running saveData in HallTicketServiceImplementation"+hallDTO);
        boolean value=this.hallTicketRepo.save(hallDTO);
        System.out.println("Value from HallTicketServiceImplementation"+value);
        return value;
    }
}
