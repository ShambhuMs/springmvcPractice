package com.xworkz.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AtmDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @Min(11111111111L)
    @Max(value = 99999999999L,message = "number must have 11 digits")
    private long accountNo;
    @NotNull(message ="Gender not be null" )
    private String gender;
    @NotNull(message ="date not be null" )
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message ="Branch not be null" )
    private String branch;
}
