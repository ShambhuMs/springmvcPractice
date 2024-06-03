package com.xworkz.beans;

import com.xworkz.dto.HallDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class HallTicketAction {
    public HallTicketAction() {
        System.out.println("created HallTicketAction......");
    }
    @PostMapping("/hallTicket")
    public String setHallTicketAction(@Valid HallDTO hallDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.err.println("DTO has invalid data......."+hallDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("HallTicketError",bindingResult.getAllErrors());
            model.addAttribute("hallDTO",hallDTO);
            return "HallTicket";
        }
        else {
           model.addAttribute("msg",hallDTO.getStudentName()+", Your application submitted successfully....");
            return "success";
        }

    }
}
