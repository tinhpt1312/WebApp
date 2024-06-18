package com.poly.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Account;
import com.poly.entity.Cart;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderRepository;

	@Autowired
	private OrderDetailDAO orderDetailRepository;

	@Autowired
	private ProductDAO productRepository;

	public void placeOrder(Cart cart, Account account, String address) {
		// Create and save the order
		Order order = new Order();
		order.setAccount(account);
		order.setAddress(address);
		order.setCreateDate(new Date());
		order.setTotal(cart.getTotalPrice());
		order.setTrang_thai(false);
		order = orderRepository.save(order);

		// Create and save order details
		for (Map.Entry<Product, Integer> entry : cart.getProducts().entrySet()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setProduct(entry.getKey());
			orderDetail.setQuantity(entry.getValue());
			orderDetail.setPrice(entry.getKey().getPrice());
			orderDetailRepository.save(orderDetail);
		}
	}

	public Order getOrderById(Long id) {
		return orderRepository.findById(id).orElse(null);
	}

	public List<Order> getAllProducts() {
		return orderRepository.findAll();
	}

//	public Order findOrderWithDetails(Long orderId) {
//        return orderRepository.findByIdWithDetails(orderId).orElseThrow(() -> new RuntimeException("Order not found"));
//    }

	public List<OrderDetail> getOrderDetailsByOrderId(Long orderId) {
		return orderDetailRepository.findByOrderId(orderId);
	}
	
	public void updatePaymentStatus(Long orderId, Boolean trangThai) {
        Optional<Order> optionalOrder = orderRepository.findById(orderId);
        if (optionalOrder.isPresent()) {
            Order order = optionalOrder.get();
            order.setTrang_thai(trangThai);
            orderRepository.save(order);
        }
    }

}
