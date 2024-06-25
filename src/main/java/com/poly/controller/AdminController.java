package com.poly.controller;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.AccountDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Account;
import com.poly.entity.Category;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.service.OrderService;
import com.poly.service.ProductService;
import com.poly.service.SessionService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.validation.Valid;

@Controller
@MultipartConfig
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	ProductDAO prDao;

	@Autowired
	OrderDAO orDao;

	@Autowired
	OrderDetailDAO ordDao;

	@Autowired
	AccountDAO accDao;

	@Autowired
	CategoryDAO caDao;

	@Autowired
	SessionService session;

	@Autowired
	OrderService orderService;

	@Autowired
	ProductService productService;

	@Autowired
	ServletContext app;

	@Autowired
	private ResourceLoader resourceLoader;

	@GetMapping("/index")
	public String doAdmin() {
		return "admin/admin";
	}

	@RequestMapping("/product")
	public String doAdminProduct(Model model, @RequestParam("keywords") Optional<String> kw) {
		String kwords = kw.orElse(session.get("keywords"));
		session.set("keywords", kwords);
		List<Product> products;
		if (kwords == null || kwords.trim().isEmpty()) {
			products = prDao.findAll();
		} else {
			products = prDao.findByKeywords("%" + kwords + "%");
		}
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		for (Product product : products) {
			String formattedPrice = decimalFormat.format(product.getPrice()).replace(",", ".") + " đ";
			product.setPriceFormatted(formattedPrice);
		}
		model.addAttribute("products", products);
		return "admin/product-list";
	}

//	@RequestMapping("/product/{id}")
//	public String adminProdcut(Model model, @PathVariable Long id) {
//		Optional<Product> optionalProduct = prDao.findById(id);
//		if (optionalProduct != null) {
//			model.addAttribute("product", optionalProduct);
//			return "admin/addProd";
//		} else {
//			return "admin/product-list";
//		}
//	}

	@GetMapping("/product/{id}")
	public String showUpdateForm(@PathVariable("id") Long id, Model model) {
		Optional<Product> product = productService.getProductById1(id);
		if (product.isPresent()) {
			model.addAttribute("product", product.get());
			model.addAttribute("categories", productService.getAllCategories());
			return "admin/addProd";
		} else {
			return "redirect:/admin/product";
		}
	}

	@PostMapping("/product/update/{id}")
	public String updateProduct(@PathVariable("id") Long id, @Valid @ModelAttribute("product") Product product,
			@RequestParam("imageFile") MultipartFile imageFile, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("categories", productService.getAllCategories());
			return "admin/addProd";
		}

		try {
			productService.updateProduct(id, product, imageFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/admin/product";
	}

//	@PostMapping("/product/update")
//	public String product_update(@Validated @ModelAttribute("product") Product product, Model model,
//			@RequestParam("category.id") String caId, BindingResult result,
//			@RequestParam("image") Optional<MultipartFile> file) {
//		if (!result.hasErrors()) {
//			if (!prDao.existsById(product.getId()))
//				model.addAttribute("error_product_update", true);
//			else {
//				if (file.isPresent() && !file.get().isEmpty()) {
//					String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
//					try {
//						String uploadDir = resourceLoader.getResource("classpath:/static/image/mac/").getFile()
//								.getAbsolutePath();
//						Path path = Paths.get(uploadDir + "/" + fileName);
//						Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
//						product.setImage(fileName);
//					} catch (IOException e) {
//						System.out.print(e);
//						return "redirect:/admin/product";
//					}
//				} else {
//					String currentPhoto = prDao.findById(product.getId()).map(Product::getImage)
//							.orElse(product.getImage());
//					product.setImage(currentPhoto);
//				}
//
//				product.setCategory(caDao.findById(caId).get());
//				product.setIsDelete(false);
//				prDao.save(product);
//				model.addAttribute("success_product_update", true);
//			}
//
//		}
//		return "redirect:/admin/product";
//	}

//	@GetMapping("/product/add")
//	public String add_product(Model model, @ModelAttribute("product") Product product) {
//		return "admin/addProduct";
//	}
//
//	@PostMapping("/product/add")
//	public String addProd(Model model, @ModelAttribute("product") Product product, BindingResult result,
//			@RequestParam("categoryId") String caId) {
//		if (!result.hasErrors()) {
//
//			product.setImage(null);
//			product.setCategory(caDao.findById(caId).get());
//			product.setIsDelete(false);
//
//			productService.saveProduct(product);
//
//			return "redirect:/admin/product";
//		} else {
//			return "admin/addProduct";
//		}
//	}

	@GetMapping("/product/add")
	public String showProductForm(Model model) {
		model.addAttribute("product", new Product());
		model.addAttribute("categories", productService.getAllCategories());
		return "admin/addProduct";
	}

	@PostMapping("/product/add")
	public String addProduct(@Validated @ModelAttribute("product") Product product,
			@RequestParam("imageFile") MultipartFile imageFile, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("categories", productService.getAllCategories());
			return "admin/addProduct";
		}
		try {
			productService.saveProduct1(product, imageFile);
			return "redirect:/admin/product";
		} catch (IOException e) {
			// Handle exception
			e.printStackTrace();
		}
		return "admin/addProduct";
	}

	@RequestMapping("/product/delete/{id}")
	public String removeProduct(Model model, @PathVariable Long id) {
		Product product = productService.getProductById(id);
		if (product != null) {
			prDao.delete(product);
			return "redirect:/admin/product";
		} else {
			return "redirect:/admin/product";
		}
	}

	@GetMapping("/nextId")
	public Integer getNextId() {
		return productService.getNextId();
	}

	@RequestMapping("/user/add")
	public String addAdminAccount(Model model, @RequestParam("image") Optional<MultipartFile> file,
			@Validated @ModelAttribute("account") Account acc, BindingResult result) {
		if (!result.hasErrors()) {
			if (!accDao.findById(acc.getUsername()).isEmpty()) {
				model.addAttribute("error_acc", "Id này đã tồn tại!");
			} else {
				if (file.isPresent() && !file.get().isEmpty()) {
					String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
					try {
						String uploadDir = resourceLoader.getResource("/image/user/").getFile().getAbsolutePath();
						Path path = Paths.get(uploadDir + "/" + fileName);
						Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
						acc.setPhoto(fileName);
					} catch (IOException e) {
						System.out.print(e);
						return "admin/userControl";
					}
					accDao.save(acc);
					model.addAttribute("success_acc", "Đăng kí thành công! hãy đăng nhập");
					return "redirect:/admin/user";
				}

			}
		}
		return "admin/userControl";

	}

	@RequestMapping("/order")
	public String doAdminOrder(Model model, @RequestParam("keywords") Optional<String> kw) {
		List<Order> orders = orDao.findAll();
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		for (Order order : orders) {
			String formattedPrice = decimalFormat.format(order.getTotal()).replace(",", ".") + " đ";
			order.setTotalFormatted(formattedPrice);
		}
		model.addAttribute("order", orders);
		return "admin/order-list";
	}

