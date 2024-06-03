package com.xworkz.dto;

import lombok.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class TrainDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @NotNull(message = "Number not be null")
    @Min(1111111111L)
    @Max(value = 9999999999L,message = "number must have 10 digits")
    private long number;
    @NotNull(message = "Date not be empty")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message ="Gender not be null" )
    private String gender;
    @NotEmpty(message = "Please select the source")
    private String source;
    @NotEmpty(message = "Please select the destination")
    private String destination;

}
