package com.moritools.wc.repository;

import com.moritools.wc.model.Company;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Collection;

@Repository
@Mapper
public interface CompanyRepository {
    Company selectOneCompany(Company company);
}
