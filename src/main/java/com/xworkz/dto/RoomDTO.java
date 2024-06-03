package com.xworkz.dto;

import lombok.*;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class RoomDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String name;
    @NotNull(message = "Number not be null")
    @Min(1)
    @Max(value = 9999999999L,message = "number must have 10 digits")
    private long number;
    @NotNull(message = "Date not be empty")
    private String date;
    @NotNull(message ="Gender not be null" )
    private String gender;
    @NotEmpty(message = "Please select the number of rooms")
    @Pattern(regexp = "^[1-3]$", message = "Invalid number of rooms")
    private String room;
}
