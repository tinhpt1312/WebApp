package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.SessionService;

@Controller
public class LoginController {

	@Autowired
	AccountDAO acDao;

	@Autowired
	SessionService session;

	@GetMapping("/login")
	public String doLogin() {
		return "account/login";
	}

	@PostMapping("/login")
	public String Login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		String forward = "redirect:/";
		if (username.equals("")) {
			forward = "account/login";
			model.addAttribute("error_signin_username", "Username empty!");
		} else if (password.equals("")) {
			forward = "account/login";
			model.addAttribute("error_signin_password", "Password empty!");
			model.addAttribute("username", username);
		} else if (!acDao.existsById(username)) {
			forward = "account/login";
			model.addAttribute("error_signin_username", "Username not exits!");
			model.addAttribute("username", username);
		} else if (!acDao.findById(username).get().getPassword().equals(password)) {
			forward = "account/login";
			model.addAttribute("error_signin_password", "Password invalid!");
			model.addAttribute("username", username);
		} else {
			forward = "redirect:/";
			session.set("user", acDao.findById(username).get());
		}
		
		return forward;
	}

	@RequestMapping("/signup")
	public String signup(@ModelAttribute("acc") Account acc) {
		acc.setUsername(null);
		return "account/signup";
	}

	@PostMapping("/signup/create")
	public String getCreateAccount(Model model,@Validated @ModelAttribute("acc") Account acc, BindingResult result) {
		if(!result.hasErrors()) {
			if(!acDao.findById(acc.getUsername()).isEmpty()) {
				model.addAttribute("error_acc", "Id này đã tồn tại!");
			}else {
				acc.setActivated(true);
				acc.setAdmin(false);
				acc.setPhoto("noPhoto");
				acDao.save(acc);
				model.addAttribute("success_acc", "Đăng kí thành công! hãy đăng nhập");
			}
		}
		
		return "account/signup";
	}
}
