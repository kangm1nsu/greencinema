package com.cos.greencinema.web;

import java.util.ArrayList;
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
import com.cos.greencinema.web.dto.ReserveReqDto;
import com.cos.greencinema.web.dto.TimeTableReqDto;

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
	private final ReservationRepository reservationRepository;

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
		List<Movie> movieEntity = movieRepository.findAll();
		// System.out.println(movieEntity);
		model.addAttribute("movieEntity", movieEntity);
		return "res/movieList";
	}

	@PostMapping("/res")
	public String postReserve() {
		
		return "res/reserve";
	}

	@PostMapping("/reservation")
	public @ResponseBody String Reservation(@RequestBody ReserveReqDto dto, User principal, Schedule schedule) {
		principal = (User) session.getAttribute("principal");
		System.out.println(principal);
		int movieId = movieRepository.mFind(dto.getMovieName());
		int locationId = locationRepository.mFindLocationId(dto.getLocationName());
		System.out.println(dto.getCinemaName());
		int cinemaId = cinemaRepository.mFindCinemaIdByName(locationId, dto.getCinemaName());
		// movie = (Movie) movieRepository.mFindById(movieId);
		schedule = scheduleRepository.mFindAll(movieId, cinemaId, dto.getStartingYear(), dto.getStartingMonth(), dto.getStartingDate(), dto.getStartingYear());
		System.out.println(schedule);
		String[] seats = dto.getSeat().split(",");
		for (int i = 0; i < seats.length; i++) {
			String seat = seats[i].trim();
			dto.setSeat(seat);
			reservationRepository.save(dto.toEntity(principal, schedule));
		}
		return "res/movieList";
	}

	// 비동기요청 : 영화제목 클릭
	@PostMapping("/mlist/region/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody MovieReqDto dto) {
		Movie movieEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 영화를 찾을 수가 없습니다."));
		System.out.println(dto.getMovieTitle());
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
		// System.out.println(rid);

		// 지역아이디로 지역이름 select
		List<String> regionName = new ArrayList<>();
		for (int i = 0; i < rid.size(); i++) {
			int regId = rid.get(i);
			String region = regionRepository.mFindRegionName(regId);
			regionName.add(region);
		}
		List<Region> regionEntity = regionRepository.findAll();
		System.out.println(regionEntity);
		List<Movie> movieEntity = movieRepository.findAll();
		model.addAttribute("movieEntity", movieEntity);
		model.addAttribute("regionNameEntity", regionName);
		model.addAttribute("regionEntity", regionEntity);
		model.addAttribute("scheduleEntity", scheduleEntity);

		return "res/movieList";
	}

	// ajax : 영화제목 클릭
	@PostMapping("/mlist/location/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody RegionReqDto dto) {
		int regionId = regionRepository.mFindRegionId(dto.getRegionName());
		Region regionEntity = regionRepository.findById(regionId)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 지역을 찾을 수가 없습니다."));
		regionEntity.setId(regionId);

		return new CMRespDto<>(1, "업데이트 성공", null);
	}

	@GetMapping("/mlist/location/{id}")
	public String getMovieList3(@PathVariable int id, Model model) {
		Region regEntity = regionRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("해당 영화를 찾을 수가 없습니다."));
		int regionId = regEntity.getId();
		List<Location> locationEntity = locationRepository.mFindLocation(regionId);
		List<Movie> movieEntity = movieRepository.findAll();
		List<Region> regionEntity = regionRepository.findAll();
		System.out.println(locationEntity);
		model.addAttribute("locationEntity", locationEntity);
		model.addAttribute("movieEntity", movieEntity);
		model.addAttribute("regionEntity", regionEntity);
		return "res/movieList";
	}

	@PostMapping("/mlist/schedule/{id}")
	public @ResponseBody CMRespDto<String> schedule(@PathVariable int id, @RequestBody TimeTableReqDto dto) {
		int movieId = movieRepository.mFind(dto.getMovieTitle());
		int locationId = locationRepository.mFindLocationId(dto.getLocationName());
		String movLocId = Integer.toString(movieId) + "-"+ Integer.toString(locationId);
		dto.setMovLocId(movLocId);
		return new CMRespDto<>(1, "업데이트 성공", dto.getMovLocId());
	}


	 @GetMapping("/mlist/schedule/{mid}/{lid}") public String getMovieList4(@PathVariable int mid, @PathVariable int lid, Model model) { 
		List<Integer> cinemaEntity = cinemaRepository.mFindCinemaIds(lid);
		List<String> timeTable = new ArrayList<>();
		List<String> timeEntity = new ArrayList<>();
		for (int i = 0; i < cinemaEntity.size(); i++) {
			int cinemaId = cinemaEntity.get(i);
			String cinemaName = cinemaRepository.mFindCinemaName(cinemaId);
			timeTable = scheduleRepository.mTimeFindAll(mid, cinemaId);
			for (int j=0; j< timeTable.size(); j++) {
				String time = timeTable.get(j);
				timeEntity.add(cinemaName + " " + time);
			}
			
		}
		System.out.println(timeEntity);
		int regionId = locationRepository.mFindRegion(lid);
		List<Movie> movieEntity = movieRepository.findAll();
		List<Region> regionEntity = regionRepository.findAll();
		List<Location> locationEntity = locationRepository.mFindLocation(regionId);
		model.addAttribute("movieEntity", movieEntity);
		model.addAttribute("locationEntity", locationEntity);
		model.addAttribute("regionEntity", regionEntity);
		model.addAttribute("timeEntity", timeEntity);
		return "res/movieList";
	 }

}
