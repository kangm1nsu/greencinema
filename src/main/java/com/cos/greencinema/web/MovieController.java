package com.cos.greencinema.web;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.movie.MovieRepository;
import com.cos.greencinema.handler.ex.MyNotFoundException;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MovieController {
	private final MovieRepository movieRepository;
	//상진 영역
	
	//민수 영역
	@GetMapping("/movie/list")
	public String movieList(Model model) {
		List<Movie> movieEntity = movieRepository.findAll();
		model.addAttribute("movieEntity",movieEntity);
		return "movie/list";
	}
	
	@GetMapping("/movie/detail/{id}")
	public String movieList(@PathVariable int id, Model model) {
		Movie movieEntity = movieRepository.findById(id).orElseThrow(
				() -> new MyNotFoundException(id + "를 찾지 못했습니다"));
		model.addAttribute("movieEntity",movieEntity);
		return "movie/detail";
	}
	
	
	//민환 영역
	
	//민홍 영역
	
}
