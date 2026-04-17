package com.group10.furniture_store.config;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import com.group10.furniture_store.exception.CustomOAuth2Exception;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class CustomOAuth2AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception)
            throws IOException, ServletException {
        String errorMessage = "Đăng nhập thất bại. Vui lòng thử lại.";
        if (exception instanceof CustomOAuth2Exception) {
            errorMessage = exception.getMessage();
        }
        getRedirectStrategy().sendRedirect(request, response,
                "/login?error1=" + URLEncoder.encode(errorMessage, "UTF-8"));
    }

}