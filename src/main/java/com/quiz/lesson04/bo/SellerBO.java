package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	public void addSeller(String nickname, String profileImageUrl, Double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	// BO에서의 입장은 id가 반드시 받아와야하므로 int형으로 선언, controller와는 상관이 없음
	public Seller getSellerById(int id) {
		return sellerDAO.selectSellerById(id);
	}
	
}
