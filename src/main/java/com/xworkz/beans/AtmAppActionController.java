package com.xworkz.beans;

import com.xworkz.dto.AtmDTO;
import com.xworkz.model.service.interfaces.AtmApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class AtmAppActionController {
   @Autowired
   private AtmApplicationService atmApplicationService;
    public AtmAppActionController() {
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
          boolean result=  this.atmApplicationService.validateAndSave(atmDTO);
            System.out.println("result from AtmAppActionController");
            return "success";
        }

    }
}
