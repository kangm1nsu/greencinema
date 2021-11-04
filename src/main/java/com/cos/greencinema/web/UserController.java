package com.cos.greencinema.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.domain.user.UserRepository;
import com.cos.greencinema.util.MyAlgorithm;
import com.cos.greencinema.util.SHA;
import com.cos.greencinema.util.Script;
import com.cos.greencinema.web.dto.JoinReqDto;
import com.cos.greencinema.web.dto.LoginReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	// 생성자 주입 (DI)
	private final UserRepository userRepository;
	private final HttpSession session;
	
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
	public @ResponseBody String Login(@Valid LoginReqDto dto, BindingResult bindingResult) {
		System.out.println("에러사이즈:" + bindingResult.getFieldErrors().size());

		if( bindingResult.hasErrors() ) {
			Map<String, String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}	
			return Script.back(errorMap.toString());
		} 
		
		// 일반 회원 로그인
		User principal = userRepository.mLogin(dto.getUsername(), SHA.encrypt(dto.getPassword(), MyAlgorithm.SHA256));
		if ( principal.getAdminNum() == 0 ) {
			System.out.println(principal.getAdminNum());
			session.setAttribute("principal", principal);
			return Script.href("/","로그인 성공");
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
	
	@GetMapping("/logout")
	public String logout() {
		// return "board/list"; // 게시글 목록 화면에 데이터 x
		session.invalidate(); // 세션 무효화(jsessionid에 있는 값을 비우는 것)
		return "redirect:/";
	}
}
