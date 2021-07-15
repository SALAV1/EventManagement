package com.eventmanagement.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerOfAdmin")
public class HomeController {

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView homePage() {
		ModelAndView mav = new ModelAndView("admin/home");
		return mav;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public  ModelAndView createEvent() {
		ModelAndView mav = new ModelAndView( "/admin/create_event");
		mav.addObject("id", 0);
		return mav;
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public ModelAndView editEvent(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/create_event");
		mav.addObject("id", id);
		return mav;
	}
	
	@RequestMapping(value="/event/{id}")
	public ModelAndView viewEvent(@PathVariable("id") int id) {
		ModelAndView mav = new ModelAndView("/admin/eventdetails");
		mav.addObject("id", id);
		return mav;
	}
	
}
