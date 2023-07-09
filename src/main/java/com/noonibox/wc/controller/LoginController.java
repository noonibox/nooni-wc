package com.noonibox.wc.controller;

import com.noonibox.wc.form.LoginForm;
import com.noonibox.wc.model.Login;
import com.noonibox.wc.service.LoginService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
@RequiredArgsConstructor
@Slf4j
public class LoginController {
    private final LoginService loginService;

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("loginForm", new LoginForm());
        return "login/create";
    }

    @RequestMapping( value = "/create", method = RequestMethod.POST)
    public String onCreate(
            @Valid LoginForm loginForm,
            BindingResult result,
            Model model
    ) {
        if(result.hasErrors()) {
            model.addAttribute("loginForm", loginForm);
            return "login/create";
        }

        if(log.isTraceEnabled()) {
            log.trace("create user {}", loginForm.getEmail());
        }

        Login login = Login.builder()
                .email(loginForm.getEmail())
                .password(loginForm.getPassword())
                .build();

        long createdId = loginService.createLogin(login);

//        if(Optional.ofNullable(email).map(String::length).orElseThrow(IllegalArgumentException::new) > 0) {
//            ArrayList<MemberEmail> aryEmail = new ArrayList<MemberEmail>();
//            aryEmail.add(
//                    MemberEmail.builder()
//                            .email(email)
//                            .build()
//            );
//            member.setMemberEmailList(aryEmail);
//        }
//        long l = memberService.insertMember(member);

        return String.format("redirect:/login?createdId=%s", createdId);
    }

    @GetMapping
    public String login() {
        return "login/login";
    }
}
