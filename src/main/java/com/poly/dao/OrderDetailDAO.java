package com.poly.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {

	List<OrderDetail> findByOrderId(Long orderId);
//
//	@Query("Select o FROM PRODUCT o where id ?1")
//	Product findByProdId(Long id);

//	@Query("SELECT ord FROM OrderDetails ord JOIN ord.product prod WHERE ord.order.id = :orderId")
//	List<OrderDetail> findOrderDetailsByOrderId(@Param("orderId") Long orderId);

//	@Query(value = "SELECT ord.id as orderDetailId, prod.id as productId, prod.name as productName, ord.quantity as quantity, prod.price as price, prod.image as image "
//			+ "FROM OrderDetails ord " + "JOIN Products prod ON ord.product_id = prod.id "
//			+ "WHERE ord.order_id = :orderId", nativeQuery = true)
//	List<OrderDetailsProductDTO> findOrderDetailsByOrderId(@Param("orderId") Long orderId);

//	@Query("select new com.poly.dto.OrderDetailDTO(o.id, o.product.name, o.product.img, o.product.price, o.quantity, o.total, o.order.province, o.order.district, o.order.ward) from OrderDetail o where o.order.id = :idorder")
//    List<OrderDetailDTO> findByOrderDetailIdOrder(@Param("idorder") Long idOrder);
}
