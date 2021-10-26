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
	@GetMapping("test/user/loginForm")
	public String userloinForm() {
		return "user/loginForm";
	}
	@GetMapping("test/user/updateForm")
	public String userUpdateForm() {
		return "user/updateForm";
	}

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
