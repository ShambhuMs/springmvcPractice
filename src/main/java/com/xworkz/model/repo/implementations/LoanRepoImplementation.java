package com.xworkz.model.repo.implementations;

import com.xworkz.dto.LoanDTO;
import com.xworkz.model.repo.interfaces.LoanRepo;
import org.springframework.stereotype.Repository;

@Repository
public class LoanRepoImplementation implements LoanRepo {
    @Override
    public boolean save(LoanDTO loanDTO) {
        System.out.println("Running save in LoanRepoImplementation...");
        return true;
    }
}
