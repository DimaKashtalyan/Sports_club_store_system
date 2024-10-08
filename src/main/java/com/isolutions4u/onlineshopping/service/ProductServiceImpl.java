package com.isolutions4u.onlineshopping.service;

import com.isolutions4u.onlineshopping.model.Product;
import com.isolutions4u.onlineshopping.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    @Autowired
    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    @Override
    public String saveProduct(Product product) {
        productRepository.saveAndFlush(product);
        return "Product Added Sucessfully";
    }

    @Override
    public List<Product> findAllProducts() {
        try {
            List<Product> products = new ArrayList<>();
            List<Product> productsCopy = new ArrayList<>();
            productRepository.findAll().forEach(products::add);
            productsCopy.addAll(products);
            for (Product p : products) {
                if (!p.isActive()) {
                    productsCopy.remove(p);
                }
            }
            return productsCopy;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public Product findProductById(Integer id) {
        Product product = productRepository.getOne(id);
        if (!product.isActive())
            product = null;

        return product;
    }

    @Override
    public String deleteProduct(Integer id) {

        Product product = productRepository.getOne(id);

        product.setActive(false);
        productRepository.saveAndFlush(product);

        return "Product Deleted Sucessfully";
    }

    @Override
    public String updateProduct(Product product) {
        productRepository.saveAndFlush(product);
        return "Product Updated Sucessfully";
    }

    @Override
    public List<Product> findProductByCategoryId(Integer categoryId) {
        List<Product> products = new ArrayList<>();
        List<Product> productsCopy = new ArrayList<>();
        productRepository.findProductByCategoryId(categoryId).forEach(products::add);
        productsCopy.addAll(products);
        for (Product p : products) {
            if (!p.isActive()) {
                productsCopy.remove(p);
            }
        }
        return productsCopy;
    }

    @Override
    public List<Product> findAllProductsForAdmin() {
        List<Product> products = new ArrayList<>();
        productRepository.findAll().forEach(products::add);
        return products;
    }

    @Override
    public Product findProductByIdForAdmin(int id) {
        Product product = productRepository.getOne(id);
        return product;
    }

    @Override
    public List<Product> getPopularProducts(int limit) {
        List<Product> popularProducts = productRepository.findMostViewedProducts(limit);
        System.out.println("Fetched Popular Products: " + popularProducts);
        return popularProducts;
    }

    @Override
    public List<Product> getBestSellingProducts(int limit) {
        List<Product> bestSellingProducts = productRepository.findBestSellingProducts(limit);
        System.out.println("Fetched Best Selling Products: " + bestSellingProducts);
        return bestSellingProducts;
    }

}
