package com.xworkz.model.service.interfaces;

import com.xworkz.dto.AtmDTO;

public interface AtmApplicationService  {
    boolean validateAndSave(AtmDTO atmDTO);
}
