package com.xworkz.beans;

import com.xworkz.dto.RoomDTO;
import com.xworkz.model.service.interfaces.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class RoomActionController {
    @Autowired
    private RoomService roomService;
    public RoomActionController() {
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
        boolean result=this.roomService.saveData(roomDTO);
        System.out.println("Value from RoomActionController.. "+result);
        return "success";
    }


    }
}
