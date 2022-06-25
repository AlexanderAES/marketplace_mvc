package com.alexandersu.marketplace.exception;

public class ProductNotFoundException extends RuntimeException {
    public ProductNotFoundException(Long id) {
    super(String.format("Объявления с таким id '%s' не найдено", id));
    }
}
