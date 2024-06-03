package com.xworkz.dto;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class BusPassDTO {
    @NotNull(message = "Name not be null")
    @Size(min = 3,max = 15,message = "Name should be min 3 and max 15 characters")
    private String name;
    @NotNull(message = "date not be null")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate date;
    @NotNull(message = "source not be null")
    @Size(min = 3,max = 15,message = "source should be min 3 and max 15 characters")
    private String source;
    @NotNull(message = "destination not be null")
    @Size(min = 3,max = 15,message = "destination should be min 3 and max 15 characters")
    private String destination;
    @NotNull(message = "college not be null")
    private String college;
    @NotNull(message = "gender not be null")
    private String gender;
}
