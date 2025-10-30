package com.example.usermgmt.kafka;

import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.stereotype.Component;

@Component
public class UserConsumer {
    @KafkaListener(topics = "user-topic", groupId = "user-group")
    public void consume(String message) {
        System.out.println("Consumed message: " + message);
    }

    // TODO: Enhance logic to persist messages to DB or trigger other services
}
