package com.group10.furniture_store.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.group10.furniture_store.domain.Cart;
import com.group10.furniture_store.domain.CartDetails;
import com.group10.furniture_store.domain.Order;
import com.group10.furniture_store.domain.OrderDetail;
import com.group10.furniture_store.domain.Role;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.domain.DTO.RegisterDTO;
import com.group10.furniture_store.repository.CartDetailsRepository;
import com.group10.furniture_store.repository.CartRepository;
import com.group10.furniture_store.repository.OrderDetailRepository;
import com.group10.furniture_store.repository.OrderRepository;
import com.group10.furniture_store.repository.ProductRepository;
import com.group10.furniture_store.repository.RoleRepository;
import com.group10.furniture_store.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final CartRepository cartRepository;
    private final CartDetailsRepository cartDetailsRepository;
    private final Random random = new Random();

    public UserService(UserRepository userRepository, RoleRepository roleRepository,
            ProductRepository productRepository, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository, CartRepository cartRepository,
            CartDetailsRepository cartDetailsRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.cartRepository = cartRepository;
        this.cartDetailsRepository = cartDetailsRepository;
    }

    public Page<User> getAllUsers(Pageable pageable) {
        return this.userRepository.findAll(pageable);
    }

    public User handleSaveUser(User x) {
        User tmp = this.userRepository.save(x);
        return tmp;
    }

    public User getUserById(Long id) {
        Optional<User> userOptional = this.userRepository.findById(id);
        User x = userOptional.isPresent() ? userOptional.get() : null;
        return x;
    }

    @Transactional
    public void deleteAnUser(Long id) {
        Optional<User> userOptional = this.userRepository.findById(id);
        if (userOptional.isEmpty()) {
            return;
        }
        
        User user = userOptional.get();
        
        List<Order> orders = this.orderRepository.findByUser(user);
        for (Order order : orders) {
            List<OrderDetail> orderDetails = order.getOrderDetails();
            if (orderDetails != null && !orderDetails.isEmpty()) {
                this.orderDetailRepository.deleteAll(orderDetails);
            }
        }
        
        if (!orders.isEmpty()) {
            this.orderRepository.deleteAll(orders);
        }
        
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetails> cartDetails = cart.getCartDetails();
            if (cartDetails != null && !cartDetails.isEmpty()) {
                this.cartDetailsRepository.deleteAll(cartDetails);
            }
            this.cartRepository.delete(cart);
        }
        
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User registerDTOToUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setAvatar("default-avatar.jpg");
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public long countUsers() {
        return this.userRepository.count();
    }

    public long countProducts() {
        return this.productRepository.count();
    }

    public long countOrders() {
        return this.orderRepository.count();
    }

    public String generateEmailOtp(User user) {
        String otp = String.format("%06d", random.nextInt(1_000_000));
        user.setEmailOtp(otp);
        user.setEmailOtpExpiry(LocalDateTime.now().plusMinutes(5));
        return otp;
    }

    public boolean verifyEmailOtp(String email, String otp) {
        User user = this.userRepository.findByEmail(email);
        if (user == null) {
            return false;
        }
        if (Boolean.TRUE.equals(user.getEmailVerified())) {
            // Đã xác minh rồi
            return true;
        }
        if (user.getEmailOtp() == null || user.getEmailOtpExpiry() == null) {
            return false;
        }
        if (user.getEmailOtpExpiry().isBefore(LocalDateTime.now())) {
            return false;
        }
        if (!otp.equals(user.getEmailOtp())) {
            return false;
        }
        user.setEmailVerified(true);
        user.setEmailOtp(null);
        user.setEmailOtpExpiry(null);
        this.userRepository.save(user);
        return true;
    }
}
