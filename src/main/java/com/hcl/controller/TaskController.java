package com.hcl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hcl.dao.TaskRepository;
import com.hcl.model.Task;

@Controller
public class TaskController {
	@Autowired
	private TaskRepository repo;
	
	
	@GetMapping("/")
	public String getRoot() {
		return("redirect:/list");
	}
	
	@GetMapping("/list")
	public ModelAndView listTasks() {
		List<Task> allTasks = (List<Task>) repo.findAll();
		return new ModelAndView("list", "tasks", allTasks);
	}
	
	@GetMapping("/newtask")
	public ModelAndView addTaskForm() {
		Task newTask = new Task();
		return new ModelAndView("addtask", "form", newTask);
	}
	
	@PostMapping("/newtask")
	public String addTask(Task t) {
		repo.save(t);
		return("redirect:/list");
	}
	
	@GetMapping("/edittask/{id}")
	public ModelAndView editTaskForm(@PathVariable("id") long id) {
		ModelAndView mv = new ModelAndView("edittask");
		Task taskToEdit = repo.findById(id).get();
		mv.addObject("form", taskToEdit);
		return mv;
	}
	
	@PostMapping("/edittask/{id}")
	public String editTask(@ModelAttribute("task") Task t) {
		repo.save(t);
		return("redirect:/list");
	}
	
	@GetMapping("/deltask/{id}")
	public String delTask(@PathVariable("id") long id) {
		repo.deleteById(id);
		return("redirect:/list");
	}

}