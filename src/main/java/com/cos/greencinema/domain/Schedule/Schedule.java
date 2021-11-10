package com.cos.greencinema.domain.Schedule;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

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
	
	@Column(nullable = false, length = 50)
	private String startingYear;
	@Column(nullable = false, length = 50)
	private String startingMonth;
	@Column(nullable = false, length = 50)
	private String startingDate;
	@Column(nullable = false, length = 50)
	private String startingTime;
	private LocalDateTime createdAt;

	@PrePersist // 디비에 INSERT 되기 직전에 실행
	public void createdAt() {
		this.createdAt = LocalDateTime.now();
	}
}
