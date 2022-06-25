package com.alexandersu.marketplace.repository;


import com.alexandersu.marketplace.models.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<Image,Long> {

}
