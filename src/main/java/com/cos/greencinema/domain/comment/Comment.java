package com.cos.greencinema.domain.comment;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import com.cos.greencinema.domain.movie.Movie;
import com.cos.greencinema.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false)
	private String content;
	
	@JoinColumn(name = "userId")
	@ManyToOne
	private User user;
	
	@JoinColumn(name = "movieId")
	@ManyToOne
	@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
	private Movie movie;
	
	private LocalDateTime createdAt;

	@PrePersist // 디비에 INSERT 되기 직전에 실행
	public void createdAt() {
		this.createdAt = LocalDateTime.now();
	}
}
