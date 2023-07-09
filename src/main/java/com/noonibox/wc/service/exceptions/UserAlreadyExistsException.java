package com.noonibox.wc.service.exceptions;

import org.springframework.security.core.AuthenticationException;

public class UserAlreadyExistsException extends AuthenticationException {
    public UserAlreadyExistsException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public UserAlreadyExistsException(String msg) {
        super(msg);
    }
}
