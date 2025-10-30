package com.example.usermgmt.controller;

import com.example.usermgmt.kafka.UserProducer;
import com.example.usermgmt.model.User;
import com.example.usermgmt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;
    private final UserProducer userProducer;

    @PostMapping
    public User createUser(@RequestBody User user) {
        User savedUser = userService.createUser(user);
        userProducer.sendMessage("User created: " + savedUser.getId());
        return savedUser;
    }

    @GetMapping
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    // TODO: Add PUT, DELETE endpoints for enterprise CRUD operations
}
