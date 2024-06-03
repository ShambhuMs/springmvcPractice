package com.xworkz.model.service.implementations;

import com.xworkz.dto.TrainDTO;
import com.xworkz.model.repo.interfaces.TrainRepo;
import com.xworkz.model.service.interfaces.TrainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrainServiceImplementation implements TrainService {
    @Autowired
    private TrainRepo trainRepo;
    @Override
    public boolean saveData(TrainDTO trainDTO) {
        System.out.println("Running saveData in TrainServiceImplementation");
        boolean value=this.trainRepo.save(trainDTO);
        System.out.println("Value from TrainServiceImplementation.. "+value);
        return value;
    }
}
