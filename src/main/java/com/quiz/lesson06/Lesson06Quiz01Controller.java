package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.FavoriteUrl;

@Controller
@RequestMapping("/lesson06")
public class Lesson06Quiz01Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// localhost:8080/lesson06/quiz01/favorite_view
	@GetMapping("/quiz01/favorite_view")
	public String addFavoriteView() {
		return "lesson06/quiz01/addFavorite";
	}
	
	@ResponseBody
	@PostMapping("/quiz01/favorite")
	public String addFavorite(
			@ModelAttribute FavoriteUrl favoriteUrl
			) {
		
		// db insert
		favoriteBO.addFavorite(favoriteUrl);
		
		return "입력 성공";
	}
	
	// localhost:8080/lesson06/quiz01/after_favorite_view
	@GetMapping("/quiz01/after_favorite_view")
	public String afterFavoriteView(Model model) {
		
		// DB select
		List<FavoriteUrl> favoriteList = favoriteBO.getFavoriteList();
		
		// model
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/quiz01/afterFavorite";
	}
	
}
