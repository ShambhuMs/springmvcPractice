package com.xworkz.model.service.implementations;

import com.xworkz.dto.BusPassDTO;
import com.xworkz.model.repo.interfaces.BusPassRepository;
import com.xworkz.model.service.interfaces.BusPassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BusPassServiceImplementation implements BusPassService {
   @Autowired
   private BusPassRepository busPassRepository;
    @Override
    public boolean saveData(BusPassDTO busPassDTO) {
        System.out.println("Running saveData in BusPassServiceImplementation...");
        boolean result= this.busPassRepository.save(busPassDTO);
        System.out.println("Result from BusPassServiceImplementation.."+result);
        return result;
    }
}
