package com.cos.greencinema.web.dto;

import java.time.LocalDateTime;

import com.cos.greencinema.domain.Schedule.Schedule;
import com.cos.greencinema.domain.reservation.Reservation;
import com.cos.greencinema.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResReqDto {
	private String seat;
	private LocalDateTime createdAt;
	
	public Reservation toEntity(User principal, Schedule schedule) {
		Reservation reservation = new Reservation();
		reservation.setSeat(seat);
		reservation.setCreatedAt(createdAt);
		reservation.setUser(principal);
		reservation.setSchedule(schedule);
		return reservation;
	}
}
