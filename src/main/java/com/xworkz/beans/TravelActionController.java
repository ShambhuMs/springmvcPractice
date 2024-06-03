package com.xworkz.beans;

import com.xworkz.dto.TravelInfoDTO;
import com.xworkz.model.service.interfaces.TravelInfoService;
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
public class TravelActionController {
    @Autowired
    private TravelInfoService travelInfoService;
    public TravelActionController() {
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
            boolean result=this.travelInfoService.saveData(travelInfoDTO);
            System.out.println("Value from TravelActionController.. "+result);
            return "success";
        }

    }

}
