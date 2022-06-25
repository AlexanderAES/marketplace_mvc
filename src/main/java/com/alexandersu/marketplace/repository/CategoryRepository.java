package com.alexandersu.marketplace.repository;

import com.alexandersu.marketplace.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CategoryRepository extends JpaRepository<Category, Long> {

}
