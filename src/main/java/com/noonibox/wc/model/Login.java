package com.noonibox.wc.model;

import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Date;

@Data
@Builder
@EqualsAndHashCode
public class Login {
    /**
     * 고유번호
     */
    Long id;

    /**
     * 이메일
     */
    String email;

    /**
     * 비밀번호
     */
    String password;

    /**
     * 이메일(계정) 인증 여부
     */
    String verified;

    /**
     * 인증일자
     */
    Date verifiedAt;

    /**
     * 생성일자
     */
    Date createAt;

    /**
     * 수정일자
     */
    Date updateAt;
}
