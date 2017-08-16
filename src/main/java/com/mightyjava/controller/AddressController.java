package com.mightyjava.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mightyjava.model.Address;
import com.mightyjava.service.AddressService;
import com.mightyjava.service.UserService;

@Controller
@RequestMapping("/address")
public class AddressController {
	
	private AddressService addressService;
	private UserService userService;

	@Autowired
	public AddressController(AddressService addressService, UserService userService) {
		this.addressService = addressService;
		this.userService = userService;
	}
	
	@GetMapping("/form")
	public String addressForm(Model model) {
		model.addAttribute("addressForm", new Address());
		model.addAttribute("users", userService.userList());
		return "address/form";
	}
	
	@GetMapping("/edit/{id}")
	public String addressOne(@PathVariable Long id, Model model) {
		model.addAttribute("addressForm", addressService.findOne(id));
		model.addAttribute("users", userService.userList());
		return "address/form";
	}
	
	@GetMapping("/delete/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String addressDelete(@PathVariable Long id, Model model) {
		model.addAttribute("message", addressService.deleteAddress(id));
		return "message";
	}
	
	@PostMapping("/add")
	public String addressAdd(@ModelAttribute Address address, Model model) {
		String message = null;
		if (address.getId() == null) {
			message = " added";
		} else {
			message = " updated";
		}
		model.addAttribute("message", addressService.addAddress(address).getCountry() + message + " successfully.");
		return "message";
	}
	
	@GetMapping("/list/{id}")
	public Address findOne(@PathVariable Long id) {
		return addressService.findOne(id);
	}
	
	@GetMapping("/list")
	public String addressList(Model model) {
		model.addAttribute("addresses", addressService.addressList());
		return "/address/list";
	}
	
}
