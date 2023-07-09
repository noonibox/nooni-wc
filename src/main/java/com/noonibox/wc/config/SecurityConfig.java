package com.noonibox.wc.config;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

@EnableWebSecurity
@EnableMethodSecurity
@Configuration
@RequiredArgsConstructor
public class SecurityConfig {
//    @Bean
//    public WebSecurityCustomizer webSecurityCustomizer() {
//        return (web) -> web.ignoring().requestMatchers("/예외처리하고 싶은 url", "/예외처리하고 싶은 url");
//    }

    @Bean
    protected SecurityFilterChain webSecurityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                .requestMatchers("/login/create", "/error").permitAll()
                .anyRequest().authenticated()
            )
//            .formLogin(Customizer.withDefaults());
            .formLogin(login-> login
                .loginPage("/login")	// [A] 커스텀 로그인 페이지 지정
                .loginProcessingUrl("/login-process")	// [B] submit 받을 url
                .usernameParameter("userid")	// [C] submit할 아이디
                .passwordParameter("pw")	// [D] submit할 비밀번호
                .defaultSuccessUrl("/view/dashboard", true)
                .permitAll()
            );
//                .successHandler(로그인 성공 시 실행할 커스터마이즈드 핸들러)
//                .failureHandler(로그인 실패 시 실행할 커스터마이즈드 핸들러);

//        http
//                .sessionManagement()
//                .invalidSessionUrl("/로그인페이지")

//                .and()
//                .logout()
//                .logoutRequestMatcher(new AntPathRequestMatcher("/실제 로그아웃이 되는 url"))
//                .invalidateHttpSession(true)
//                .deleteCookies("JSESSIONID")
//                .permitAll();


        //CSRF 토큰
        http.csrf(httpSecurityCsrfConfigurer -> httpSecurityCsrfConfigurer.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()));

        return http.build();
    }
}
