package com.cos.greencinema.domain.Schedule;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.cos.greencinema.domain.cinema.Cinema;
import com.cos.greencinema.domain.movie.Movie;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Schedule {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JoinColumn(name="movieId")
	@ManyToOne(fetch = FetchType.EAGER)
	private Movie movie;
	
	@JoinColumn(name="cinemaId")
	@ManyToOne(fetch = FetchType.EAGER)
	private Cinema cinema;
	
	private String startingYear;
	private String startingMonth;
	private String startingDate;
	private String startingTime;
}
