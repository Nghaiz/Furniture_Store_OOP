package com.group10.furniture_store.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group10.furniture_store.domain.Order;
import com.group10.furniture_store.domain.OrderDetail;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.repository.OrderDetailRepository;
import com.group10.furniture_store.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> fetchAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Optional<Order> getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrder(Order updateOrder) {
        Optional<Order> orderOptional = this.orderRepository.findById(updateOrder.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(updateOrder.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    @Transactional
    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = this.orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            // Xóa tất cả OrderDetails trước
            List<OrderDetail> orderDetails = order.getOrderDetails();
            if (orderDetails != null && !orderDetails.isEmpty()) {
                this.orderDetailRepository.deleteAll(orderDetails);
            }
            // Sau đó xóa Order
            this.orderRepository.deleteById(id);
        }
    }
}
