package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	// 조회
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	// 삭제(id기준)
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	// 삽입
	public void addBooking(Booking booking) {
		bookingDAO.insertBooking(booking);
	}
	
	// name, phone조회
	public Booking getBookingBynamePhoneNumber(String name, String phoneNumber) {
		List<Booking> booking = bookingDAO.selectBookingBynamePhoneNumber(name, phoneNumber);
		if(booking.isEmpty() == false) {
			return booking.get(0);
		}
		return null;
	}

}
