package com.xworkz.beans;

import com.xworkz.dto.GovtExamDTO;
import com.xworkz.model.service.interfaces.GovtExamService;
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
public class GovtExamActionController {
   @Autowired
   private GovtExamService govtExamService;
    public GovtExamActionController() {
        System.out.println("created GovtExamAction......");
    }
    @PostMapping("/gvt")
    public String setGovtExamAction(@Valid GovtExamDTO govtExamDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            System.err.println("DTO has invalid data......." + govtExamDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("gvtError", bindingResult.getAllErrors());
            model.addAttribute("gvtDTO", govtExamDTO);
            return "GovtExam";
        } else {
            model.addAttribute("msg", govtExamDTO.getName() + ", Your application submitted successfully....");
            boolean value=this.govtExamService.saveData(govtExamDTO);
            System.out.println("Value from GovtExamActionController.."+value);
            return "success";
        }
    }
}
