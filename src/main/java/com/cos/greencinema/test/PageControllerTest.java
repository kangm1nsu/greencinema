package com.cos.greencinema.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.greencinema.web.dto.CMRespDto;


@Controller
public class PageControllerTest {

	//민수 영역-------------
	@GetMapping("test/layout/header")
	public String header() {
		return "layout/header";
	}
	
	
	@GetMapping("test/movie/detail")
	public String movieDetail() {
		return "movie/detail";
	}
	
	@GetMapping("test/movie/list")
	public String movielist() {
		return "movie/list";
	}
	@GetMapping("test/user/myRes")
	public String userMyRes() {
		return "user/myRes";
	}

	//상진 영역 ----------------
	
	// 영화 좋아요 누르기
	@PostMapping("/test/movie/list")
	public @ResponseBody CMRespDto<?> like() {

		return new CMRespDto<>(1, "성공", null);
	}
	
	
	
	// ==== 회원가입 페이지 이동 ====
	@GetMapping("test/user/joinForm")
	public String userjoinForm() {
		return "user/joinForm";
	}
	
	// ==== 로그인 페이지 이동 ====
	@GetMapping("test/user/loginForm")
	public String userloinForm() {
		return "user/loginForm";
	}
	
	// ==== 회원 정보 페이지 이동 ====
	@GetMapping("test/user/updateForm")
	public String userUpdateForm() {
		return "user/updateForm";
	}
	
	// ==== 메인 페이지 이동 ====
	@GetMapping("test/layout/main")
	public String main() {
	//	return "user/main";
	return "layout/main";
	}
	
	
	//민홍 영역 --------------
	@GetMapping("test/res/reserve")
	public String resReserve() {
		return "res/reserve";
	}
	
	@GetMapping("test/pay/pay")
	public String pay() {
		return "pay/pay";
	}
	@GetMapping("test/res/movieList")
	public String payMovieList() {
		return "res/movieList";
	}
	
	
	//민환 영역 ------------------
	@GetMapping("test/admin/addSchedule")
	public String adminJoinMovieForm() {
		return "admin/addSchedule";
	}
	@GetMapping("test/admin/updateSchedule")
	public String adminUpdateSchedule() {
		return "admin/updateSchedule";
	}
	@GetMapping("test/admin/movieManage")
	public String adminMovieManage() {
		return "admin/movieManage";
	}
	@GetMapping("test/admin/resManage")
	public String adminresManage() {
		return "admin/resManage";
	}
	@GetMapping("test/store/list")
	public String storeList() {
		return "store/list";
	}
	
}
