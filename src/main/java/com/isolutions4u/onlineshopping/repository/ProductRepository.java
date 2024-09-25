package com.isolutions4u.onlineshopping.repository;

import com.isolutions4u.onlineshopping.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productRepository")
public interface ProductRepository extends JpaRepository<Product, Integer> {

    List<Product> findProductByCategoryId(Integer categoryId);

    @Query(value = "SELECT * FROM product ORDER BY views DESC LIMIT ?1", nativeQuery = true)
    List<Product> findMostViewedProducts(int limit);

    @Query(value = "SELECT * FROM product ORDER BY purchases DESC LIMIT ?1", nativeQuery = true)
    List<Product> findBestSellingProducts(int limit);
}
