package com.xworkz.model.service.implementations;

import com.xworkz.dto.HospitalDTO;
import com.xworkz.model.repo.interfaces.HospitalRepo;
import com.xworkz.model.service.interfaces.HospitalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HospitalServiceImplementation implements HospitalService {
    @Autowired
    private HospitalRepo hospitalRepo;
    @Override
    public boolean saveData(HospitalDTO hospitalDTO) {
        System.out.println("Running saveData in HospitalServiceImplementation");
        boolean value=this.hospitalRepo.save(hospitalDTO);
        System.out.println("Value from HospitalServiceImplementation.. "+value);
        return value;
    }
}
