package com.noonibox.wc.form;

import com.noonibox.wc.annotation.PasswordMatch;
import jakarta.validation.constraints.*;
import lombok.Data;

@Data
@PasswordMatch
public class LoginForm {
    @NotBlank
    @Email
    String email;

    @Size(min = 8, max = 15)
    @NotBlank
    String password;

    @NotBlank
    String passwordConfirm;
}