//	@GetMapping("/order/{id}")
//    public String getOrder(@PathVariable("id") Long orderId, Model model) {
//        List<OrderDetail> orderDetails = orderService.getOrderDetailsByOrderId(orderId);
//        model.addAttribute("orderDetails", orderDetails);
//        return "admin/orderDetails";
//    }

	@GetMapping("/order/{id}")
	public String getOrder(@PathVariable("id") Long orderId, Model model) {
		Order order = orderService.getOrderById(orderId);
		List<OrderDetail> orderDetails = orderService.getOrderDetailsByOrderId(orderId);
		model.addAttribute("order", order);
		model.addAttribute("orderDetails", orderDetails);
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		String formattedPrice = decimalFormat.format(order.getTotal()).replace(",", ".") + " đ";
		order.setTotalFormatted(formattedPrice);
		for (OrderDetail product : orderDetails) {
			String formattedPrice1 = decimalFormat.format(product.getPrice()).replace(",", ".") + " đ";
			product.setPriceFormatted(formattedPrice1);
		}
		return "admin/orderDetails";
	}

	@PostMapping("/order/updatePaymentStatus")
	public String updatePaymentStatus(@RequestParam("orderId") Long orderId,
			@RequestParam("trangThai") Boolean trangThai) {
		orderService.updatePaymentStatus(orderId, trangThai);
		return "redirect:/admin/order";
	}

//	@GetMapping("/order/{id}")
//	public String viewOrder(@PathVariable Long id, Model model) {
//		Order order = orderService.findOrderWithDetails(id);
//		model.addAttribute("order", order);
//		return "admin/orderDetails"; // Đây là tên trang JSP của bạn
//	}

	@RequestMapping("/user")
	public String adminAccount(Model model) {
		List<Account> acc = accDao.findAll();
		model.addAttribute("account", acc);
		return "admin/user-list";
	}

	@RequestMapping("/user/update")
	public String updateAdminAccount(Model model, @RequestParam("image") Optional<MultipartFile> file,
			@ModelAttribute("account") Account account, BindingResult result) {
		if (!result.hasErrors()) {
			if (file.isPresent() && !file.get().isEmpty()) {
				String fileName = StringUtils.cleanPath(file.get().getOriginalFilename());
				try {
//					Path path = Paths.get(app.getRealPath("classpath:/image/user" + fileName));
					String uploadDir = resourceLoader.getResource("/image/user/").getFile().getAbsolutePath();
					Path path = Paths.get(uploadDir + "/" + fileName);
					Files.copy(file.get().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
					account.setPhoto(fileName);
				} catch (IOException e) {
					System.out.print(e);
					return "admin/controlUser";
				}
			} else {
				String currentPhoto = accDao.findById(account.getUsername()).map(Account::getPhoto)
						.orElse(account.getPhoto());
				account.setPhoto(currentPhoto);
			}
			accDao.save(account);
		}
		return "redirect:/admin/user";

	}

	@RequestMapping("/user/{id}")
	public String findAdminAccount(Model model, @PathVariable String id) {
		Optional<Account> optionalAccount = accDao.findById(id);
		model.addAttribute("account", optionalAccount);
		return "admin/controlUser";
	}

	@ModelAttribute("productList")
	public List<Product> productList() {
		return prDao.findAll();
	}

	@ModelAttribute("categories")
	public List<Category> categories() {
		return caDao.findAll();
	}

	@ModelAttribute("accountList")
	public List<Account> accountList() {
		return accDao.findAll();
	}

	@ModelAttribute("orderList")
	public List<Order> orderList() {
		return orDao.findAll();
	}
}
