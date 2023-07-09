package com.noonibox.wc.service;

import com.noonibox.wc.model.Login;
import com.noonibox.wc.repository.LoginRepository;
import com.noonibox.wc.service.exceptions.UserAlreadyExistsException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class LoginService {
    private final LoginRepository loginRepository;
    /**
     * 로그인을 생성한다.
     * 이미 로그인이 존재한다면, 예외를 던진다.
     * @throws com.noonibox.wc.service.exceptions.UserAlreadyExistsException
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public long createLogin(Login login) {
        Login resultLogin = loginRepository.selectLoginOne(login);

        if(resultLogin != null) {
            throw new UserAlreadyExistsException(String.format("User already exists [%s]", login.getEmail()));
        }

        return -1;
    }
}
