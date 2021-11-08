package com.cos.greencinema.web.dto;

import com.cos.greencinema.domain.region.Region;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegionReqDto {
	private String rName;
	
	public Region toEntity() {
		Region region = new Region();
		region.setRName(rName);
		return region;
	}
}
