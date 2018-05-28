package com.ariya.controller;

import com.ariya.entity.Role;
import com.ariya.entity.User;
import com.ariya.repository.UserRepository;
import com.ariya.service.MailSender;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin-panel")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {

    private final UserRepository userRepository;
    private final MailSender mailSender;

    public UserController(UserRepository userRepository, MailSender mailSender) {
        this.userRepository = userRepository;
        this.mailSender = mailSender;
    }

    @GetMapping
    public String userList(Model model) {
        model.addAttribute("users", userRepository.findAllByOrderByIdDesc());

        return "adminPanel";
    }

    @PostMapping("/addUser")
    public String addUser(@RequestParam(required = true) String username,
                          @RequestParam(required = true) String fullName,
                          @RequestParam(required = true) String email,
                          @RequestParam(required = true) String password,
                          @RequestParam(required = true) String confirmPassword,
                          RedirectAttributes redirectAttributes) {
        User userFromDB = userRepository.findByUsername(username);

        if (userFromDB != null) {
            redirectAttributes.addFlashAttribute("userExistsError", "Данный пользователь уже существует!");
            return "redirect:/admin-panel";
        }
        if (!password.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("confirmPasswordError", "Пароли не совпадают!");
            return "redirect:/admin-panel";
        }

        User user = new User(username, fullName, email, password);
        user.setRoles(Collections.singleton(Role.USER));


        userRepository.save(user);
        redirectAttributes.addFlashAttribute("userSuccessfullyAdded", "Пользователь добавлен!");

        String message = String.format(
                "Здравствуйте, " + fullName + "!\n"
                + "Вас приветствует администрация сайта ООО Ария.\n"
                + "Вы были успешно зарегестрированы на нашем сайте, вот Ваши данные для входа:\n"
                + "Логин: " + username + "\n"
                + "Пароль: " + password);
        mailSender.send(email, "Данные для входа.", message);

        return "redirect:/admin-panel";
    }

    @GetMapping("id{user}")
    public String userEditForm(@PathVariable User user,
                               Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());

        return "userEditForm";
    }

    @PostMapping("/user-edit")
    public String userSave(@RequestParam("userId") User user,
                           @RequestParam Map<String, String> form,
                           @RequestParam(required = true) String fullName,
                           @RequestParam(required = true) String email,
                           @RequestParam(required = false) String password,
                           Model model) {

        user.setFullName(fullName);
        user.setEmail(email);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet())
            if (roles.contains(key))
                user.getRoles().add(Role.valueOf(key));

        userRepository.save(user);

        return "redirect:/admin-panel";
    }

    @GetMapping("delete{user}")
    public String deleteUser(@PathVariable User user) {

        userRepository.delete(user);

        return "redirect:/admin-panel";
    }

}
