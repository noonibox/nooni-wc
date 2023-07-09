package com.noonibox.wc.form;

import com.noonibox.wc.annotation.PasswordMatch;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@PasswordMatch
public class LoginForm {
    @NotBlank
    @Email
    String email;

    @NotBlank
    String password;

    @NotBlank
    String passwordConfirm;
}
