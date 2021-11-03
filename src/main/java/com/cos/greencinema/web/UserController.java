package com.cos.greencinema.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.domain.user.UserRepository;
import com.cos.greencinema.util.MyAlgorithm;
import com.cos.greencinema.util.SHA;
import com.cos.greencinema.web.dto.JoinReqDto;
import com.cos.greencinema.web.dto.LoginReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	// 생성자 주입 (DI)
	private final UserRepository userRepository;
	
	//상진 영역
	
	//민수 영역
	
	//민환 영역
	
	//민홍 영역
	
	// 1. 회원 가입
	@PostMapping("/join")
	public String Join(JoinReqDto dto) {
		System.out.println(dto.getUsername());
		String encpassword = SHA.encrypt(dto.getPassword(), MyAlgorithm.SHA256);
		dto.setPassword(encpassword);
		userRepository.save(dto.toEntity());
		return "user/loginForm";
	}
	
	// 2. 로그인
	@PostMapping("/login")
	public String Login(LoginReqDto dto) {		
		// 일반 회원 로그인
		User principal = userRepository.mLogin(dto.getUsername(), SHA.encrypt(dto.getPassword(), MyAlgorithm.SHA256));
		if ( principal.getAdminNum() == 0 ) {
			System.out.println(principal.getAdminNum());
			return "/index";
		} else {
			return "/admin/movieManage";
		}
	}
	
	@GetMapping("/joinForm")
	public String userjoinForm() {
		return "user/joinForm";
	}
	@GetMapping("/loginForm")
	public String userloinForm() {
		return "user/loginForm";
	}
}
