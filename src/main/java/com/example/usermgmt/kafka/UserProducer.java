package com.example.usermgmt.kafka;

import lombok.RequiredArgsConstructor;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserProducer {
    private final KafkaTemplate<String, String> kafkaTemplate;
    private static final String TOPIC = "user-topic";

    public void sendMessage(String message) {
        kafkaTemplate.send(TOPIC, message);
    }

    // TODO: Change topic name if you want multiple topics or environment-specific topics
}
