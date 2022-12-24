package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	@Autowired // 객체 생성 (spring bean은 new로 객체생성해주면 안됨. BO는 DAO에 요청해야하므로, 해당 어노테이션으로 요청함) - Dependency Injection(DI)
	private StoreDAO storeDAO;
	
	// input : 컨트롤러가 보내주지 않음 x
	// output(=리턴타입 =List<Store>) : List<Store> => 컨트롤러한테 보냄
	public List<Store> getStoreList() { //getStoreList 변수명 get + 테이블명 + 사용하는 메소드
		return storeDAO.selectStoreList();
	}
}
