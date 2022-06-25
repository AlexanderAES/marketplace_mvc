package com.alexandersu.marketplace.repository;

import com.alexandersu.marketplace.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository <Product,Long>{
    Page<Product> findByTitleContainingIgnoreCase(String title, Pageable pageable);
    Page<Product> findAll(Pageable pageable);

    Product getProductById(Long id);
}
