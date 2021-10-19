package com.cos.greencinema.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


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
	@GetMapping("test/user/myres")
	public String userMyRes() {
		return "user/myRes";
	}
	
	//상진 영역 ----------------
	
	@GetMapping("test/user/joinForm")
	public String userjoinForm() {
		return "user/joinForm";
	}
	@GetMapping("test/user/loinForm")
	public String userloinForm() {
		return "user/loinForm";
	}
	@GetMapping("test/user/updateForm")
	public String userUpdateForm() {
		return "user/updateForm";
	}

	@GetMapping("test/layout/main")
	public String main() {
		return "user/main";
	}
	
	
	//민홍 영역 --------------
	@GetMapping("test/res/Reserve")
	public String resReserve() {
		return "res/Reserve";
	}
	
	@GetMapping("test/pay/pay")
	public String pay() {
		return "pay/pay";
	}
	
	
	//민환 영역 ------------------
	@GetMapping("test/admin/joinMovieForm")
	public String adminJoinMovieForm() {
		return "admin/joinMovieForm";
	}
	@GetMapping("test/admin/movieManage")
	public String adminMovieManage() {
		return "admin/movieManage";
	}
	@GetMapping("test/admin/resManage")
	public String adminresManage() {
		return "admin/resManage";
	}

	
}
