package com.group10.furniture_store.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;

@Configuration
@EnableAsync
public class AsyncConfig {
    // Cấu hình để cho phép xử lý bất đồng bộ (async) trong Spring
    // Các method được đánh dấu @Async sẽ chạy trên thread riêng
}
