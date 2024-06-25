package com.poly.entity;

import java.util.HashMap;
import java.util.Map;

import com.poly.service.PriceFormatter;

public class Cart {
    private Map<Product, Integer> products = new HashMap<>();

    public void addProduct(Product product) {
    	if (products.containsKey(product)) {
            products.put(product, products.get(product) + 1);
        } else {
            products.put(product, 1);
        }
    }
    
    public void updateProductQuantity(Product product, int quantity) {
        if (quantity <= 0) {
            products.remove(product);
        } else {
            products.put(product, quantity);
        }
    }
    
    public void removeProduct(Product product) {
        Integer currentQuantity = products.get(product);
        if (currentQuantity != null) {
            if (currentQuantity > 1) {
                products.put(product, currentQuantity - 1);
            } else {
                products.remove(product);
            }
        }
        products.remove(product);
    }
    
    public Map<Product, Integer> getProducts() {
        return products;
    }

    public int getTotalQuantity() {
        return products.values().stream().mapToInt(Integer::intValue).sum();
    }

    public Long getTotalPrice() {
        return products.entrySet().stream()
                .mapToLong(entry -> entry.getKey().getPrice() * entry.getValue())
                .sum();
    }

    public String getFormattedTotalPrice() {
        return PriceFormatter.format(getTotalPrice());
    }
}

