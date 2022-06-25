package com.alexandersu.marketplace.exception;

public class CategoryIsNotEmptyException extends RuntimeException {
    public CategoryIsNotEmptyException(Long id) {
        super(String.format("Некоторые товары или услуги связаны с данной категорией '%s'!", id));
    }
}
