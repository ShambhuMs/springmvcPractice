package com.xworkz.model.service.implementations;

import com.xworkz.dto.RoomDTO;
import com.xworkz.model.repo.interfaces.RoomRepo;
import com.xworkz.model.service.interfaces.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImplementation implements RoomService {
    @Autowired
    private RoomRepo roomRepo;
    @Override
    public boolean saveData(RoomDTO roomDTO) {
        System.out.println("Running saveData in RoomServiceImplementation");
        boolean value=this.roomRepo.save(roomDTO);
        System.out.println("Value from RoomServiceImplementation.. "+value);
        return value;
    }
}
