package com.ariya.repository;

import com.ariya.entity.Task;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TaskRepository extends CrudRepository<Task, Long> {

    List<Task> findAllByOrderByIdDesc();

}
