package com.moritools.wc.service;

import com.moritools.wc.model.Company;
import com.moritools.wc.repository.CompanyRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collection;

@Service
@RequiredArgsConstructor
public class CompanyService {
    private final CompanyRepository companyRepository;

    @Transactional(propagation = Propagation.NEVER)
    public Company selectOneCompany(Company company) {
        return companyRepository.selectOneCompany(company);
    }
}
