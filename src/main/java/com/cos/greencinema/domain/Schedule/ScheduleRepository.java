package com.cos.greencinema.domain.Schedule;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer>{

	@Query(value = "select * from schedule where movieId = :movieId", nativeQuery = true)
	List<Schedule> movieFindAll(int movieId);
	
	@Query(value = "select distinct cinemaId from schedule where movieId = :movieId", nativeQuery = true)
	List<Integer> cinemaFindAll(int movieId);
}

