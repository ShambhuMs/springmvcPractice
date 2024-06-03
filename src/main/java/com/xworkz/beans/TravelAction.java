package com.xworkz.beans;

import com.xworkz.dto.TravelInfoDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class TravelAction {
    public TravelAction() {
        System.out.println("Running no-arg const in TravelAction......");
    }
    @PostMapping("/person")
    public String resultData(@Valid TravelInfoDTO travelInfoDTO, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            System.err.println("DTO has Invalid data..");
            bindingResult.getAllErrors().forEach(objectError-> System.err.println(objectError.getDefaultMessage()));
            model.addAttribute("errors",bindingResult.getAllErrors());
            return "travelForm";
        }
        else {
            System.out.println("details: "+travelInfoDTO);
            model.addAttribute("setName",travelInfoDTO.getName()+","+"Your Booking SuccessFull");
            return "success";
        }

    }

}
