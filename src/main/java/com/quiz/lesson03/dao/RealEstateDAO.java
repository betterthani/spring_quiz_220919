package com.quiz.lesson03.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstate(int id);
	
	public List<RealEstate> selectRealEstate_2(Integer rentPrice);
	
	public List<RealEstate> selectRealEstate_3(int area, int price);
}
