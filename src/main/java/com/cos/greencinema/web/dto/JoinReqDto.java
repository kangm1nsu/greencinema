package com.cos.greencinema.web.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.cos.greencinema.domain.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class JoinReqDto {
	@Size(min = 2, max = 20)
	@NotBlank // @NotNull + @NotEmpty
	private String username;
	
	@Size(min = 4, max = 20)
	@NotBlank
	private String password;
	
	@Size(min = 4, max = 50)
	@NotBlank
	private String email;
	
	@Size(min = 10, max = 50)
	@NotBlank
	private String tel;
	
	@Size(min = 8, max = 12)
	@NotBlank
	private String birthDate;
	
	public User toEntity() {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setTel(tel);
		user.setBirthDate(birthDate);
		user.setAdminNum(0);
		return user;
	}
}
