package com.eventmanagement.controller.web;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.eventmanagement.dto.UserDTO;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(Principal principal) {
		ModelAndView mav = new ModelAndView("web/home");
		if(principal != null) {
			String username = principal.getName();
			if(username != null)
				mav.addObject("username", username);
		}
		return mav;
	}
	@RequestMapping(value = "/su-kien/{id}", method = RequestMethod.GET)
	public ModelAndView eventDetail(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/web/eventdetails");
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping(value="/dang-ky", method = RequestMethod.GET)
	public ModelAndView register() {
		UserDTO userdto =  new UserDTO();
		ModelAndView mav = new ModelAndView("/web/register");
		mav.addObject("user", userdto);
		return mav;
	}
}
