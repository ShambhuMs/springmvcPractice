package com.xworkz.beans;

import com.xworkz.dto.HospitalDTO;
import com.xworkz.model.service.interfaces.HospitalService;
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
public class HospitalActionController {
    @Autowired
    private HospitalService hospitalService;
    public HospitalActionController() {
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
            boolean result=this.hospitalService.saveData(hospitalDTO);
            System.out.println("Value from HospitalActionController.. "+result);
            return "success";
        }
    }

}
