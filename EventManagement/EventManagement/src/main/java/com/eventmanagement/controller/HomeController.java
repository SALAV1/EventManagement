package com.eventmanagement.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.eventmanagement.dto.UserDTO;
import com.eventmanagement.service.EventService;

@Controller(value = "homeController")
public class HomeController {
	@RequestMapping(value = "/homehome", method = RequestMethod.GET)
	public String home() {
		EventService es = new EventService();
		List re = es.findAll();
		if(re != null)
			System.out.print("Dung roi!");
		else
			System.out.print("Sai roi!");
		return "home";
	}
	
	@RequestMapping(value="/create_event", method = RequestMethod.GET)
	public ModelAndView eventdetails() {
		ModelAndView view = new ModelAndView("/admin/create_event");
		return view;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView loginpage() {
		ModelAndView mav = new ModelAndView("/web/login");
		return mav;
	}
	
	@RequestMapping(value="/403", method = RequestMethod.GET)
	public ModelAndView page403() {
		ModelAndView mav = new ModelAndView("/web/403");
		return mav;
	}
	
	@GetMapping("/user/registration")
	public String showRegistrationForm(WebRequest request, Model model) {
	    UserDTO userDto = new UserDTO();
	    model.addAttribute("user", userDto);
	    return "registration";
	}
}
