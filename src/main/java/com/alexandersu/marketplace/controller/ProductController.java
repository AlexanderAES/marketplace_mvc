package com.alexandersu.marketplace.controller;

import com.alexandersu.marketplace.models.Category;
import com.alexandersu.marketplace.models.Image;
import com.alexandersu.marketplace.models.Product;
import com.alexandersu.marketplace.models.User;
import com.alexandersu.marketplace.services.CategoryService;
import com.alexandersu.marketplace.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final static Logger logger = LoggerFactory.getLogger(ProductController.class);
    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title,
                           Principal principal,
                           Model model,
                           @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC)
                                   Pageable pageable) {
        Page<Product> pages = productService.listProducts(title, pageable);
        model.addAttribute("url", "/");
        model.addAttribute("pageable", pages);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("categoryList", categoryService.getAllCategories());
        model.addAttribute("title", title);
        return "products";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("files") MultipartFile[] files,
                                Product product, Principal principal) throws IOException {
        List<Image> imageFileList = new ArrayList<>();
        for (MultipartFile file : files) {
            Image image = new Image();
            image.setName(file.getName());
            image.setOriginalFileName(file.getOriginalFilename());
            image.setContentType(file.getContentType());
            image.setSize(file.getSize());
            image.setBytes(file.getBytes());
            imageFileList.add(image);
        }
        productService.saveProducts(principal, product, imageFileList);
        logger.info("Save new products with name {} to database", product.getTitle());

        return "redirect:/my/products";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        logger.info("Delete product with id {}", id);
        return "redirect:/my/products";
    }


    @GetMapping("/product/edit/{id}")
    public String editProduct(@PathVariable ("id") Long id, Model model,Principal principal) {
        User currentUser = productService.getUserByPrincipal(principal);
        Product product = productService.getProductById(id);
        List<Category> categoryList = categoryService.getAllCategories();
        if (isEquals(currentUser,product)){
            model.addAttribute("user",currentUser);
            model.addAttribute("category", categoryList);
            model.addAttribute("product", product);
            return "product-edit";
        }
        return "redirect:/my/products";
    }

    @PostMapping("/product/edit/{id}")
    public String editProduct(@Valid @ModelAttribute Product product,Model model) {
            model.addAttribute("product", product);
            return "redirect:/my/products";
    }

    // проверка на принадлежность объявления/продукта текущему пользователю
    public static boolean isEquals(User currentUser,Product product){
        return currentUser.getEmail().equals(product.getUser().getEmail());
    }

    @GetMapping("/my/products")
    public String userProducts(Principal principal, Model model) {
        User user = productService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("products", user.getProducts());
        model.addAttribute("category", categoryService.getAllCategories());
        return "my-products";
    }
}
