package com.cos.greencinema.domain.Schedule;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer>{

	@Query(value = "select * from schedule where movieId = :movieId", nativeQuery = true)
	List<Schedule> movieFindAll(int movieId);
	
	@Query(value = "select distinct cinemaId from schedule where movieId = :movieId", nativeQuery = true)
	List<Integer> cinemaFindAll(int movieId);
	
	@Query(value = "select startingTime from schedule where movieId = :movieId and cinemaId = :cinemaId", nativeQuery = true)
	List<String> mTimeFindAll(int movieId, int cinemaId);
	
	@Query(value = "select * from schedule where movieId = :movieId and cinemaId = :cinemaId and startingYear = :startingYear and startingMonth = :startingMonth and  startingDate =:startingDate and startingTime = :startingTime", nativeQuery = true)
	Schedule mFindAll(int movieId, int cinemaId, String startingYear, String startingMonth, String startingDate, String startingTime);
	
	@Query(value = "select id from schedule where movieId = :movieId and cinemaId = :cinemaId and startingYear = :startingYear and startingMonth = :startingMonth and  startingDate =:startingDate and startingTime = :startingTime", nativeQuery = true)
	Integer mFindScheduleId(int movieId, int cinemaId, String startingYear, String startingMonth, String startingDate, String startingTime);
	
	@Query(value = "select distinct cinemaId from schedule where movieId = :movieId and startingTime = :startingTime", nativeQuery = true)
	int mFindCinemaId(int movieId, String startingTime);
}

