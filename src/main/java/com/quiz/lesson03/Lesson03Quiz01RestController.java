package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {
	
	@Autowired
	private RealEstateBO realEstateBO;
	
	//http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("lesson03/quiz01/1")
	public RealEstate quiz01 (
			@RequestParam(value="id", defaultValue = "1") int id) {
		return realEstateBO.getRealEstate(id);
	}
	
	// http://localhost:8080/lesson03/quiz01/2?rent_price=90
		@RequestMapping("lesson03/quiz01/2")
		public List<RealEstate> quiz01_2 (
				@RequestParam(value="rentPrice", required = false) Integer rentPrice) {
			return realEstateBO.getRealEstate_2(rentPrice);
		}
		
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
		@RequestMapping("lesson03/quiz01/3")
		public List<RealEstate> quiz01_3(
				@RequestParam(value="area") int area, 
				@RequestParam(value="price") int price
		) {
			return realEstateBO.getRealEstate_3(area, price);
		}
}
