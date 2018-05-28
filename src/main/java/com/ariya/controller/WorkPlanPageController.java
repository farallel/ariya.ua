package com.ariya.controller;

import com.ariya.entity.Task;
import com.ariya.repository.TaskRepository;
import com.ariya.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/work-plan")
public class WorkPlanPageController {

    private final TaskRepository taskRepository;
    private final UploadService uploadService;

    public WorkPlanPageController(TaskRepository taskRepository, UploadService uploadService) {
        this.taskRepository = taskRepository;
        this.uploadService = uploadService;
    }

    @GetMapping
    public String workPage(Model model) {
        Iterable<Task> tasks = taskRepository.findAllByOrderByIdDesc();
        model.addAttribute("tasks", tasks);

        return "workPlan";
    }

    @GetMapping("id{task}")
    public String taskEditForm(@PathVariable Task task,
                               Model model) {
        model.addAttribute("task", task);

        return "taskEditForm";
    }

    @PostMapping("/task-edit")
    public String taskSave(@RequestParam("taskId") Task task,
                           @RequestParam(required = true) String header,
                           @RequestParam(required = true) String title,
                           @RequestParam(required = true) String text,
                           @RequestParam(value = "file") MultipartFile file) throws IOException {

        task.setHeader(header);
        task.setTitle(title);
        task.setText(text);
        if (file != null && !file.getOriginalFilename().isEmpty())
            task.setFilename(uploadService.uploadFile(file));


        taskRepository.save(task);

        return "redirect:/work-plan";
    }

    @GetMapping("delete{task}")
    public String deleteUser(@PathVariable Task task) {

        taskRepository.delete(task);

        return "redirect:/work-plan";
    }

}
