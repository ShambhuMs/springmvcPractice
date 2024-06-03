package com.xworkz.model.service.implementations;

import com.xworkz.dto.GovtExamDTO;
import com.xworkz.model.repo.interfaces.GovtExamRepo;
import com.xworkz.model.service.interfaces.GovtExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GovtExamServiceImplementation implements GovtExamService {
    @Autowired
    private GovtExamRepo govtExamRepo;

    @Override
    public boolean saveData(GovtExamDTO govtExamDTO) {
        System.out.println("Running saveData in GovtExamServiceImplementation");
     boolean result=   this.govtExamRepo.save(govtExamDTO);
        System.out.println("Result running from GovtExamServiceImplementation "+result);
        return result;
    }
}
