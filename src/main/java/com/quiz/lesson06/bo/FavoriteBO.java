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

	public List<FavoriteUrl> getFavoriteList() {
		return favoriteDAO.selectFavoriteList();
	}

	// 중복의 데이터가 이미 없을 경우
	public FavoriteUrl getFavoriteByUrl(String url) { // DB에서 가져온 하나의 행으로 컨트롤러에게 돌려주는그래서 FavoriteUrl
		return favoriteDAO.selectFavoriteByUrl(url);
	}

	// 중복의 데이터가 이미 존재할 경우 (dao에서 받아온 list를 컨트롤러에게 필요한 내용을 가공하여 주는 방법)
	public FavoriteUrl getFavoriteListByUrl(String url) { // DB에서 가져온 하나의 행으로 컨트롤러에게 돌려주는그래서 FavoriteUrl
		List<FavoriteUrl> favoriteList = favoriteDAO.selectFavoriteListByUrl(url);

		// 0행, 1행의 중복내용이 있다면, 0번쨰를 갖고온다. / ([]의 경우)내용이 비어있으면 null로 출력된다.
		if (favoriteList.isEmpty() == false) { // 리스트가 채워져 있을 때
			return favoriteList.get(0);
		}

		// 비어있는 경우
		return null;
	}

	// 데이터 삭제
	public int deleteFavoriteByid(int id) {
		return favoriteDAO.deleteFavoriteByid(id);
	}

}
