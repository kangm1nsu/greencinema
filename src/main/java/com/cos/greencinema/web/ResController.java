package com.cos.greencinema.web;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
import com.cos.greencinema.domain.cinema.CinemaRepository;
import com.cos.greencinema.domain.location.Location;
import com.cos.greencinema.domain.location.LocationRepository;
import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.movie.MovieRepository;
import com.cos.greencinema.domain.region.Region;
import com.cos.greencinema.domain.region.RegionRepository;
import com.cos.greencinema.domain.reservation.Reservation;
import com.cos.greencinema.domain.reservation.ReservationRepository;
import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.handler.ex.MyAsyncNotFoundException;
import com.cos.greencinema.util.Script;
import com.cos.greencinema.web.dto.CMRespDto;
import com.cos.greencinema.web.dto.MovieReqDto;
import com.cos.greencinema.web.dto.RegionReqDto;
import com.cos.greencinema.web.dto.ReserveReqDto;
import com.cos.greencinema.web.dto.SelectedSeatReqDto;
import com.cos.greencinema.web.dto.TimeTableReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ResController {
	private final HttpSession session;
	private final ScheduleRepository scheduleRepository;
	private final CinemaRepository cinemaRepository;
	private final LocationRepository locationRepository;
	private final RegionRepository regionRepository;
	private final MovieRepository movieRepository;
	private final ReservationRepository reservationRepository;

	List<Reservation> reservationEntity = null; 
	@GetMapping("/res")
	public String Reserve(Model model) {
		model.addAttribute("reservationEntity", reservationEntity);
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
	public String getMovieList(Model model) {
		List<Movie> movieEntity = movieRepository.findAll();
		System.out.println(movieEntity);
		// System.out.println(movieEntity);
		model.addAttribute("movieEntity", movieEntity);
		return "res/movieList";
	}

	@PostMapping("/res")
	public @ResponseBody String postReserve(ReserveReqDto dto, Model model) {
		// ????????? ??????
		User principal = (User) session.getAttribute("principal");
		if ( principal == null ) {
			return Script.href("/loginForm", "???????????? ????????? ????????? ?????????");
		}
		
		int movieId = movieRepository.mFind(dto.getMovieName());
		int locationId = locationRepository.mFindLocationId(dto.getLocationName());
		int cinemaId = cinemaRepository.mFindCinemaIdByName(locationId, dto.getCinemaName());
		//Schedule schedule = scheduleRepository.mFindAll(movieId, cinemaId, dto.getStartingYear(), dto.getStartingMonth(), dto.getStartingDate(), dto.getStartingTime());
		Integer scheduleId = scheduleRepository.mFindScheduleId(movieId, cinemaId, dto.getStartingYear(), dto.getStartingMonth(), dto.getStartingDate(), dto.getStartingTime());
		if ( scheduleId == null ) {
			return Script.back("???????????? ?????? ?????????????????????.");
		}
			reservationEntity = reservationRepository.mFindAllScheduleById(scheduleId);
			model.addAttribute("reservationEntity", reservationEntity);
		return Script.href("/res");
	}

	@PostMapping("/reservation")
	public @ResponseBody String Reservation(@RequestBody SelectedSeatReqDto dto, User principal, Schedule schedule) {
		principal = (User) session.getAttribute("principal");
		// ????????? ??????
		if ( principal == null ) {
			return Script.href("/loginForm", "???????????? ????????? ????????? ?????????.");
		}
		
		// ?????? ?????? ??????
		if ( dto.getMovieName() == null) {
			return Script.href("/mlist", "????????? ????????? ???????????? ????????????.");
		}
		int movieId = movieRepository.mFind(dto.getMovieName());
		
		// ????????? ?????? ??????
		if ( dto.getLocationName() == null) {
			return Script.href("/mlist", "????????? ????????? ???????????? ????????????.");
		}		
		int locationId = locationRepository.mFindLocationId(dto.getLocationName());
		
		// ????????? ????????? ??????
		if ( dto.getCinemaName() == null) {
			return Script.href("/mlist", "????????? ???????????? ???????????? ????????????.");
		}
		int cinemaId = cinemaRepository.mFindCinemaIdByName(locationId, dto.getCinemaName());
		
		schedule = scheduleRepository.mFindAll(movieId, cinemaId, dto.getStartingYear(), dto.getStartingMonth(), dto.getStartingDate(), dto.getStartingTime());
		if (schedule == null) {
			return Script.href("/mlist", "???????????? ???????????? ????????????.");
		}
		String[] seats = dto.getSeat().split(",");
		for (int i = 0; i < seats.length; i++) {
			String seat = seats[i].trim();
			dto.setSeat(seat);
			reservationRepository.save(dto.toEntity(principal, schedule));
		}
		reservationEntity = null;
		return "res/movieList";
	}

	// ??????????????? : ???????????? ??????
	@PostMapping("/mlist/region/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody MovieReqDto dto) {		
		Movie movieEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("?????? ????????? ?????? ?????? ????????????."));
		System.out.println(dto.getMovieTitle());
		int movieId = ((MovieRepository) movieRepository).mFind(dto.getMovieTitle());
		// System.out.println(movieId);

		movieEntity.setId(movieId);
		movieEntity.setMovieTitle(dto.getMovieTitle());
		return new CMRespDto<>(1, "???????????? ??????", null);

	}

	// ajax : ?????? ?????? ??? ????????? ?????????
	@GetMapping("/mlist/region/{id}")
	public String getMovieList2(@PathVariable int id, Model model) {
		Movie mEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("?????? ????????? ?????? ?????? ????????????."));
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
		// ?????????????????? ??????????????? select
		List<Integer> regionId = new ArrayList<>();
		for (int i = 0; i < locationId.size(); i++) {
			int lid = locationId.get(i);
			int rid = locationRepository.mFindRegion(lid);
			regionId.add(rid);
		}
		// ?????? ??????
		Set<Integer> set = new HashSet<Integer>(regionId);
		List<Integer> rid = new ArrayList<>(set);
		// System.out.println(rid);

		// ?????????????????? ???????????? select
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

	// ajax : ???????????? ??????
	@PostMapping("/mlist/location/{id}")
	public @ResponseBody CMRespDto<String> region(@PathVariable int id, @RequestBody RegionReqDto dto) {
		int regionId = regionRepository.mFindRegionId(dto.getRegionName());
		Region regionEntity = regionRepository.findById(regionId)
				.orElseThrow(() -> new MyAsyncNotFoundException("?????? ????????? ?????? ?????? ????????????."));
		regionEntity.setId(regionId);

		return new CMRespDto<>(1, "???????????? ??????", null);
	}

	@GetMapping("/mlist/location/{id}")
	public String getMovieList3(@PathVariable int id, Model model) {
		Region regEntity = regionRepository.findById(id)
				.orElseThrow(() -> new MyAsyncNotFoundException("?????? ????????? ?????? ?????? ????????????."));
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
		return new CMRespDto<>(1, "???????????? ??????", dto.getMovLocId());
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
