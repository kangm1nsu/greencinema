package com.cos.greencinema.domain.location;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface LocationRepository extends JpaRepository<Location, Integer>{

	@Query(value = "select distinct regionId from location where id = :id", nativeQuery = true)
	int mFindRegion(int id);
	
	@Query(value = "select distinct locationName from location where regionId = :regionId", nativeQuery = true)
	List<String> mFindLocationName(int regionId);
	
	@Query(value = "select distinct * from location where regionId = :regionId", nativeQuery = true)
	List<Location> mFindLocation(int regionId);
	
	@Query(value = "select distinct id from location where locationName = :locationName", nativeQuery = true)
	int mFindLocationId(String locationName);
	
	@Query(value = "select distinct * from region where locationName = :locationName", nativeQuery = true)
	List<String> mFindLocation(String locationName);

}
