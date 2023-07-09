package com.noonibox.wc;

import java.util.ResourceBundle;

public class WebConsoleException extends RuntimeException {
    ResourceBundle message = ResourceBundle.getBundle("i18n.messages");
}
