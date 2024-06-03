package com.xworkz.model.repo.implementations;

import com.xworkz.dto.HospitalDTO;
import com.xworkz.model.repo.interfaces.HospitalRepo;
import org.springframework.stereotype.Repository;

@Repository
public class HospitalRepoImplementation implements HospitalRepo {
    @Override
    public boolean save(HospitalDTO hospitalDTO) {
        System.out.println("Running save in HospitalRepoImplementation... ");
        return true;
    }
}
