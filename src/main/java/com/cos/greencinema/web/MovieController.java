package com.cos.greencinema.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.greencinema.domain.comment.Comment;
import com.cos.greencinema.domain.comment.CommentRepository;
import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.movie.MovieRepository;
import com.cos.greencinema.domain.user.User;
import com.cos.greencinema.handler.ex.MyNotFoundException;
import com.cos.greencinema.web.dto.CommentSaveReqDto;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MovieController {
	private final MovieRepository movieRepository;
	private final HttpSession session;
	private final CommentRepository commentRepository;
	//상진 영역
	@PostMapping("/movie/detail/{id}")
	public String commentSave(@PathVariable int id, CommentSaveReqDto dto) {
		
		Comment comment = new Comment();
		
		User principal = (User) session.getAttribute("principal");
		Movie movieEntity = movieRepository.findById(id)
				.orElseThrow(() -> new MyNotFoundException("없는 영화 입니다.") );
		
		comment.setContent(dto.getContent());
		comment.setUser(principal);
		comment.setMovie(movieEntity);
		
		commentRepository.save(comment);
		return "redirect:/movie/detail/{id}";
	}
	
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
