package com.cos.greencinema.domain.reservation;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReservationRepository extends JpaRepository<Reservation, Integer>{

	@Query(value = "select * from reservation where scheduleId = :scheduleId", nativeQuery = true)
	Reservation mFindAllById(int scheduleId);
	
	@Query(value = "select * from reservation where scheduleId = :scheduleId", nativeQuery = true)
	List<Reservation> mFindAllScheduleById(int scheduleId);
}
