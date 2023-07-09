package com.noonibox.wc.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@Slf4j
public class ErrorController {
    @ExceptionHandler(AuthenticationException.class)
    public ModelAndView AuthenticationException(AuthenticationException e) {
        log.error("AuthenticationException", e);
        ModelAndView modelAndView = new ModelAndView();
	    modelAndView.addObject("exception", e);

	    modelAndView.setViewName("error/auth-exception.html");
	    return modelAndView;
    }
}
