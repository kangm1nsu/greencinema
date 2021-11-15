package com.cos.greencinema.domain.movie;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import com.cos.greencinema.domain.comment.Comment;
import com.cos.greencinema.domain.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Movie {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(nullable = false, length = 50)
	private String movieTitle;
	private String rank;
	private String img;
	private String movieAge;
	private String movieOpenDate;
	private String movieRate;
	private String movieLike;
	@Lob
	private String content;
	
	@JoinColumn(name = "userId")
	@ManyToOne(fetch = FetchType.EAGER)
	private User user;
	
	@JsonIgnoreProperties({"movie"})
	@OneToMany(mappedBy = "movie", fetch = FetchType.LAZY)
	@OrderBy("id desc")
	private List<Comment> comments;
}
