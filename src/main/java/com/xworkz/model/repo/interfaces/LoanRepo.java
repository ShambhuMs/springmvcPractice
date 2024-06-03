package com.xworkz.model.repo.interfaces;

import com.xworkz.dto.AtmDTO;
import com.xworkz.dto.LoanDTO;

public interface LoanRepo {
    boolean save(LoanDTO loanDTO);
}
