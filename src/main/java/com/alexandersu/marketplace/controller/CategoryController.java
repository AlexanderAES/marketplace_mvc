package com.alexandersu.marketplace.controller;


import com.alexandersu.marketplace.models.Category;
import com.alexandersu.marketplace.services.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/category")
//@PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
@Slf4j
public class CategoryController {
    private final static Logger logger = LoggerFactory.getLogger(CategoryController.class);
    private final CategoryService categoryService;

    @Autowired
    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/category")
    public String createCategory(Model model) {
        List<Category> categoryList = categoryService.getAllCategories();
        if (categoryList != null){
            model.addAttribute("categoryList",categoryList);
        }
        return "my-products";
    }

    @PostMapping("/create")
    public String createCategory(@Valid @ModelAttribute Category category, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            logger.warn("Binding result has error! " + bindingResult.getFieldError());
            return "admin";
        }
        categoryService.saveCategory(category);
        logger.info("Save new category with name {} to database", category.getCategoryName());
        return "redirect:/admin";
    }

    @PostMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id) {
        categoryService.deleteById(id);
        logger.info("Delete category with id {} from database", id);
        return "redirect:/admin";
    }
}
