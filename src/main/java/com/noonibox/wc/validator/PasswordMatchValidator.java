package com.noonibox.wc.validator;

import com.noonibox.wc.annotation.PasswordMatch;
import com.noonibox.wc.form.LoginForm;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class PasswordMatchValidator implements ConstraintValidator<PasswordMatch, LoginForm> {
    @Override
    public void initialize(PasswordMatch constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(LoginForm value, ConstraintValidatorContext context) {
        String plainPassword = value.getPassword();
        String repeatPassword = value.getPasswordConfirm();

        if(plainPassword == null || !plainPassword.equals(repeatPassword)) {
            return false;
        }

        return true;
    }
}
