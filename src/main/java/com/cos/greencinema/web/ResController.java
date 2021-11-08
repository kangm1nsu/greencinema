package com.cos.greencinema.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cos.greencinema.domain.Schedule.Schedule;
import com.cos.greencinema.domain.Schedule.ScheduleRepository;
import com.cos.greencinema.domain.cinema.Cinema;
import com.cos.greencinema.domain.cinema.CinemaRepository;
import com.cos.greencinema.domain.location.Location;
import com.cos.greencinema.domain.location.LocationRepository;
import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.movie.MovieRepository;
import com.cos.greencinema.domain.region.Region;
import com.cos.greencinema.domain.region.RegionRepository;
import com.cos.greencinema.domain.reservation.ReservationRepository;
import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.handler.ex.MyAsyncNotFoundException;
import com.cos.greencinema.web.dto.CMRespDto;
import com.cos.greencinema.web.dto.MovieReqDto;
import com.cos.greencinema.web.dto.RegionReqDto;
import com.cos.greencinema.web.dto.ResReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ResController {
	private final HttpSession session;
	private final ReservationRepository resRepository;
	private final ScheduleRepository scheduleRepository;
	private final CinemaRepository cinemaRepository;
	private final LocationRepository locationRepository;
	private final RegionRepository regionRepository;
	private final MovieRepository movieRepository;

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

	@PostMapping("/saveResForm")
	public String saveResFrom1() {
		return "pay/saveResForm";
	}

	@GetMapping("/saveResForm")
	public String saveResFrom() {
		return "pay/saveResForm";
	}

	@GetMapping("/mlist")
	public String getMovieList(Model model) {
		List<Schedule> scheduleEntity = scheduleRepository.findAll();
		List<Movie> movieEntity = movieRepository.findAll();
		List<Location> locationEntity = locationRepository.findAll();
		List<Region> regionEntity = regionRepository.findAll();
		System.out.println(regionEntity);
		
		model.addAttribute("scheduleEntity", scheduleEntity);
		model.addAttribute("movieEntity", movieEntity);
		model.addAttribute("locationEntity", locationEntity);
		model.addAttribute("regionEntity", regionEntity);
		return "res/movieList";
	}

	@PostMapping("/res")
	public String postReserve() {
		return "res/reserve";
	}

	@PostMapping("/reservation")
	public String Reservation(ResReqDto dto, User principal) {

		principal = (User) session.getAttribute("principal");
		// resRepository.save(dto.toEntity(principal));
		return "pay/saverResForm";
	}
	
	// 비동기요청 : 영화제목 클릭
	@PostMapping("/mlist/region/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody MovieReqDto dto) {
		Movie movieEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 영화를 찾을 수가 없습니다."));
		int movieId = ((MovieRepository) movieRepository).mFind(dto.getMovieTitle());
		// System.out.println(movieId);

		movieEntity.setId(movieId);
		movieEntity.setMovieTitle(dto.getMovieTitle());
		return new CMRespDto<>(1, "업데이트 성공", null);

	}
	
	// ajax : 영화 선택 시 영화관 지역명
	@GetMapping("/mlist/region/{id}")
	public String getMovieList2(@PathVariable int id, Model model) {
		Movie mEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 영화를 찾을 수가 없습니다."));
		int movieId = mEntity.getId();

		List<Schedule> scheduleEntity = scheduleRepository.movieFindAll(movieId);
		List<Integer> cinemaId = scheduleRepository.cinemaFindAll(movieId);
		List<Integer> locationId = new ArrayList<>();
		for (int i = 0; i < cinemaId.size(); i++) {
			int cid = cinemaId.get(i);
			int lid = cinemaRepository.mFindLocation(cid);
			locationId.add(lid);
		}
		// System.out.println(locationId);
		// 위치아이디로 지역아이디 select
		List<Integer> regionId = new ArrayList<>();
		for (int i = 0; i < locationId.size(); i++) {
			int lid = locationId.get(i);
			int rid = locationRepository.mFindRegion(lid);
			regionId.add(rid);
		}
		// 중복 제거
		Set<Integer> set = new HashSet<Integer>(regionId);
		List<Integer> rid = new ArrayList<>(set);
		//System.out.println(rid);
		
		// 지역아이디로 지역이름 select
		List<String> rName = new ArrayList<>();
		for (int i = 0; i < rid.size(); i++) {
			int regId = rid.get(i);
			String region = regionRepository.mFindRegionName(regId);
			rName.add(region);
		}
		List<Region> regionEntity = regionRepository.findAll();
		System.out.println(regionEntity);
		List<Movie> movieEntity = movieRepository.findAll();
		model.addAttribute("movieEntity", movieEntity);
		model.addAttribute("rNameEntity", rName);
		model.addAttribute("regionEntity", regionEntity);
		model.addAttribute("scheduleEntity", scheduleEntity);

		return "res/movieList";
	}
	
	// ajax : 영화제목 클릭
	@PostMapping("/mlist/location/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody RegionReqDto dto) {
		int regionId = regionRepository.mFindRegionId(dto.getRName());
		Region regionEntity = regionRepository.findById(regionId).orElseThrow(
				() -> new MyAsyncNotFoundException("해당 지역을 찾을 수가 없습니다."));
		regionEntity.setId(regionId);
		
		return new CMRespDto<>(1, "업데이트 성공", null);

	}
	
	@GetMapping("/mlist/location/{id}")
	public String getMovieList3(@PathVariable int id, Model model) {
		Region rEntity = regionRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 영화를 찾을 수가 없습니다."));
		int regionId = rEntity.getId();
		List<String> locationName = locationRepository.mFindLocationName(regionId);
		System.out.println(locationName);
		return "res/movieList";
	}
}
