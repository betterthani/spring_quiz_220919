package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.FavoriteDAO;
import com.quiz.lesson06.model.FavoriteUrl;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteDAO favoriteDAO;

	public void addFavorite(FavoriteUrl favoriteUrl) {
		favoriteDAO.InsertFavorite(favoriteUrl);
	}
	
	public List<FavoriteUrl> getFavoriteList(){
		return favoriteDAO.selectFavoriteList();
	}
}
