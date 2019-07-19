package com.example.ezentour.model.home.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.ezentour.controller.HotelController;
import com.example.ezentour.model.home.dto.HomeSearchDTO;
import com.example.ezentour.model.user.dto.CartDTO;

@Repository
public class HomeSearchDAOImpl implements HomeSearchDAO {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HomeSearchDTO> list(String h_address, String checkin,  String checkout, int hr_room, String h_type) {
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("h_address", h_address);
		map.put("checkin", checkin);
		map.put("checkout", checkout);
		map.put("hr_room", hr_room);
		map.put("h_type", h_type);
		
		LOG.info("List<HomeSearchDTO> list" + map.get("checkin"));
		
		List<HomeSearchDTO> list= sqlSession.selectList("home.SearchList", map);
		return list;
	}

}
