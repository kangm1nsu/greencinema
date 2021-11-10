package com.cos.greencinema.web.dto;

import com.cos.greencinema.domain.Schedule.Schedule;
import com.cos.greencinema.domain.reservation.Reservation;
import com.cos.greencinema.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SelectedSeatReqDto {
	private String movieName;
	private String  locationName;
	private String regionName;
	private String cinemaName;
	private String startingYear;
	private String startingMonth;
	private String startingDate;
	private String startingTime;
	private String seat;
	
	
	public Reservation toEntity(User principal, Schedule schedule) {
		Reservation reservation = new Reservation();
		reservation.setSeat(seat);
		reservation.setUser(principal);
		reservation.setSchedule(schedule);
		return reservation;
	}
}
