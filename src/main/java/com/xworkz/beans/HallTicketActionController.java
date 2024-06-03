package com.xworkz.beans;

import com.xworkz.dto.HallDTO;
import com.xworkz.model.repo.interfaces.HallTicketRepo;
import com.xworkz.model.service.interfaces.HallTicketService;
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
public class HallTicketActionController {
    @Autowired
    private HallTicketService hallTicketService;
    public HallTicketActionController() {
        System.out.println("created HallTicketAction......");
    }
    @PostMapping("/hallTicket")
    public String setHallTicketAction(@Valid HallDTO hallDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.err.println("DTO has invalid data......."+hallDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("HallTicketError",bindingResult.getAllErrors());
            model.addAttribute("hallDTO",hallDTO);
            return "HallTicket";
        }
        else {
           model.addAttribute("msg",hallDTO.getStudentName()+", Your application submitted successfully....");
           boolean result=this.hallTicketService.saveData(hallDTO);
            System.out.println("Value from HallTicketActionController"+result);
            return "success";
        }

    }
}
