package com.xworkz.model.service.implementations;

import com.xworkz.dto.LoanDTO;
import com.xworkz.model.repo.interfaces.LoanRepo;
import com.xworkz.model.service.interfaces.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoanServiceImplementation implements LoanService {
    @Autowired
    private LoanRepo loanRepo;

    @Override
    public boolean saveData(LoanDTO loanDTO) {
        System.out.println("Running saveData in LoanServiceImplementation");
        boolean value=this.loanRepo.save(loanDTO);
        System.out.println("Value from LoanServiceImplementation.. "+value);
        return value;
    }
}
