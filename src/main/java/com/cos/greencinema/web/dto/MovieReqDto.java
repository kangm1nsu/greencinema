package com.cos.greencinema.web.dto;

import com.cos.greencinema.domain.movie.Movie;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MovieReqDto {
	private String movieTitle;
	
	public Movie toEntity() {
		Movie movie = new Movie();
		movie.setMovieTitle(movieTitle);
		return movie;
	}
}
