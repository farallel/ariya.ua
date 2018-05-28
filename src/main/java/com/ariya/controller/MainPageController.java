package com.ariya.controller;

import com.ariya.entity.News;
import com.ariya.repository.NewsRepository;
import com.ariya.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
public class MainPageController {

    private final NewsRepository newsRepository;
    private final UploadService uploadService;

    public MainPageController(NewsRepository newsRepository, UploadService uploadService) {
        this.newsRepository = newsRepository;
        this.uploadService = uploadService;
    }

    @GetMapping("/")
    public String root() {
        return "redirect:/main";
    }

    @GetMapping("/main")
    public String mainPage(Model model) {
        Iterable<News> newsList = newsRepository.findAllByOrderByIdDesc();
        model.addAttribute("newsList", newsList);

        return "main";
    }

    @GetMapping("/main/id{news}")
    public String taskEditForm(@PathVariable News news,
                               Model model) {
        model.addAttribute("news", news);

        return "newsEditForm";
    }

    @PostMapping("/main/news-edit")
    public String taskSave(@RequestParam("newsId") News news,
                           @RequestParam(required = true) String title,
                           @RequestParam(required = true) String text,
                           @RequestParam(value = "file") MultipartFile file) throws IOException {

        news.setTitle(title);
        news.setText(text);
        if (file != null && !file.getOriginalFilename().isEmpty())
            news.setFilename(uploadService.uploadFile(file));


        newsRepository.save(news);

        return "redirect:/main";
    }

    @GetMapping("/main/delete{news}")
    public String deleteUser(@PathVariable News news) {

        newsRepository.delete(news);

        return "redirect:/main";
    }

}
