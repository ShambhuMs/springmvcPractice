package com.xworkz.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class LoanDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @NotNull(message ="Pan number not be null")
    @Size(min = 10,max = 10,message =" Pan number must have 10 elements")
    private String panNo;
    @NotNull(message ="bank not be null" )
    private String bank;
    @NotNull(message ="date not be null" )
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message ="Branch not be null" )
    private String branch;
}
