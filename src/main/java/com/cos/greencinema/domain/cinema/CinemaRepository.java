package com.cos.greencinema.domain.cinema;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CinemaRepository extends JpaRepository<Cinema, Integer>{
	
	@Query(value = "select distinct locationId from cinema where id = :id", nativeQuery = true)
	int mFindLocation(int id);
	
	@Query(value = "select distinct cinemaName from cinema where id = :id", nativeQuery = true)
	String mFindCinemaName(int id);
	
	@Query(value = "select distinct id from cinema where locationId = :locationId", nativeQuery = true)
	List<Integer> mFindCinemaIds(int locationId);
	
	@Query(value = "select distinct id from cinema where locationId = :locationId", nativeQuery = true)
	int mFindCinemaId(int locationId);
	
	@Query(value = "select distinct id from cinema where  cinemaName = :cinemaName and locationId = :locationId", nativeQuery = true)
	int mFindCinemaIdByName(int locationId, String cinemaName);

	
	
}
