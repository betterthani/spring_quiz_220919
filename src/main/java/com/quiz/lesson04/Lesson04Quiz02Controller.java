package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	
	@Autowired
	private RealtorBO realtorBO;
	
	// 추가 화면
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/addRealtor";
	}
	
	// insert 화면 => 방금 추가된 공인중개사 정보
	@PostMapping("/add_realtor")
	public String addRealtor( // 최종 응답값은 뷰페이지로 String
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// DB insert
		realtorBO.addRealtor(realtor);
		
		// DB select (방금 insert된 정보 가져오기)
		Realtor realtor1 = realtorBO.getRealtorById(realtor.getId());
		
		// model(veiw화면과 연결)
		model.addAttribute("result",realtor1);
		model.addAttribute("title", "공인중개사 정보");
		
		// 화면 출력(view페이지 이동)
		return "lesson04/afterAddRealtor";
	}
}
