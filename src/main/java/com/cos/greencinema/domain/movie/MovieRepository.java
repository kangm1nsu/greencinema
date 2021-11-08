package com.cos.greencinema.domain.movie;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MovieRepository extends JpaRepository<Movie, Integer>{

	@Query(value = "select * from movie where movieTitle = :movieTitle", nativeQuery = true)
	int mFind(String movieTitle);
	
}
