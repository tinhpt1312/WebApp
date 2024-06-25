package com.poly.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import org.springframework.core.io.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productRepository;

	@Autowired
	private CategoryDAO categoryRepository;

	public Product getProductById(Long id) {
		return productRepository.findById(id).orElse(null);
	}

	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	public Product saveProduct(Product product) {
		return productRepository.save(product);
	}

//	private final String uploadDir;

	@Autowired
	private ResourceLoader resourceLoader;

	public Optional<Product> getProductById1(Long id) {
		return productRepository.findById(id);
	}
	
	public void saveProduct1(Product product, MultipartFile imageFile) throws IOException {
		saveOrUpdateProduct(product, imageFile);
    }
	
	public void updateProduct(Long id, Product updatedProduct, MultipartFile imageFile) throws IOException {
        Optional<Product> optionalProduct = productRepository.findById(id);
        if (optionalProduct.isPresent()) {
            Product existingProduct = optionalProduct.get();
            existingProduct.setName(updatedProduct.getName());
            existingProduct.setPrice(updatedProduct.getPrice());
            existingProduct.setQuantity(updatedProduct.getQuantity());
            existingProduct.setCategory(updatedProduct.getCategory());
            saveOrUpdateProduct(existingProduct, imageFile);
        }
    }

    private void saveOrUpdateProduct(Product product, MultipartFile imageFile) throws IOException {
        if (!imageFile.isEmpty()) {
            String categoryDir = getCategoryDirectory(product.getCategory().getId());
            Resource resource = resourceLoader.getResource("classpath:/image/product/" + categoryDir);
            Path uploadPath = Paths.get(resource.getFile().getAbsolutePath());

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            byte[] bytes = imageFile.getBytes();
            Path path = Paths.get(uploadPath.toString(), imageFile.getOriginalFilename());
            Files.write(path, bytes);

            product.setImage(categoryDir + "/" + imageFile.getOriginalFilename());
        }
        productRepository.save(product);
    }
    
//	public void updateProduct(Long id, Product updatedProduct, MultipartFile imageFile) throws IOException {
//        Optional<Product> optionalProduct = productRepository.findById(id);
//        if (optionalProduct.isPresent()) {
//            Product existingProduct = optionalProduct.get();
//            String oldCategoryDir = getCategoryDirectory(existingProduct.getCategory().getId());
//            
//            existingProduct.setName(updatedProduct.getName());
//            existingProduct.setPrice(updatedProduct.getPrice());
//            existingProduct.setQuantity(updatedProduct.getQuantity());
//            existingProduct.setCategory(updatedProduct.getCategory());
//            
//            saveOrUpdateProduct(existingProduct, imageFile, !oldCategoryDir.equals(getCategoryDirectory(updatedProduct.getCategory().getId())));
//        }
//    }
//
//	public void saveOrUpdateProduct(Product product, MultipartFile imageFile, boolean categoryChanged) throws IOException {
//		if (categoryChanged && product.getImage() != null && !product.getImage().isEmpty()) {
//            // Move the existing image to the new category folder
//            moveImageToNewCategory(product);
//        }
//		if (!imageFile.isEmpty()) {
//			String categoryDir = getCategoryDirectory(product.getCategory().getId());
//			Resource resource = resourceLoader.getResource("/image/product/" + categoryDir);
//			Path uploadPath = Paths.get(resource.getFile().getAbsolutePath());
//			if (!Files.exists(uploadPath)) {
//				Files.createDirectories(uploadPath);
//			}
//			byte[] bytes = imageFile.getBytes();
//			Path path = Paths.get(uploadPath.toString(), imageFile.getOriginalFilename());
//			Files.write(path, bytes);
//
//			product.setImage(categoryDir + "/" + imageFile.getOriginalFilename());
//		}
//		productRepository.save(product);
//	}

	public List<Category> getAllCategories() {
		return categoryRepository.findAll();
	}

	private String getCategoryDirectory(String categoryId) {
		switch (categoryId) {
		case "ca01":
			return "mac";
		case "ca02":
			return "ipad";
		case "ca03":
			return "iphone";
		case "ca04":
			return "watch";
		default:
			return "others";
		}
	}
	
//	private void moveImageToNewCategory(Product product) throws IOException {
//        String oldCategoryDir = getCategoryDirectory(product.getCategory().getId());
//        String newCategoryDir = getCategoryDirectory(product.getCategory().getId());
//
//        Path oldPath = Paths.get(resourceLoader.getResource("/image/product/" + oldCategoryDir).getFile().getAbsolutePath(), product.getImage());
//        Path newPath = Paths.get(resourceLoader.getResource("/image/product/" + newCategoryDir).getFile().getAbsolutePath(), product.getImage());
//
//        if (!Files.exists(newPath.getParent())) {
//            Files.createDirectories(newPath.getParent());
//        }
//
//        Files.move(oldPath, newPath);
//        product.setImage(newCategoryDir + "/" + product.getImage());
//    }

	@Autowired
	private EntityManager entityManager;

	public Integer getNextId() {
		Query query = entityManager.createNativeQuery(
				"SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'DB_QLBH_Java5' AND TABLE_NAME = 'Products'");
		Object result = query.getSingleResult();
		return Integer.parseInt(result.toString());
	}

}
