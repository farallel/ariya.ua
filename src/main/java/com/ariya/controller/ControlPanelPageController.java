package com.ariya.controller;

import com.ariya.entity.News;
import com.ariya.entity.Task;
import com.ariya.entity.User;
import com.ariya.repository.NewsRepository;
import com.ariya.repository.TaskRepository;
import com.ariya.service.MailSender;
import com.ariya.service.UploadService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/control-panel")
@PreAuthorize("hasAuthority('EDITOR')")
public class ControlPanelPageController {

    private final MailSender mailSender;
    private final UploadService uploadService;
    private final TaskRepository taskRepository;
    private final NewsRepository newsRepository;

    public ControlPanelPageController(MailSender mailSender, UploadService uploadService, TaskRepository taskRepository, NewsRepository newsRepository) {
        this.mailSender = mailSender;
        this.uploadService = uploadService;
        this.taskRepository = taskRepository;
        this.newsRepository = newsRepository;
    }

    @GetMapping
    public String controlPanel() {
        return "controlPanel";
    }

    @PostMapping("/addNews")
    public String addNews(@AuthenticationPrincipal User user,
                          @RequestParam(required = true) String title,
                          @RequestParam(required = true) String text,
                          @RequestParam(value = "file") MultipartFile file) throws IOException {
        News newNews = new News(title, text, user.getFullName());

        if (file != null && !file.getOriginalFilename().isEmpty())
            newNews.setFilename(uploadService.uploadFile(file));

        newsRepository.save(newNews);

        return "redirect:/control-panel";
    }

    @PostMapping("/addTask")
    public String addTask(@AuthenticationPrincipal User user,
                          @RequestParam(required = true) String header,
                          @RequestParam(required = true) String title,
                          @RequestParam(required = true) String text,
                          @RequestParam(value = "file") MultipartFile file) throws IOException {
        Task newTask = new Task(header, title, text, user.getFullName());

        if (file != null && !file.getOriginalFilename().isEmpty())
            newTask.setFilename(uploadService.uploadFile(file));

        taskRepository.save(newTask);
        String message = String.format(
                "Здравствуйте!\n"
                + "На сайте был добавлен план работ на сегодня, пожалуйста ознакомтесь с ним.\n"
                + "Автор: " + user.getFullName());
        mailSender.notifyAllUsers("Добавлен план работ на сегодня.", message);

        return "redirect:/control-panel";
    }

}
