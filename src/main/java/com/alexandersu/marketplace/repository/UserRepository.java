package com.alexandersu.marketplace.repository;

import com.alexandersu.marketplace.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);

    User findUserByActivationCode(String code);

    User findByResetPasswordToken(String token);

}
