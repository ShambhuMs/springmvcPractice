package com.xworkz.beans;

import com.xworkz.dto.PgDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class PgAction {
    public PgAction() {
        System.out.println("Created no-arg const in PgAction.....");
    }

    @PostMapping("/pgRegi")
    public String setPgAction(@Valid PgDTO pgDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.out.println("DTO has invalid data....");
            System.out.println(pgDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("pgError",bindingResult.getAllErrors());
            model.addAttribute("dto"+pgDTO);
            return "PgRegistration";
        }else {
            model.addAttribute("message",pgDTO.getName()+","+"Your Registration is successful...");
            return "success";
        }
    }
}
