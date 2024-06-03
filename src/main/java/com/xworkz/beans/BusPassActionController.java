package com.xworkz.beans;

import com.xworkz.dto.BusPassDTO;
import com.xworkz.model.service.interfaces.BusPassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/")
public class BusPassActionController {
  @Autowired
  private BusPassService busPassService;
    public BusPassActionController() {
        System.out.println("created BusPassAction......");
    }
    @PostMapping("/busPass")
    public String setBusPassAction(@Valid BusPassDTO busPassDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            System.err.println("DTO has invalid data......." + busPassDTO);
            bindingResult.getAllErrors().forEach(objectError -> System.out.println(objectError.getDefaultMessage()));
            model.addAttribute("busError", bindingResult.getAllErrors());
            model.addAttribute("busDTO", busPassDTO);
            return "BusPassApplication";
        } else {
            model.addAttribute("msg", busPassDTO.getName() + ", Your application submitted successfully....");
          boolean value=  this.busPassService.saveData(busPassDTO);
            System.out.println("Value from BusPassActionController..."+value);
            return "success";
        }
    }
}
