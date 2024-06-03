package com.xworkz.model.service.interfaces;

import com.xworkz.dto.GovtExamDTO;
import com.xworkz.model.repo.interfaces.GovtExamRepo;

public interface GovtExamService {
    boolean saveData(GovtExamDTO govtExamDTO);
}
