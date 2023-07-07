package com.moritools.wc.controller;

import com.moritools.wc.model.Company;
import com.moritools.wc.service.CompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Collection;

@Controller
@RequiredArgsConstructor
public class HomeController {
    private final CompanyService companyService;

    @GetMapping("/")
    public String index() {
//        Company company = companyService.selectOneCompany(null);
//        if(company == null) {
//            return "redirect:/company/create";
//        }

        return "index";
    }
}
