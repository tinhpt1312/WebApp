package com.poly.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Category;

public interface CategoryDAO extends JpaRepository<Category, String> {
	@Query("SELECT c FROM Category c WHERE c.id = :categoryId")
    Page<Category> findByCategoryId(String categoryId, Pageable pageable);
}
