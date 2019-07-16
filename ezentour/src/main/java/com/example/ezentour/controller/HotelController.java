package com.example.ezentour.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ezentour.model.hotel.dto.HotelDTO;
import com.example.ezentour.model.user.dto.CartDTO;
import com.example.ezentour.service.hotel.HotelService;
import com.example.ezentour.service.member.MemberService;
import com.example.ezentour.service.user.CartService;

@Controller
public class HotelController {
	private static final Logger LOG = LoggerFactory.getLogger(HotelController.class);
	@Inject
	HotelService hotelService;
	@Inject
	CartService cartService;
	@Inject
	MemberService memberService;
	
	@RequestMapping(value = "hotel/main")
	public ModelAndView hotel_home(ModelAndView mav) {		
		
		List<HotelDTO> list = hotelService.listHotel();
		mav.setViewName("hotel/hotel_home");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value = "hotel/detail/cart")
	public String hotel_detail_cart(HttpServletRequest request,Model model,HttpSession session) throws ParseException {	
		
		String num = request.getParameter("num"); // 받아온 파라미터에 따라 페이지 변동
		String checkInDate = request.getParameter("checkInDate"); // name으로 받아옴
		String checkOutDate = request.getParameter("checkOutDate");
		LOG.info("checkInDate : " + checkInDate);
		String m_id = (String) session.getAttribute("m_id");
		String str = request.getParameter("h_no");
		int h_no = Integer.parseInt(str);
		
		HotelDTO hotelDto = hotelService.viewHotel(h_no);
		LOG.info(hotelDto.toString());
		
		cartService.insertCartList(hotelDto.getH_no(),m_id,checkInDate,checkOutDate);
		
		if(num.equals("1")) {
			return "redirect:../../mypage/user/mycart";
		} else {
			return "redirect:../../mypage/user/mycart";
		}
	}
	
	@RequestMapping(value="hotel/detail.do")
	public String hotel_list_detail(@RequestParam int h_no, Model model,HttpSession sesstion) {
		model.addAttribute("hotel", hotelService.viewHotel(h_no));
		String m_id = (String) sesstion.getAttribute("m_id");
		if(m_id!=null) {
		model.addAttribute("field", memberService.viewMember(m_id).getM_field());
		return "hotel/hotel_detail";
		} return "hotel/hotel_detail";
	}
}
