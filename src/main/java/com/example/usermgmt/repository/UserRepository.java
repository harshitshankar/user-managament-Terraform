package com.example.usermgmt.repository;

import com.example.usermgmt.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    // TODO: You can add custom query methods here if needed.
}
