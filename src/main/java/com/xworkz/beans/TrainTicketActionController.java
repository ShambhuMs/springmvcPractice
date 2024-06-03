package com.xworkz.beans;

import com.xworkz.dto.TrainDTO;
import com.xworkz.model.service.interfaces.TrainService;
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
public class TrainTicketActionController {
    @Autowired
    private TrainService trainService;
    public TrainTicketActionController() {
        System.out.println("Created TrainTicketAction....");
    }

    @PostMapping("/train")
    public String setTrainAction(@Valid TrainDTO trainDTO, BindingResult bindingResult, Model model){
        if (bindingResult.hasErrors()){
            System.out.println("Dto has invalid data....");
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("trainDataError",bindingResult.getAllErrors());
            model.addAttribute("trainDto",trainDTO);
            return "TrainTicket";
        }else {
            model.addAttribute("msg",trainDTO.getName()+", Your ticket booked...");
            boolean result=this.trainService.saveData(trainDTO);
            System.out.println("Value from TrainTicketActionController.. "+result);
            return "success";
        }

    }
}
