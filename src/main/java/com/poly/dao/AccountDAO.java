package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
	List<Account> findAllByFullnameLike(String fullname);
}
