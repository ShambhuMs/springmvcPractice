package com.xworkz.beans;

import com.xworkz.dto.AtmDTO;
import com.xworkz.dto.LoanDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
@Component
@RequestMapping("/")
public class LoanApplicationAction {
    public LoanApplicationAction() {
        System.out.println("Created LoanApplicationAction....");
    }
    @PostMapping("/loan")
    public String setAtmAction(@Valid LoanDTO loanDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.err.println("Dto has invalid data...."+loanDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("loanError",bindingResult.getAllErrors());
            model.addAttribute("bankDTO",loanDTO);
            return "LoanApplication";
        }else {
            model.addAttribute("msg",loanDTO.getName()+", Your application submitted....");
            return "success";
        }

    }
}
