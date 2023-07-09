package com.noonibox.wc.service.exceptions;

import org.springframework.security.core.AuthenticationException;

public class LoginException extends AuthenticationException {
    String email;

    public LoginException(String email, Throwable cause) {
        super(String.format("LoginException [%s]", email), cause);
        setEmail(email);
    }

    public LoginException(String email) {
        super(String.format("LoginException [%s]", email));
        setEmail(email);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
