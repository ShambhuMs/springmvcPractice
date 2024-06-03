package com.xworkz.beans;

import com.xworkz.dto.RoomDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class RoomAction {
    public RoomAction() {
        System.out.println("Created no-arg const in RoomAction...");
    }
    @PostMapping("/room")
    public String setRoomAction(@Valid RoomDTO roomDTO, BindingResult bindingResult, Model model){
    if(bindingResult.hasErrors()){
        System.err.println("DTO has Invalid data.....");
        bindingResult.getAllErrors().forEach(objectError -> System.err.println(objectError.getDefaultMessage()));
        model.addAttribute("dataError",bindingResult.getAllErrors());
        model.addAttribute("dto",roomDTO);
        return "RoomBooking";
    }else {
        model.addAttribute("validData",roomDTO.getName()+","+"Thank you for booking....");
        model.addAttribute("data","Your details : "+roomDTO);
        System.out.println("Entered valid data...");
        return "success";
    }


    }
}
