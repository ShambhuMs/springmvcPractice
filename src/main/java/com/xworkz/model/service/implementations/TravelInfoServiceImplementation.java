package com.xworkz.model.service.implementations;

import com.xworkz.dto.TravelInfoDTO;
import com.xworkz.model.repo.interfaces.TravelInfoRepo;
import com.xworkz.model.service.interfaces.TravelInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TravelInfoServiceImplementation implements TravelInfoService {
    @Autowired
    private TravelInfoRepo travelInfoRepo;
    @Override
    public boolean saveData(TravelInfoDTO travelInfoDTO) {
        System.out.println("Running saveData in HospitalServiceImplementation");
        boolean value=this.travelInfoRepo.save(travelInfoDTO);
        System.out.println("Value from HospitalServiceImplementation.. "+value);
        return value;
    }
}
