package com.cos.greencinema.domain.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LocationRepository extends JpaRepository<Location, Integer>{

	@Query(value = "select distinct regionId from location where id = :id", nativeQuery = true)
	int mFindRegion(int id);
	
	@Query(value = "select distinct lName from location where regionId = :regionId", nativeQuery = true)
	List<String> mFindLocationName(int regionId);
}
