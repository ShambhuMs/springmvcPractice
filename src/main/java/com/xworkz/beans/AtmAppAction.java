package com.xworkz.beans;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xworkz.dto.AtmDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class AtmAppAction {
    public AtmAppAction() {
        System.out.println("Created AtmAppAction....");
    }
    @PostMapping("/atm")
    public String setAtmAction(@Valid AtmDTO atmDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.err.println("Dto has invalid data....");
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("atmError",bindingResult.getAllErrors());
            model.addAttribute("atmDTO",atmDTO);
            return "AtmApplication";
        }else {
            model.addAttribute("msg",atmDTO.getName()+", Your application submitted....");
            return "success";
        }

    }
}
