package com.prm.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.prm.project.entity.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, String>{
	Booking findByAccountPhone(String phone);
}
