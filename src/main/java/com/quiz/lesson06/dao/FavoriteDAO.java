package com.quiz.lesson06.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.FavoriteUrl;

@Repository
public interface FavoriteDAO {
	
	public void InsertFavorite(FavoriteUrl favoriteUrl);
	
	public List<FavoriteUrl> selectFavoriteList();
}
