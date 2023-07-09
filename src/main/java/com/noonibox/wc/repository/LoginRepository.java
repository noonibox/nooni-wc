package com.noonibox.wc.repository;

import com.noonibox.wc.model.Login;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface LoginRepository {
    long insertLogin(Login login);

    Login selectLoginOne(Login login);
}
