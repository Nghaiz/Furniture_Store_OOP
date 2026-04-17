package com.group10.furniture_store.controller.client;

import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.Objects;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.group10.furniture_store.domain.Cart;
import com.group10.furniture_store.domain.CartDetails;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.repository.CartRepository;
import com.group10.furniture_store.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }
}

@RestController
@RequiredArgsConstructor
public class CartAPI {
    private final ProductService productService;
    private final CartRepository cartRepository;

    @PostMapping(value = "/api/add-product-to-cart", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> addProductToCart(@RequestBody CartRequest cartRequest, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        Map<String, Object> response = new HashMap<>();

        if (email == null || email.trim().isEmpty()) {
            response.put("success", false);
            response.put("message", "Vui lòng đăng nhập để thêm sản phẩm vào giỏ hàng");
            return ResponseEntity.status(401).body(response);
        }

        try {
            // Validate
            if (cartRequest.getProductId() <= 0) {
                response.put("success", false);
                response.put("message", "ID sản phẩm không hợp lệ");
                return ResponseEntity.badRequest().body(response);
            }

            long quantity = cartRequest.getQuantity() <= 0 ? 1 : cartRequest.getQuantity();

            // Thêm sản phẩm
            this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session, quantity);

            // Lấy thông tin giỏ hàng
            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("success", false);
                response.put("message", "Giỏ hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy giỏ hàng");
                return ResponseEntity.badRequest().body(response);
            }

            
            List<CartDetails> cartDetails = cart.getCartDetails();
            int cartItemCount = cartDetails != null ? cartDetails.size() : 0;
            long totalQuantity = 0;
            double totalPrice = 0;

            if (cartDetails != null){
                for (CartDetails detail : cartDetails) {
                    totalQuantity += detail.getQuantity();
                    totalPrice += detail.getPrice() * detail.getQuantity();
                }
            }

            // Cập nhật session
            session.setAttribute("sum", cartItemCount);
            session.setAttribute("cartItemCount", cartItemCount);
            session.setAttribute("totalQuantity", totalQuantity);

            // Lưu DB
            cart.setSum((long) cartItemCount);
            this.cartRepository.save(cart);

            response.put("success", true);
            response.put("cartItemCount", cartItemCount);
            response.put("totalQuantity", totalQuantity);
            response.put("totalPrice", totalPrice);

            return ResponseEntity.ok(response);

        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + ex.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping(value = "/api/update-cart-quantity", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> updateCartQuantity(
            @RequestBody Map<String, Object> requestBody,
            HttpServletRequest request) {

        HttpSession session = request.getSession();
        Map<String, Object> response = new HashMap<>();

        try {
            if (!requestBody.containsKey("cartDetailId") || !requestBody.containsKey("quantity")) {
                response.put("success", false);
                response.put("message", "Thiếu tham số");
                return ResponseEntity.badRequest().body(response);
            }

            Long cartDetailId = Long.parseLong(requestBody.get("cartDetailId").toString());
            Long quantity = Long.parseLong(requestBody.get("quantity").toString());

            if (quantity < 1) {
                response.put("success", false);
                response.put("message", "Số lượng phải lớn hơn hoặc bằng 1");
                return ResponseEntity.badRequest().body(response);
            }

            CartDetails cartDetail = this.productService.getCartDetailById(cartDetailId);
            if (cartDetail != null && cartDetail.getProduct() != null) {
                long stockQuantity = cartDetail.getProduct().getStockQuantity();
                if (quantity > stockQuantity) {
                    response.put("success", false);
                    response.put("message", "Số lượng không được vượt quá " + stockQuantity + " sản phẩm");
                    response.put("maxStock", stockQuantity);
                    return ResponseEntity.badRequest().body(response);
                }
            }

            this.productService.updateCartDetailQuantity(cartDetailId, quantity, session);

            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("success", false);
                response.put("message", "Giỏ hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy giỏ hàng");
                return ResponseEntity.badRequest().body(response);
            }

            double totalPrice = 0;
            double subtotal = 0;
            long totalQuantity = 0;

            for (CartDetails cd : cart.getCartDetails()) {
                double cdTotal = cd.getPrice() * cd.getQuantity();
                totalPrice += cdTotal;
                totalQuantity += cd.getQuantity();

                if (cd.getId() == cartDetailId) {
                    subtotal = cdTotal;
                }
            }

            int cartItemCount = cart.getCartDetails().size();
            session.setAttribute("sum", cartItemCount);
            session.setAttribute("totalQuantity", totalQuantity);

            cart.setSum((long) cartItemCount);
            this.cartRepository.save(cart);

            response.put("success", true);
            response.put("subtotal", subtotal);
            response.put("totalPrice", totalPrice);
            response.put("cartItemCount", cartItemCount);
            response.put("totalQuantity", totalQuantity);

            return ResponseEntity.ok().body(response);

        } catch (NumberFormatException ex) {
            response.put("success", false);
            response.put("message", "Định dạng số không hợp lệ");
            return ResponseEntity.badRequest().body(response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + ex.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @GetMapping(value = "/api/cart/preview", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> getCartPreview(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return ResponseEntity.ok(buildPreviewResponse(Collections.emptyList(), 0, 0));
        }

        Object userIdAttr = session.getAttribute("id");
        if (!(userIdAttr instanceof Number)) {
            return ResponseEntity.ok(buildPreviewResponse(Collections.emptyList(), 0, 0));
        }

        long userId = ((Number) userIdAttr).longValue();
        User currentUser = new User();
        currentUser.setId(userId);

        Cart cart = this.productService.fetchCartByUser(currentUser);
        if (cart == null || cart.getCartDetails() == null) {
            return ResponseEntity.ok(buildPreviewResponse(Collections.emptyList(), 0, 0));
        }

        List<Map<String, Object>> previewItems = cart.getCartDetails().stream()
                .filter(Objects::nonNull)
                .sorted(Comparator.comparingLong(CartDetails::getId).reversed())
                .limit(5)
                .map(cartDetails -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("id", cartDetails.getId());
                    map.put("quantity", cartDetails.getQuantity());
                    map.put("price", cartDetails.getPrice());
                    if (cartDetails.getProduct() != null) {
                        map.put("productId", cartDetails.getProduct().getId());
                        map.put("name", cartDetails.getProduct().getName());
                        map.put("image", cartDetails.getProduct().getImage());
                    } else {
                        map.put("productId", null);
                        map.put("name", "Sản phẩm");
                        map.put("image", null);
                    }
                    return map;
                })
                .collect(Collectors.toList());

        int cartItemCount = cart.getCartDetails().size();
        
        long totalQuantity = cart.getCartDetails().stream()
                .filter(Objects::nonNull)
                .mapToLong(CartDetails::getQuantity)
                .sum();

        return ResponseEntity.ok(buildPreviewResponse(previewItems, cartItemCount, totalQuantity));
    }

    private Map<String, Object> buildPreviewResponse(List<Map<String, Object>> items, int cartItemCount, long totalQuantity) {
        Map<String, Object> payload = new HashMap<>();
        payload.put("items", items);
        payload.put("cartItemCount", Math.max(0, cartItemCount));
        payload.put("totalQuantity", Math.max(0, totalQuantity));
        return payload;
    }

    @PostMapping(value = "/api/cart/items", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> getCartItems(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Map<String, Object> response = new HashMap<>();

        if (session == null || session.getAttribute("email") == null) {
            response.put("items", Collections.emptyList());
            response.put("totalPrice", 0);
            response.put("cartItemCount", 0);
            return ResponseEntity.ok(response);
        }

        try {
            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("items", Collections.emptyList());
                response.put("totalPrice", 0);
                response.put("cartItemCount", 0);
                return ResponseEntity.ok(response);
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null || cart.getCartDetails() == null) {
                response.put("items", Collections.emptyList());
                response.put("totalPrice", 0);
                response.put("cartItemCount", 0);
                return ResponseEntity.ok(response);
            }

            List<Map<String, Object>> items = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .sorted(Comparator.comparingLong(CartDetails::getId).reversed())
                    .map(cd -> {
                        Map<String, Object> item = new HashMap<>();
                        item.put("id", cd.getId());
                        item.put("quantity", cd.getQuantity());
                        item.put("price", cd.getPrice());
                        if (cd.getProduct() != null) {
                            item.put("productId", cd.getProduct().getId());
                            item.put("productName", cd.getProduct().getName());
                            item.put("productImage", cd.getProduct().getImage());
                            item.put("stockQuantity", cd.getProduct().getStockQuantity());
                        } else {
                            item.put("productId", null);
                            item.put("productName", "Sản phẩm");
                            item.put("productImage", null);
                            item.put("stockQuantity", 999);
                        }
                        return item;
                    })
                    .collect(Collectors.toList());

            double totalPrice = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                    .sum();

            int cartItemCount = cart.getCartDetails().size();

            response.put("items", items);
            response.put("totalPrice", totalPrice);
            response.put("cartItemCount", cartItemCount);

            return ResponseEntity.ok(response);

        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("items", Collections.emptyList());
            response.put("totalPrice", 0);
            response.put("cartItemCount", 0);
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping(value = "/api/cart/update-quantity", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> updateQuantity(
            @RequestBody Map<String, Object> requestBody,
            HttpServletRequest request) {

        HttpSession session = request.getSession();
        Map<String, Object> response = new HashMap<>();

        try {
            if (!requestBody.containsKey("cartDetailId") || !requestBody.containsKey("change")) {
                response.put("success", false);
                response.put("message", "Thiếu tham số");
                return ResponseEntity.badRequest().body(response);
            }

            Long cartDetailId = Long.parseLong(requestBody.get("cartDetailId").toString());
            int change = Integer.parseInt(requestBody.get("change").toString());

            CartDetails cartDetail = this.productService.getCartDetailById(cartDetailId);
            if (cartDetail == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy sản phẩm trong giỏ hàng");
                return ResponseEntity.badRequest().body(response);
            }

            long newQuantity = cartDetail.getQuantity() + change;
            if (newQuantity < 1) {
                newQuantity = 1;
            }

            if (cartDetail.getProduct() != null) {
                long stockQuantity = cartDetail.getProduct().getStockQuantity();
                if (newQuantity > stockQuantity) {
                    response.put("success", false);
                    response.put("message", "Số lượng không được vượt quá " + stockQuantity + " sản phẩm");
                    return ResponseEntity.badRequest().body(response);
                }
            }

            this.productService.updateCartDetailQuantity(cartDetailId, newQuantity, session);

            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("success", false);
                response.put("message", "Giỏ hàng không tồn tại");
                return ResponseEntity.badRequest().body(response);
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null) {
                response.put("success", false);
                response.put("message", "Không tìm thấy giỏ hàng");
                return ResponseEntity.badRequest().body(response);
            }

            List<Map<String, Object>> items = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .sorted(Comparator.comparingLong(CartDetails::getId).reversed())
                    .map(cd -> {
                        Map<String, Object> item = new HashMap<>();
                        item.put("id", cd.getId());
                        item.put("quantity", cd.getQuantity());
                        item.put("price", cd.getPrice());
                        if (cd.getProduct() != null) {
                            item.put("productId", cd.getProduct().getId());
                            item.put("productName", cd.getProduct().getName());
                            item.put("productImage", cd.getProduct().getImage());
                            item.put("stockQuantity", cd.getProduct().getStockQuantity());
                        } else {
                            item.put("productId", null);
                            item.put("productName", "Sản phẩm");
                            item.put("productImage", null);
                            item.put("stockQuantity", 999);
                        }
                        return item;
                    })
                    .collect(Collectors.toList());

            double totalPrice = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                    .sum();

            int cartItemCount = cart.getCartDetails().size();

            session.setAttribute("sum", cartItemCount);
            session.setAttribute("cartItemCount", cartItemCount);

            cart.setSum((long) cartItemCount);
            this.cartRepository.save(cart);

            response.put("success", true);
            response.put("items", items);
            response.put("totalPrice", totalPrice);
            response.put("cartItemCount", cartItemCount);

            return ResponseEntity.ok(response);

        } catch (NumberFormatException ex) {
            response.put("success", false);
            response.put("message", "Định dạng số không hợp lệ");
            return ResponseEntity.badRequest().body(response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + ex.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping(value = "/api/cart/remove-item", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Map<String, Object>> removeItem(
            @RequestBody Map<String, Object> requestBody,
            HttpServletRequest request) {

        HttpSession session = request.getSession();
        Map<String, Object> response = new HashMap<>();

        try {
            if (!requestBody.containsKey("cartDetailId")) {
                response.put("success", false);
                response.put("message", "Thiếu tham số");
                return ResponseEntity.badRequest().body(response);
            }

            Long cartDetailId = Long.parseLong(requestBody.get("cartDetailId").toString());

            this.productService.deleteCartDetail(cartDetailId, session);

            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("items", Collections.emptyList());
                response.put("totalPrice", 0);
                response.put("cartItemCount", 0);
                response.put("success", true);
                return ResponseEntity.ok(response);
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null || cart.getCartDetails() == null) {
                response.put("items", Collections.emptyList());
                response.put("totalPrice", 0);
                response.put("cartItemCount", 0);
                response.put("success", true);
                return ResponseEntity.ok(response);
            }

            List<Map<String, Object>> items = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .sorted(Comparator.comparingLong(CartDetails::getId).reversed())
                    .map(cd -> {
                        Map<String, Object> item = new HashMap<>();
                        item.put("id", cd.getId());
                        item.put("quantity", cd.getQuantity());
                        item.put("price", cd.getPrice());
                        if (cd.getProduct() != null) {
                            item.put("productId", cd.getProduct().getId());
                            item.put("productName", cd.getProduct().getName());
                            item.put("productImage", cd.getProduct().getImage());
                            item.put("stockQuantity", cd.getProduct().getStockQuantity());
                        } else {
                            item.put("productId", null);
                            item.put("productName", "Sản phẩm");
                            item.put("productImage", null);
                            item.put("stockQuantity", 999);
                        }
                        return item;
                    })
                    .collect(Collectors.toList());

            double totalPrice = cart.getCartDetails().stream()
                    .filter(Objects::nonNull)
                    .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                    .sum();

            int cartItemCount = cart.getCartDetails().size();

            session.setAttribute("sum", cartItemCount);
            session.setAttribute("cartItemCount", cartItemCount);

            cart.setSum((long) cartItemCount);
            this.cartRepository.save(cart);

            response.put("success", true);
            response.put("items", items);
            response.put("totalPrice", totalPrice);
            response.put("cartItemCount", cartItemCount);

            return ResponseEntity.ok(response);

        } catch (NumberFormatException ex) {
            response.put("success", false);
            response.put("message", "Định dạng số không hợp lệ");
            return ResponseEntity.badRequest().body(response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("success", false);
            response.put("message", "Có lỗi xảy ra: " + ex.getMessage());
            return ResponseEntity.status(500).body(response);
        }
    }
}
