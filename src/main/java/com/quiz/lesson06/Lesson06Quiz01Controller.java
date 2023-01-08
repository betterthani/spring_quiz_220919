package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.FavoriteUrl;

@Controller
@RequestMapping("/lesson06")
public class Lesson06Quiz01Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// 즐겨찾기 추가 화면
	// localhost:8080/lesson06/quiz01/favorite_view
	@GetMapping("/quiz01/favorite_view")
	public String addFavoriteView() {
		return "lesson06/quiz01/addFavorite";
	}
	
	// 즐겨찾기 추가(추가화면 버튼 눌렀을때 동작하는 곳) - AJAX 통신 요청
	@ResponseBody
	@PostMapping("/quiz01/favorite")
	public Map<String, String> addFavorite( 
			@ModelAttribute FavoriteUrl favoriteUrl // 스크립트상 data "필드명"을 requestparm에 넣어진다. 
			) {
		
		// db insert
		favoriteBO.addFavorite(favoriteUrl);
		
		// 성공 값 응답값 (브레이크 포인트)
		Map<String, String> result = new HashMap<>();
		result.put("result", "성공");
		
		return result; // jackson => JSON String (이유 : String형이 아닌 Map형의 리턴값이므로)
	}
	
	// 즐겨찾기 목록 화면
	// localhost:8080/lesson06/quiz01/after_favorite_view
	@GetMapping("/quiz01/after_favorite_view")
	public String afterFavoriteView(Model model) {
		
		// DB select
		List<FavoriteUrl> favoriteList = favoriteBO.getFavoriteList();
		
		// model
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/quiz01/afterFavorite";
	}
	
	// url 중복확인 - ajax통신
	@ResponseBody // model객체를 사용할 수 없는 상태가 됨.
	@PostMapping("/quiz02/is_duplication_url")
	public Map<String, Boolean> isDuplicationUrl(
			@RequestParam("url") String url){
		
		Map<String, Boolean> result = new HashMap<>(); // 브레이크 포인트(url들어오는지 체크)
		
		// 중복확인 seelct(data의 한 행을 가져오는 방식으로)
		FavoriteUrl favorite =  favoriteBO.getFavoriteListByUrl(url); // exist보다는 쿼리문 재활용이 가능하여 이렇게 행으로 갖고오는게 더 좋다.
		if(favorite != null) {
			// 중복
			result.put("is_duplication", true);
		}else {
			result.put("is_duplication", false);
		}
		
		return result;
	}
	
	// API부분
	// delete - ajax통신
	@ResponseBody
	@DeleteMapping("/quiz02/delete_favorite")
	public Map<String, Object> deleteFavorite(
			@RequestParam("id") int id){
		
		Map<String, Object> result = new HashMap<>();
		
		// db delete (몇개가 삭제 되었는지 이번에 해보기)
		int row = favoriteBO.deleteFavoriteByid(id);
		if(row > 0) {
			result.put("code", 1); // 성공(임의 생성 규칙) _ 클라이언트 확인용
			result.put("result", "성공");
		}else {
			result.put("code", 500); // 실패
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result;
	}
	
	
}
