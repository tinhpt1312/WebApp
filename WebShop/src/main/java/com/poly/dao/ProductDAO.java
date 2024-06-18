package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.entity.Report;


public interface ProductDAO extends JpaRepository<Product, Long> {
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	List<Product> findByPrice(double minPrice, double maxPrice);
	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

	@Query(value = "SELECT * FROM Products o WHERE " + "o.id LIKE :keywords OR " + "o.name LIKE :keywords OR "
			+ "o.price LIKE :keywords OR " + "o.category_id LIKE :keywords", nativeQuery = true)
	List<Product> findByKeywords(@Param("keywords") String keywords);

	@Query("select new Report(o.category.name, sum(o.price), count(o)) from Product o group by o.category.name order by sum(o.price) desc")
	List<Report> getInventoryByCategory();

	@Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
    Page<Product> findByCategoryId(String categoryId, Pageable pageable);
	
	
}
