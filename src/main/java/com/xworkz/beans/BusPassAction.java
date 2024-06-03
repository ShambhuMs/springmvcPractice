package com.xworkz.beans;

import com.xworkz.dto.BusPassDTO;
import com.xworkz.dto.GovtExamDTO;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Component
@RequestMapping("/")
public class BusPassAction {
    public BusPassAction() {
        System.out.println("created BusPassAction......");
    }
    @PostMapping("/busPass")
    public String setGovtExamAction(@Valid BusPassDTO busPassDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            System.err.println("DTO has invalid data......." + busPassDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("busError", bindingResult.getAllErrors());
            model.addAttribute("busDTO", busPassDTO);
            return "BusPassApplication";
        } else {
            model.addAttribute("msg", busPassDTO.getName() + ", Your application submitted successfully....");
            return "success";
        }
    }
}
