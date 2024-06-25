package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.mail.MailerServiceImpl;
import com.poly.service.SessionService;

import jakarta.mail.MessagingException;

@Controller
public class AccountController {

	@Autowired
	SessionService session;

	@Autowired
	AccountDAO accDao;

	static int codeForgot = 0;

	@Autowired
	MailerServiceImpl mail;

	@GetMapping("/logout")
	public String logout() {
		session.remove("user");
		session.remove("cart");
		return "redirect:/";
	}

	@RequestMapping("/profile")
	public String doProfile(Model model) {
		return "account/profile";
	}

	@PostMapping("/account/change-password")
	public String change_password(Model model, @RequestParam("oldPass") String oldPass,
			@RequestParam("newPass") String newPass, @RequestParam("confirm-newPass") String confirm) {
		Account user = session.get("user");
		if (user.getPassword().equals(oldPass)) {
			if (newPass.equals(confirm)) {
				user.setPassword(newPass);
				accDao.save(user);
				model.addAttribute("success_changePassword", "Change password success!");
			} else
				model.addAttribute("error_changePassword", "Confirm password invalid!");
		} else
			model.addAttribute("error_changePassword1", "Old password invalid!");
		return "account/profile";
	}

	@GetMapping("/account/forgotpassword")
	public String forgotPassword() {
		return "account/forgotPass";
	}
	
	@PostMapping("/account/forgotpassword")
	public String forgotpassword(Model model, @RequestParam("username") String username){
		if (username.equals(""))
			model.addAttribute("error_forgot_username", "Username empty!");
		else if (!accDao.existsById(username)) {
			model.addAttribute("username", username);
			model.addAttribute("error_forgot_username", "Username not exits!");
		} else {
			codeForgot = (int) (Math.random() * 100000);
			mail.queue(accDao.findById(username).get().getEmail(), "Password change",
					"http://localhost:8082/account/reset-password/" + username + "/" + codeForgot);
			model.addAttribute("success_forgot_username", "Password change link has been sent to your email!");
		}
		return "account/forgotPass";
	}

	@GetMapping("/account/reset-password/{username}/{otp}")
	public String resetPassword(Model model, @PathVariable("username") String username,
			@PathVariable("otp") Integer otp) {
		if (accDao.existsById(username)) {
			if (otp == codeForgot) {
				model.addAttribute("username", username);
				return "account/resetPass";
			} else
				return "account/forgotPass";
		}
		return "account/forgotPass";
	}

	@PostMapping("/account/reset-password/{username}")
	public String resetPassword_reset(Model model, @PathVariable("username") String username,
			@RequestParam("password") String password, @RequestParam("confirm") String confirm) {
		if (accDao.existsById(username)) {
			if (password.equals(""))
				model.addAttribute("error_resetPassword_password", "Password empty!");
			else if (confirm.equals(""))
				model.addAttribute("error_resetPassword_confirm", "Confirm password empty!");
			else if (!confirm.equals(password))
				model.addAttribute("error_resetPassword_confirm", "Confirm password invalid!");
			else {
				Account acc = accDao.findById(username).get();
				acc.setPassword(password);
				accDao.save(acc);
				model.addAttribute("success_resetPassword", "Reset password success!");
			}
			return "account/resetPass";
		}
		return "account/forgotPass";
	}
}
