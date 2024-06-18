package com.poly.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.poly.entity.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long> {
//	@Query("SELECT o FROM Order o JOIN FETCH o.orderDetails od JOIN FETCH od.product WHERE o.id = :id")
//    Optional<Order> findByIdWithDetails(@Param("id") Long id);
//	
//	@EntityGraph(attributePaths = {"orderDetails", "orderDetails.product"})
//    Optional<Order> findById(Long id);
}
