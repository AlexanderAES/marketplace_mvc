package com.alexandersu.marketplace.exception;

public class UserNotFoundException extends  RuntimeException {
    public UserNotFoundException(Long id) {
        super(String.format("Пользователь с таким id: '%s' не найден", id));
    }
}
