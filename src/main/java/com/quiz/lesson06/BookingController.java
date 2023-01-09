package com.quiz.lesson06;

import java.util.ArrayList;
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

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
@RequestMapping("/booking")
public class BookingController {
	@Autowired
	private BookingBO bookingBO;
	
	// 예약 목록 보기
	// localhost:8080/booking/reservationList_view
	@GetMapping("/reservationList_view")
	public String reservationListView(Model model) {
		
		//DB select
		List<Booking> bookingList = bookingBO.getBookingList();
		
		// model 연결
		model.addAttribute("bookingList", bookingList);
		
		// view 연결
		return "lesson06/quiz02/reservationList";
	}
	
	// 삭제 API
	// localhost:8080/booking/delete_booking
	@ResponseBody // 결과를 항상 json으로 내려준다.
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id){
		
		Map<String, Object> result = new HashMap<>();
		
		int row = bookingBO.deleteBookingById(id);
		if(row > 0) {
			result.put("code",1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제된 행이 없습니다.");
		}
		
		return result; 
	}
	
	// 예약하기 페이지
	// localhost:8080/booking/reservation_view
	@GetMapping("/reservation_view")
	public String reservationView() {
		return "lesson06/quiz02/reservation";
	}
	
	// 문제2) 예약추가 - ajax통신
	@ResponseBody
	@PostMapping("/reservation")
	public Map<String,String> reservation(@ModelAttribute Booking booking){
		
		// DB insert(서버의 역할로 응답값이 잘되는지 우선 확인하려면, 해당 행 비워두고 Map에 브레이크포인트 둔 후 검토)
		bookingBO.addBooking(booking);
		
		//성공값 응답값
		Map<String,String> result = new HashMap<>();
		result.put("result", "예약 성공");
		
		return result;
	}
	
	// 메인 화면
	// localhost:8080/booking/homepage_view
	@GetMapping("/homepage_view")
	public String homepageView() {
		return "lesson06/quiz02/bookingHomepage";
	}
	
	// 조회하기 버튼 ajax (내가 한 버전)
//	@ResponseBody
//	@PostMapping("/homepage")
//	public Map<String,Booking> homepage(
//			@RequestParam("name") String name,
//			@RequestParam("phoneNumber") String phoneNumber){
//		
//		Booking booking = bookingBO.getBookingBynamePhoneNumber(name, phoneNumber);
//		
//		Map<String, Booking> result = new HashMap<>();
//		
//		if(booking != null) {
//			result.put("answer", booking);
//		} else {
//			result.put("answer", null);
//		}
//		
//		return result;
//		
//	}
	
	@ResponseBody
	@PostMapping("/homepage")
	public Map<String,Object> getBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber){
		
		// DB select - 최신 예약정보 1건
		Booking booking = bookingBO.getLatestBookingByNamePhoneNumber(name, phoneNumber);
		
		Map<String,Object> result = new HashMap<>();
		if(booking != null) {
			result.put("booking", booking);
			result.put("code", 1);
		} else {
			result.put("code", 500);
		}
		return result;
	}
}
