package com.noonibox.wc.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {
    @GetMapping("/")
    public String index() {
//        Company company = companyService.selectOneCompany(null);
//        if(company == null) {
//            return "redirect:/company/create";
//        }

        return "index";
    }
}
