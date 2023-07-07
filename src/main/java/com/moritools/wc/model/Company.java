package com.moritools.wc.model;

import com.moritools.wc.types.CompanyState;
import com.moritools.wc.types.CompanyTp;
import lombok.Data;

@Data
public class Company {
    long companySeq;
    long upCompanySeq;
    String name;
    CompanyTp companyTp;
    CompanyState companyState;
    float adjRate;
    String remark;
    String createAt;
    String updateAt;
}
