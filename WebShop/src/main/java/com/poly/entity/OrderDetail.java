package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.poly.service.PriceFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Orderdetails")
public class OrderDetail implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private Long price;
	private Integer quantity;
	
	@ManyToOne
	@JoinColumn(name = "product_id")
	Product product;
	
	@ManyToOne
	@JoinColumn(name = "order_id")
	Order order;
	
	@Transient
	private String totalFormatted;
	
	@Transient
	private String priceFormatted;
	
	@Transient
    private String totalFormatted1;

    public String getTotalFormatted1() {
        return PriceFormatter.format(price * quantity);
    }

}
