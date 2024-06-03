package com.xworkz.model.service.implementations;

import com.xworkz.dto.AtmDTO;
import com.xworkz.model.repo.interfaces.AtmApplicationRepo;
import com.xworkz.model.service.interfaces.AtmApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.Valid;

@Service
public class AtmApplicationServiceImplementation implements AtmApplicationService {
   @Autowired
   private AtmApplicationRepo atmApplicationRepo;
    @Override
    public boolean validateAndSave(@Valid AtmDTO atmDTO) {
        System.out.println("Running validateAndSave in AtmApplicationServiceImplementation..");
        boolean value= this.atmApplicationRepo.save(atmDTO);
        return value;
    }
}
