package com.cos.greencinema.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ResController {
	@GetMapping("/res")
	public String Reserve() {
		return "res/reserve";
	}
	
	@PostMapping("/pay")
	public String postPay() {
		return "pay/pay";
	}
	
	@GetMapping("/pay")
	public String getPay() {
		return "pay/pay";
	}
	
	@GetMapping("/mlist")
	public String getMovieList() {
		return "res/movieList";
	}
	
	@PostMapping("/res")
	public String postResrve() {
		return "res/reserve";
	}
}
