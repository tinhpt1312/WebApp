package com.poly.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.entity.Account;
import com.poly.entity.Cart;
import com.poly.entity.Product;
import com.poly.service.OrderService;
import com.poly.service.ParamService;
import com.poly.service.PriceFormatter;
import com.poly.service.ProductService;
import com.poly.service.SessionService;
//import com.poly.service.ShoppingCartService;

@Controller
public class CartController {

	
	@Autowired
	ParamService param;
	
	@Autowired
    ProductService productService;

    @Autowired
    SessionService session;
    
    @Autowired
    private OrderService orderService;
    
    @GetMapping("/cart")
    public String viewCart(Model model) {
    	Cart cart = session.get("cart");
        if (cart == null) {
            cart = new Cart();
            session.set("cart", cart);
        }
        for (Map.Entry<Product, Integer> entry : cart.getProducts().entrySet()) {
            Product product = entry.getKey();
            String formattedPrice = PriceFormatter.format(product.getPrice());
            product.setPriceFormatted(formattedPrice);
        }
        model.addAttribute("cart", cart);
        model.addAttribute("totalQuantity", cart.getTotalQuantity());
        model.addAttribute("formattedTotalPrice", cart.getFormattedTotalPrice());
        return "cart/cart";
    }
	
	
    @GetMapping("/cart/add/{id}")
    public String addToCart(@PathVariable Long id) {
        Cart cart = session.get("cart");
        if (cart == null) {
            cart = new Cart();
        }
        Product product = productService.getProductById(id);
  //      session.set("product", product);
        if (product != null) {
            cart.addProduct(product);
        }
        session.set("cart", cart);
        return "redirect:/product";
    }
    
    @PostMapping("/cart/update/{id}/{quantity}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> updateCart(@PathVariable Long id, @PathVariable int quantity) {
        Cart cart = (Cart) session.get("cart");
        if (cart == null) {
            cart = new Cart();
        }
        Product product = productService.getProductById(id);
        if (product != null) {
            cart.updateProductQuantity(product, quantity);
        }
        session.set("cart", cart);

        Map<String, Object> response = new HashMap<>();
        response.put("productTotal", product.getPrice() * quantity);
        response.put("cartTotal", cart.getTotalPrice());
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/cart/remove/{id}")
    public String removeFromCart(@PathVariable Long id) {
        Cart cart = session.get("cart");
        if (cart == null) {
            cart = new Cart();
        }
        Product product = productService.getProductById(id);
        if (product != null) {
            cart.removeProduct(product);
        }
        session.set("cart", cart);
        return "redirect:/cart";
    }
    
    @PostMapping("/cart/order")
    public ResponseEntity<String> placeOrder(@RequestParam String address) {
        Cart cart = (Cart) session.get("cart");
        if (cart == null || cart.getProducts().isEmpty()) {
            return ResponseEntity.badRequest().body("Cart is empty");
        }

        Account account = (Account) session.get("user");
        if (account == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
        }

        orderService.placeOrder(cart, account, address);
        session.remove("cart"); // Clear the cart after placing the order
        return ResponseEntity.ok("Order placed successfully");
    }
    
    @GetMapping("/checkout")
    public String checkout() {
        session.remove("cart");
        return "redirect:/cart";
    }
}
