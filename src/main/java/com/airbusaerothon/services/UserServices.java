package com.airbusaerothon.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.airbusaerothon.doa.UserRegistrationDao;
import com.airbusaerothon.model.User;

public interface UserServices extends UserDetailsService{
	User save(UserRegistrationDao registrationDao);
}
