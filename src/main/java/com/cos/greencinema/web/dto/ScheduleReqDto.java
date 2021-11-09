package com.cos.greencinema.web.dto;

import com.cos.greencinema.domain.Schedule.Schedule;
import com.cos.greencinema.domain.cinema.Cinema;
import com.cos.greencinema.domain.movie.Movie;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ScheduleReqDto {
	private String startingYear;
	private String startingMonth;
	private String startingDate;
	private String startingTime;
	
	public Schedule toEntity(Movie movie, Cinema cinema) {
		Schedule schedule = new Schedule();
		schedule.setMovie(movie);
		schedule.setCinema(cinema);
		schedule.setStartingYear(startingYear);
		schedule.setStartingMonth(startingMonth);
		schedule.setStartingDate(startingDate);
		schedule.setStartingTime(startingTime);
		return schedule;
	}
}
