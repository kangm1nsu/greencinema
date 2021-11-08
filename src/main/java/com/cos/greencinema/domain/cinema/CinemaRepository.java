package com.cos.greencinema.domain.cinema;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CinemaRepository extends JpaRepository<Cinema, Integer>{
	
	@Query(value = "select distinct locationId from cinema where id = :id", nativeQuery = true)
	int mFindLocation(int id);
}
