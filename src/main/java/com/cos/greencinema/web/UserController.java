package com.cos.greencinema.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.domain.user.UserRepository;
import com.cos.greencinema.handler.ex.MyAsyncNotFoundException;
import com.cos.greencinema.util.MyAlgorithm;
import com.cos.greencinema.util.SHA;
import com.cos.greencinema.util.Script;
import com.cos.greencinema.web.dto.CMRespDto;
import com.cos.greencinema.web.dto.JoinReqDto;
import com.cos.greencinema.web.dto.LoginReqDto;
import com.cos.greencinema.web.dto.UserUpdateDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	// 생성자 주입 (DI)
	private final UserRepository userRepository;
	private final HttpSession session;
	
	//상진 영역
	
	// ==== 로그아웃 ====
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	
	// ==== 회원정보 ====
	@GetMapping("/user/{id}")
	public String userInfo(@PathVariable int id) {
		return "user/updateForm";
	}
	
	// ==== 회원수정 ====
		@PutMapping("/user/{id}")
		public @ResponseBody CMRespDto<?> update(@PathVariable int id,
				@Valid @RequestBody UserUpdateDto dto, BindingResult bindingResult				) {
			
			// 유효성
			if(bindingResult.hasErrors()) {
				Map<String, String> errorMap = new HashMap<>();
				for (FieldError error : bindingResult.getFieldErrors()) {
					errorMap.put(error.getField(), error.getDefaultMessage());
				}
				throw new MyAsyncNotFoundException(errorMap.toString());
			}
			
			// 인증
			User principal = (User) session.getAttribute("principal");
			if (principal == null) {
				throw new MyAsyncNotFoundException("로그인을 하세요.");
			}
			
			// 권한
			if (principal.getId() != id) {
				throw new MyAsyncNotFoundException("수정할 권한이 없습니다.");
			}
			
			
			principal.setEmail(dto.getEmail());
			principal.setTel(dto.getTel());
			session.setAttribute("principal", principal);
			
			userRepository.save(principal);
			
			return new CMRespDto<>(1, "성공", null);
		}
	
	//민수 영역
	
	//민환 영역
	
	//민홍 영역
	
	// 1. 회원 가입
	@PostMapping("/join")
	public @ResponseBody String Join(@Valid JoinReqDto dto, BindingResult bindingResult, Model model) {
		
		// 유효성
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
			}
			model.addAttribute("errorMap", errorMap);
			
			return Script.back(errorMap.toString());
			
		}
		
		
		System.out.println(dto.getUsername());
		String encpassword = SHA.encrypt(dto.getPassword(), MyAlgorithm.SHA256);
		dto.setPassword(encpassword);
		
		userRepository.save(dto.toEntity());
		return Script.href("test/user/loginForm");
	}
	
	// 2. 로그인
	@PostMapping("/login")
	 public @ResponseBody String Login(@Valid LoginReqDto dto, BindingResult bindingResult, Model model) {
		
		// 유효성
		if(bindingResult.hasErrors()) {
			Map<String, String> errorMap = new HashMap<>();
			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put(error.getField(), error.getDefaultMessage());
				
			}
			model.addAttribute("errorMap", errorMap);
			
			return Script.back("아이디 또는 비밀번호가 잘못 입력 되었습니다.");

		}
		
		
		
		User principal = userRepository.mLogin(dto.getUsername(), SHA.encrypt(dto.getPassword(), MyAlgorithm.SHA256));
		// 일반 회원 로그인
		if ( principal.getAdminNum() == 0 ) {
			System.out.println(principal.getAdminNum());
			
			session.setAttribute("principal", principal);
			return Script.href("/", "로그인 성공");
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