 package com.airbusaerothon.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airbusaerothon.doa.UserRegistrationDao;
import com.airbusaerothon.services.UserServices;

@org.springframework.stereotype.Controller
public class Controller {
	
	private UserServices userServices;
	
	public Controller(UserServices userServices) {
		this.userServices = userServices;
	}

	
	@ModelAttribute("user")
	public UserRegistrationDao userRegistrationDao(){
		return new UserRegistrationDao();
	}
	
	
	@GetMapping("/registration")
	public String showRegistrationForm()
	{
		return "registration";
	}
	
	@PostMapping("/registration")
	public String registerUserAccount(@ModelAttribute("user") UserRegistrationDao registrationDao ){
		
		try {
			userServices.save(registrationDao);
			return "redirect:/registration?success";
		}
		catch(Exception e)
		{
			return "Sorry! there is an error";
		}
		
	}	
	
	
}
