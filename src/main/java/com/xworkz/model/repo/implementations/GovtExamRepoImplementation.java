package com.xworkz.model.repo.implementations;

import com.xworkz.dto.GovtExamDTO;
import com.xworkz.model.repo.interfaces.GovtExamRepo;
import org.springframework.stereotype.Repository;

@Repository
public class GovtExamRepoImplementation implements GovtExamRepo {
    @Override
    public boolean save(GovtExamDTO govtExamDTO) {
        System.out.println("Running save method in GovtExamRepoImplementation");
        return true;
    }
}
