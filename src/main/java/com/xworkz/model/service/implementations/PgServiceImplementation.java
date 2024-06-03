package com.xworkz.model.service.implementations;

import com.xworkz.dto.PgDTO;
import com.xworkz.model.repo.interfaces.PgRepo;
import com.xworkz.model.service.interfaces.PgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PgServiceImplementation implements PgService {
    @Autowired
    private PgRepo pgRepo;
    @Override
    public boolean saveData(PgDTO pgDTO) {
        System.out.println("Running saveData in PgServiceImplementation");
        boolean value=this.pgRepo.save(pgDTO);
        System.out.println("Value from PgServiceImplementation.. "+value);
        return value;
    }
}
