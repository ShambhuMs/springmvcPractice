package com.xworkz.model.repo.interfaces;

import com.xworkz.dto.AtmDTO;

public interface AtmApplicationRepo {
    boolean save(AtmDTO atmDTO);
}
