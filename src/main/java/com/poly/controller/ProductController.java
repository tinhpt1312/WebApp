package com.poly.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.microsoft.sqlserver.jdbc.StringUtils;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.ProductService;
import com.poly.service.SessionService;


@Controller
public class ProductController {

	@Autowired
	CategoryDAO caDao;

	@Autowired
	ProductDAO prDao;

	@Autowired
	ProductService productService;
	
	@Autowired
	SessionService session;

	@GetMapping("/product")
	public String doProduct(Model model, @RequestParam("p") Optional<Integer> p,
			@RequestParam(value = "category", required = false) String categoryId,
			@RequestParam(value = "direction", required = false, defaultValue = "") String direction) {
		List<Category> caItems = caDao.findAll();
		model.addAttribute("caItems", caItems);

		Direction sortDirection = "desc".equalsIgnoreCase(direction) ? Direction.DESC : Direction.ASC;

		Pageable pageable = PageRequest.of(p.orElse(0), 9, Sort.by(sortDirection, "price"));
		Page<Product> page;

		String categoryIdAsLong = null;
		if (!StringUtils.isEmpty(categoryId)) {
			Optional<Category> categoryOptional = caDao.findById(categoryId);
			if (categoryOptional.isPresent()) {
				Category category = categoryOptional.get();
				categoryIdAsLong = category.getId();
			}
		}
		

		if (categoryIdAsLong != null) {
			page = prDao.findByCategoryId(categoryIdAsLong, pageable);
		} else {
			page = prDao.findAll(pageable);
		}
		model.addAttribute("page", page);
		model.addAttribute("categoryId", categoryId);
		model.addAttribute("direction", direction); // Truyền hướng sắp xếp vào view

		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		for (Product product : page) {
			String formattedPrice = decimalFormat.format(product.getPrice()).replace(",", ".") + " đ";
			product.setPriceFormatted(formattedPrice);
		}

		return "product/product";
	}

	@GetMapping("/product/{id}")
	public String getProductDetail(@PathVariable("id") Long id, Model model) {
		Product product = productService.getProductById(id);
		if (product != null) {
			DecimalFormat decimalFormat = new DecimalFormat("#,###");
			String formattedPrice = decimalFormat.format(product.getPrice()).replace(",", ".") + " đ";
			product.setPriceFormatted(formattedPrice);
			model.addAttribute("product", product);
			return "product/product-detail";
		} else {
			return "redirect:/product";
		}
	}
}
