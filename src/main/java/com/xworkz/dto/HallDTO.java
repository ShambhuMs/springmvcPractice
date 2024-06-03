package com.xworkz.dto;

import lombok.*;

import javax.validation.constraints.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class HallDTO {
    @NotNull(message = "Name can n't be null..")
    @Size(min = 3,max = 20,message = "Name should be min 3 and max 20 characters")
    private String studentName;
    @Min(1111111111L)
    @Max(value = 9999999999L,message = "number must have 10 digits")
    private long regNo;
    @NotNull(message ="Gender not be null" )
    private String gender;
    @NotNull(message ="Sem not be null" )
    @Pattern(regexp ="^[1-6]$", message = "Invalid sem" )
    private String sem;
    @NotNull(message ="Branch not be null" )
    private String branch;
}
