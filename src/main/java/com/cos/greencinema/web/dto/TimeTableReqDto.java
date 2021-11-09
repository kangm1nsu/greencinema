package com.cos.greencinema.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TimeTableReqDto {
	private String movieTitle;
	private String regionName;
	private String locationName;
	private String movLocId;
}
