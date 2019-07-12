package com.example.ezentour.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.user.CartService;

@Controller
public class HotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	HotelService hotelService;
	@Inject
	CartService cartService;
	
	HotelDTO hotelDto;
	
	@RequestMapping(value = "hotel/main")
	public String home() {		
		return "hotel/hotel_home";
	}
	
	@RequestMapping(value = "hotel/detail/cart")
	public String hotel_detail_cart(HttpServletRequest request,Model model) throws ParseException {	
		
		String num = request.getParameter("num"); // 받아온 파라미터에 따라 페이지 변동
		String checkInDate = request.getParameter("checkInDate"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkOutDate");
		Date inDate;
		Date outDate;
		SimpleDateFormat transFormat = new SimpleDateFormat("ddMMyy");
		
		checkInDate = checkInDate.replace("/","");
		checkOutDate = checkOutDate.replace("/","");
		inDate = transFormat.parse(checkInDate);
		outDate = transFormat.parse(checkOutDate);
		
		hotelDto = hotelService.viewHotel(2); // 호텔 번호 1로 임의의 값을 줌 ( view에 아직 호텔 정보 없어 정보 못가져옴)
		System.out.println("hotelDtoToStringCheck : "+ hotelDto.toString());
		cartService.insertCartList(1,hotelDto.getH_no(),hotelDto.getH_m_id(),inDate,outDate);
		model.addAttribute("cartList", cartService.viewCartList());
		
		if(num.equals("1")) {
			return "user/mypage/mycart";
		} else {
			return "hotel/hotel_detail";
		}
	}
	
	@RequestMapping(value="hotel/detail")
	public String hotel_detail() {
		return "hotel/hotel_detail";
	}
}
