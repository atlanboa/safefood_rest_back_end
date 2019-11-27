package com.ssafy.safefood.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.safefood.vo.FoodVO;

@Repository
public class FoodDaoImpl implements FoodDao {
	private String[] allergys = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "돼지고기", "복숭아", "민들레",
	"계란흰자" };
	
	private final String ns = "FoodMapper.";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<FoodVO> selectByFoodName(String name) throws Exception {
		
		return session.selectList(ns+"selectByFoodName", name);
	}

	@Override
	public List<FoodVO> selectByFoodMaker(String maker) throws Exception {
		return session.selectList(ns+"selectByFoodMaker", maker);
	}

	@Override
	public List<FoodVO> selectByFoodMaterial(String material) throws Exception {

		return session.selectList(ns+"selectByFoodMaterial", material);
	}

	@Override
	public FoodVO selectByFoodCode(String code) throws Exception {

		return session.selectOne(ns+"selectByFoodCode", code);
	}

	@Override
	public List<FoodVO> selectAll() throws Exception {

		return session.selectList(ns+"selectAll");
	}

	@Override
	public void insertFood(FoodVO vo) throws Exception {
		session.insert(ns+"insertFood", vo);
	}

	@Override
	public void updateFood(FoodVO vo) throws Exception {
		session.update(ns+"updateFood", vo);
	}

	@Override
	public void deleteFood(int code) throws Exception {
		session.delete(ns+"deleteFood", code);
	}
}
