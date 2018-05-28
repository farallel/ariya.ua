package com.ariya.service;

import com.ariya.entity.User;
import com.ariya.repository.UserRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailSender {

    @Value("${spring.mail.username}")
    private String username;

    private final JavaMailSender mailSender;
    private final UserRepository userRepository;

    public MailSender(JavaMailSender mailSender, UserRepository userRepository) {
        this.mailSender = mailSender;
        this.userRepository = userRepository;
    }

    public void send(String emailTo, String subject, String meassage) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();

        mailMessage.setFrom(username);
        mailMessage.setTo(emailTo);
        mailMessage.setSubject(subject);
        mailMessage.setText(meassage);

        mailSender.send(mailMessage);
    }

    public void notifyAllUsers(String subject, String meassage) {
        Iterable<User> users = userRepository.findAll();
        for (User user : users)
            send(user.getEmail(), subject, meassage);
    }

}
