package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.NewReviewDAO;
import com.quiz.lesson05.model.NewReview;

@Service
public class NewReviewBO {
	
	@Autowired
	private NewReviewDAO newReviewDAO;
	
	public List<NewReview> getNewReviewByStoreIdName(int storeId){
		return newReviewDAO.selectNewReviewByStoreIdName(storeId);
	}
	

}
