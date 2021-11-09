package com.cos.greencinema.domain.region;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RegionRepository extends JpaRepository<Region, Integer>{

	@Query(value = "select distinct regionName from region where Id = :id", nativeQuery = true)
	String mFindRegionName(int id);
	
	@Query(value = "select distinct id from region where regionName = :regionName", nativeQuery = true)
	int mFindRegionId(String regionName);
	
	@Query(value = "select distinct * from region where regionName = :regionName", nativeQuery = true)
	List<String> mFindRegion(String regionName);
}
