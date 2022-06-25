package com.alexandersu.marketplace.services;

import com.alexandersu.marketplace.exception.ProductNotFoundException;
import com.alexandersu.marketplace.models.Image;
import com.alexandersu.marketplace.models.Product;
import com.alexandersu.marketplace.models.User;
import com.alexandersu.marketplace.repository.ProductRepository;
import com.alexandersu.marketplace.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductService {

    private final ProductRepository productRepository;
    private final UserRepository userRepository;

    public Page<Product> listProducts(String title, Pageable pageable) {
        if (title != null)
            return productRepository.findByTitleContainingIgnoreCase(title,pageable); // findByTitle(title)
        return productRepository.findAll(pageable);
    }

    public void saveProducts(Principal principal, Product product, List<Image> imageFileList) {
        product.setUser(getUserByPrincipal(principal));
        for (Image image : imageFileList) {
            product.addImageToProduct(image);

            Product productFromDb = productRepository.save(product);
            productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
            image.setPreviewImage(true);
        }
        log.info("Saving new Product. Title: {}; Seller email: {}", product.getTitle(), product.getUser().getEmail());
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {

        return productRepository.findById(id).orElseThrow(()-> new ProductNotFoundException(id));
    }
}
