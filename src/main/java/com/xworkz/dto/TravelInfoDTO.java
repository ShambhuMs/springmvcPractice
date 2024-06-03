package com.xworkz.dto;

import lombok.*;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import javax.validation.constraints.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Component
public class TravelInfoDTO {
    @NotNull(message = "Name cann't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @Email(message = "Enter valid email")
    private String email;
    @NotNull(message = "Number not be null")
    @Min(1)
    @Max(value = 9999999999L,message = "number must have 10 digits")
    private long number;
    @NotNull(message = "Gender not be null")
    private String gender;
    @NotEmpty(message = "Please select the number of seats")
    @Pattern(regexp = "^[1-3]$", message = "Invalid number of seats")
    private String seats;
    @NotNull(message = "source cann't be null..")
    @Size(min = 3,max = 20,message = "source should be min 3 and max 20 characters")
    private String source;
    @NotNull(message = "destination cann't be null..")
    @Size(min = 3,max = 20,message = "destination should be min 3 and max 20 characters")
    private  String destination;
    @NotNull(message = "comment cann't be null..")
    @Size(min = 30,max = 300,message = "comment should be min 30 and max 300 characters")
    private String comment;
}
