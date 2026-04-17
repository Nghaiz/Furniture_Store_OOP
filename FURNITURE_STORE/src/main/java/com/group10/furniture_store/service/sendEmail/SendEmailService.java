package com.group10.furniture_store.service.sendEmail;

import java.nio.charset.StandardCharsets;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class SendEmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Async
    public void sendEmail(String toEmail, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("furniturestoreonline247@gmail.com");
        message.setTo(toEmail);
        message.setText(body);
        message.setSubject(subject);
        mailSender.send(message);
    }

    @Async
    public void sendEmailWithHTML(String toEmail, String subject) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom("furniturestoreonline247@gmail.com");
            helper.setTo(toEmail);
            helper.setSubject(subject);
            try (var inputStream = Objects
                    .requireNonNull(SendEmailService.class.getResourceAsStream("/mail/resetPass.html"))) {
                helper.setText(
                        new String(inputStream.readAllBytes(), StandardCharsets.UTF_8), true);
            }
            mailSender.send(message);
        } catch (Exception ex) {
        }
    }

    @Async
    public void sendPasswordResetEmail(String toEmail, String fullName, String resetLink) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, StandardCharsets.UTF_8.name());
            helper.setFrom("furniturestoreonline247@gmail.com");
            helper.setTo(toEmail);
            helper.setSubject("Reset Password - Furniture Store");

            // Đảm bảo fullName không null hoặc rỗng
            String safeFullName = (fullName != null && !fullName.isBlank()) ? fullName : toEmail;

            try (var inputStream = Objects
                    .requireNonNull(SendEmailService.class.getResourceAsStream("/mail/resetPasswordEmail.html"))) {
                String htmlContent = new String(inputStream.readAllBytes(), StandardCharsets.UTF_8);
              
                htmlContent = htmlContent.replace("[FULLNAME]", safeFullName);
                htmlContent = htmlContent.replace("[EMAIL]", toEmail);
                htmlContent = htmlContent.replace("[RESET_LINK]", resetLink);

                helper.setText(htmlContent, true);
            }

            mailSender.send(message);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException("Không thể gửi email: " + ex.getMessage());
        }
    }
}
