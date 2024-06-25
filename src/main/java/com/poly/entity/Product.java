package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.persistence.Transient;
import lombok.Data;

@Data
@Entity
@Table(name = "Products")
public class Product implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String image;
	private Long price;
	private Integer quantity;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(name = "CreateDate")
	private Date createDate = new Date();
	@Column(name = "is_delete")
	private Boolean isDelete = false;
	@ManyToOne
	@JoinColumn(name = "CategoryId")
	private Category category;
	@OneToMany(mappedBy = "product")
	private List<OrderDetail> orderDetails;

	@Transient
	private String priceFormatted;

	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		Product product = (Product) o;
		return Objects.equals(id, product.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


}
