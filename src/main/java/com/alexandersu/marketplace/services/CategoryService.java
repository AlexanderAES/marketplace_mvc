package com.alexandersu.marketplace.services;

import com.alexandersu.marketplace.exception.CategoryIsNotEmptyException;
import com.alexandersu.marketplace.exception.CategoryNotFoundException;
import com.alexandersu.marketplace.models.Category;
import com.alexandersu.marketplace.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public void saveCategory(Category category) { categoryRepository.save(category);}

    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Category getCategoryById(Long id) {
        return categoryRepository.findById(id).orElseThrow(() -> new CategoryNotFoundException(id));
    }

    public void deleteById(Long id) {
        if (!getCategoryById(id).getProducts().isEmpty())
            throw new CategoryIsNotEmptyException(id); // Категория не может быть удалена, если в ней есть объявления
        categoryRepository.deleteById(id);
    }
}
