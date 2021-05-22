package com.airbusaerothon.services;

import java.util.Arrays;
import java.util.Collection;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.airbusaerothon.doa.UserRegistrationDao;
import com.airbusaerothon.model.User;
import com.airbusaerothon.model.Role;
import com.airbusaerothon.repository.UserRepository;

@Service
public class UserServicesImpl implements UserServices {

	private UserRepository UserRepository;
	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public UserServicesImpl(com.airbusaerothon.repository.UserRepository userRepository) {
		super();
		UserRepository = userRepository;
	}


	@Override
	public User save(UserRegistrationDao registrationDao) {
		User user = new User(registrationDao.getFirstName(), registrationDao.getLastName(),
				registrationDao.getEmail(),passwordEncoder.encode(registrationDao.getPassword()) ,Arrays.asList(new Role("ROLE_USER")));
	
		return UserRepository.save(user);
	}


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = UserRepository.findByEmail(username);
		if(user==null)
		{
			throw new UsernameNotFoundException("Invalid username or password");
			
		}
		return new org.springframework.security.core.userdetails.User(user.getEmail(), user.getPassword(), mapRolesToAuthorities(user.getRoles()));
	}	
	
	private Collection<? extends GrantedAuthority> mapRolesToAuthorities(Collection<Role> roles)
	{
		return roles.stream().map(role-> new SimpleGrantedAuthority(role.getName())).collect(Collectors.toList());
	}
	
	
	
	
	
	
	
}
