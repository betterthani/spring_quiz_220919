package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstate_2(Integer rentPrice) {
		return realEstateDAO.selectRealEstate_2(rentPrice);
	}
	
	public List<RealEstate> getRealEstate_3(int area, int price) {
		return realEstateDAO.selectRealEstate_3(area, price);
	}
	
}
