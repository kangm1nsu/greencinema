package com.cos.greencinema.domain.movie;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface MovieRepository extends JpaRepository<Movie, Integer>{

	@Query(value = "select * from movie where movieTitle = :movieTitle", nativeQuery = true)
	int mFind(String movieTitle);
	
	@Query(value = "select * from movie where id = :id", nativeQuery = true)
	List<Movie> mFindById(int id);

}
