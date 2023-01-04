package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
public class Lesson05ComplexQuiz {
	
	@Autowired
	private StoreBO storeBO;
	// http://localhost:8080/lesson05/storeView
	@GetMapping("/lesson05/storeView")
	public String getStore_View(Model model) {
		
		// DB select 
		List<Store> StoreList = storeBO.getStoreList();
		
		// view 연결
		model.addAttribute("StoreList", StoreList);
		
		return "lesson05/getStore";
	}
	
	// http://localhost:8080/lesson05/reviewView
	@GetMapping("/lesson05/reviewView")
	public String getNewReview_View() {
		return "lesson05/getNewReview";
	}
	
}
