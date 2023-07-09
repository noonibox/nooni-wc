package com.noonibox.wc.service.exceptions;

import java.util.ResourceBundle;

public class UserAlreadyExistsException extends LoginException {
    ResourceBundle message = ResourceBundle.getBundle("i18n.messages");

    public UserAlreadyExistsException(String email, Throwable cause) {
        super(email, cause);
    }

    public UserAlreadyExistsException(String email) {
        super(email);
    }
}
