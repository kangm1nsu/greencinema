package com.cos.greencinema.domain.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Integer>{
	
	@Query(value = "insert into user (username, password, email, tel, birthDate) values (:username, :password, :email, :tel, :birthDate)", nativeQuery = true)
	void mSignup(String username, String password, String email, String tel, String birthDate);
	
	@Query(value = "select * from user where username = :username and password = :password", nativeQuery = true)
	User mLogin(String username, String password);
}
