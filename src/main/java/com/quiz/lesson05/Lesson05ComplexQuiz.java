package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;
import com.quiz.lesson05.bo.NewReviewBO;
import com.quiz.lesson05.model.NewReview;

@Controller
@RequestMapping("/lesson05")
public class Lesson05ComplexQuiz {
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private NewReviewBO newReviewBO;
	
	// 가게 선택 페이지
	// http://localhost:8080/lesson05/storeView
	@GetMapping("/storeView")
	public String getStore_View(Model model) {
		
		// DB select 
		List<Store> StoreList = storeBO.getStoreList();
		
		// view 연결
		model.addAttribute("StoreList", StoreList);
		
		return "lesson05/complexQuiz/getStore";
	}
	
	// 리뷰페이지
	// http://localhost:8080/lesson05/reviewView
	@GetMapping("/reviewView")
	public String getNewReview_View(
			@RequestParam("storeId") int storeId,
			@RequestParam("name") String name,
			Model model) {
		
		//DB select
		List<NewReview> newReviewList = newReviewBO.getNewReviewByStoreIdName(storeId);
		
		//view 연결
		model.addAttribute("newReviewList", newReviewList);
		model.addAttribute("name", name);
		
		return "lesson05/complexQuiz/getNewReview";
	}
	
}
