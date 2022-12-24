package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {
	
	// input : BO가 아무것도 주지 않음 x
	// output : BO한테 결과값 줌 (List<Store>) 
	public List<Store> selectStoreList(); // 쿼리문 이름으로 작성
}
