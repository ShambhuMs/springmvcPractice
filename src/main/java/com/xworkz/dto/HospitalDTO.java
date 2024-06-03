package com.xworkz.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

@ToString
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class HospitalDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @NotNull(message ="Gender not be null" )
    private String gender;
    @NotNull(message = "date not be null")
    @Min(value = 1111111111L,message = "Number must be 10 digits")
    @Max(value = 9999999999L,message = "Number must be 10 digits")
    private long number;
    @NotNull(message ="date not be null" )
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message ="time not be null" )
    private String time;
}
