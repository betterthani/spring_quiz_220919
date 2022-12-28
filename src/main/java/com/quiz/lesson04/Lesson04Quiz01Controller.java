package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	// 판매자 추가 화면
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// 서버 (form태그 요청받는 곳)
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam(value = "temperature", required = false) Double temperature
	) {
		// DB insert , 응답값
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/afterAddSeller";
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info
	// http://localhost:8080/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info") // 주소를 치고 들어가는것이기 때문에 get방식
	public String getLastSellerView(
			@RequestParam(value = "id", required = false) Integer id,
			Model model) {
		
		// DB select
		Seller seller = null;
		if (id == null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		model.addAttribute("seller",seller); // 공통구문 밖으로 빼기
		
		return "lesson04/sellerInfo";
	}
	
}
