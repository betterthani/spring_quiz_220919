package com.quiz.lesson07;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/lesson07")
public class Quiz01Controller {
	
	// localhost:8080/lesson07/login_view
	@GetMapping("/login_view")
	public String loginView() {
		return "lesson07/login";
	}
	
	@GetMapping("/join_view")
	public String joinView() {
		return "lesson07/join";
	}
}
