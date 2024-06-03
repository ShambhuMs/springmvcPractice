package com.xworkz.beans;

import com.xworkz.dto.HospitalDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class HospitalAction {
    public HospitalAction() {
        System.out.println("created HospitalAction....");
    }

    @PostMapping("/hospital")
    public String setHospitalAction(@Valid HospitalDTO hospitalDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.err.println("Dto has invalid data...."+hospitalDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("hospitalError",bindingResult.getAllErrors());
            model.addAttribute("hospitalDTO",hospitalDTO);
            return "HospitalAppointment";
        }else {
            model.addAttribute("msg",hospitalDTO.getName()+", Your application submitted....");
            return "success";
        }
    }

}
