package com.alexandersu.marketplace.exception;

public class CategoryNotFoundException extends RuntimeException{

    public CategoryNotFoundException(Long id) {
        super(String.format("Категория с id '%s' не найдена", id));
    }
}
