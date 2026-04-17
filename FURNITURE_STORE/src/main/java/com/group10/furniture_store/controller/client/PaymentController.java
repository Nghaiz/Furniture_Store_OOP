package com.group10.furniture_store.controller.client;

import com.group10.furniture_store.domain.Cart;
import com.group10.furniture_store.domain.CartDetails;
import com.group10.furniture_store.domain.Order;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.domain.DTO.PaymentDTO;
import com.group10.furniture_store.repository.CartRepository;
import com.group10.furniture_store.service.ProductService;
import com.group10.furniture_store.service.UserService;
import com.group10.furniture_store.service.VNPayService;
import com.group10.furniture_store.service.WarehouseService;
import com.group10.furniture_store.service.sendEmail.SendEmailService;
import com.group10.furniture_store.utils.VNPayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/order")
public class PaymentController {

    @Autowired
    private VNPayUtils vnPayUtils;

    @Autowired
    private VNPayService vnPayService;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private WarehouseService warehouseService;

    @Autowired
    private SendEmailService sendEmailService;

    // Tạo đơn hàng COD
    @PostMapping("/create")
    public String createOrder(HttpServletRequest request, HttpSession session, Model model)
            throws UnsupportedEncodingException {
        try {
            String receiverName = request.getParameter("receiverName");
            String receiverAddress = request.getParameter("receiverAddress");
            String receiverPhone = request.getParameter("receiverPhone");
            String paymentMethod = "COD";

            Long userId = (Long) session.getAttribute("id");
            if (userId == null) {
                model.addAttribute("error", "Vui lòng đăng nhập để đặt hàng");
                return "redirect:/login";
            }

            User user = userService.getUserById(userId);
            if (user == null) {
                model.addAttribute("error", "Người dùng không tồn tại");
                return "redirect:/cart";
            }

            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                model.addAttribute("error", "Giỏ hàng trống");
                return "redirect:/cart";
            }
            Cart cart = cartRepository.findById(cartId).orElse(null);
            if (cart == null || cart.getCartDetails() == null || cart.getCartDetails().isEmpty()) {
                model.addAttribute("error", "Giỏ hàng trống");
                return "redirect:/cart";
            }

            double totalPrice = 0;
            for (CartDetails cd : cart.getCartDetails()) {
                totalPrice += cd.getPrice() * cd.getQuantity();
            }

            // Tạo đơn hàng và trừ kho
            String uuid = UUID.randomUUID().toString().replace("-", "");
            productService.handlePlaceOrder(user, session, receiverName, receiverAddress, receiverPhone, paymentMethod,
                    uuid, totalPrice);
            return "redirect:/thankyou";
        } catch (RuntimeException e) {
            // Xử lý lỗi ko đủ hàng
            model.addAttribute("error", e.getMessage());
            return "redirect:/order/checkout?error=" + java.net.URLEncoder.encode(e.getMessage(), "UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Có lỗi xảy ra khi đặt hàng: " + e.getMessage());
            return "redirect:/order/checkout";
        }
    }

    // Tạo đơn hàng và thanh toán VNPay
    @PostMapping("/create-vnpay")
    @ResponseBody
    public Map<String, Object> createOrderVNPay(HttpServletRequest request, HttpSession session) {
        Map<String, Object> response = new HashMap<>();

        try {
            String receiverName = request.getParameter("receiverName");
            String receiverAddress = request.getParameter("receiverAddress");
            String receiverPhone = request.getParameter("receiverPhone");

            Long cartId = (Long) session.getAttribute("cartId");
            if (cartId == null) {
                response.put("success", "false");
                response.put("message", "Giỏ hàng trống");
                return response;
            }

            Cart cart = this.cartRepository.findById(cartId).orElse(null);
            if (cart == null) {
                response.put("success", "false");
                response.put("message", "Giỏ hàng không tồn tại");
                return response;
            }
            List<CartDetails> cartDetails = cart.getCartDetails();
            if (cartDetails == null || cartDetails.isEmpty()) {
                response.put("success", "false");
                response.put("message", "Giỏ hàng trống");
                return response;
            }

            // Kiểm tra tồn kho trước khi tạo payment URL
            Map<Long, String> stockErrors = productService.validateStockAvailability(cartDetails);
            if (!stockErrors.isEmpty()) {
                List<Map<String, Object>> errorDetails = new ArrayList<>();
                for (CartDetails cd : cartDetails) {
                    if (cd != null && cd.getProduct() != null && stockErrors.containsKey(cd.getProduct().getId())) {
                        Map<String, Object> errorInfo = new java.util.HashMap<>();
                        errorInfo.put("productId", cd.getProduct().getId());
                        errorInfo.put("productName", cd.getProduct().getName());
                        errorInfo.put("requestedQuantity", cd.getQuantity());
                        Long availableStock = warehouseService.getStockQuantity(cd.getProduct().getId());
                        errorInfo.put("availableQuantity", availableStock != null ? availableStock : 0);
                        errorInfo.put("message",
                                "Sản phẩm " + cd.getProduct().getName() + " chỉ còn " + availableStock + " sản phẩm");
                        errorDetails.add(errorInfo);
                    }
                }

                response.put("success", "false");
                response.put("message", "Không đủ hàng: " + String.join(", ", stockErrors.values()));
                response.put("errorDetails", errorDetails);
                return response;
            }

            double totalPrice = 0;
            for (CartDetails cd : cartDetails) {
                totalPrice += cd.getPrice() * cd.getQuantity();
            }

            String uuid = UUID.randomUUID().toString().replace("-", "");
            Long orderId = System.currentTimeMillis();

            session.setAttribute("pendingOrder_receiverName", receiverName);
            session.setAttribute("pendingOrder_receiverAddress", receiverAddress);
            session.setAttribute("pendingOrder_receiverPhone", receiverPhone);
            session.setAttribute("pendingOrder_uuid", uuid);
            session.setAttribute("pendingOrder_totalPrice", totalPrice);
            session.setAttribute("pendingOrder_orderId", orderId);

            Long amount = (long) totalPrice;
            String orderInfo = "Thanh toan don hang " + orderId;

            PaymentDTO paymentDTO = new PaymentDTO(orderId, amount, orderInfo);
            String paymentUrl = vnPayService.createPaymentUrl(paymentDTO, request);

            response.put("success", "true");
            response.put("paymentUrl", paymentUrl);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", "false");
            response.put("message", e.getMessage());
        }

        return response;
    }

    // Callback từ VNPay
    @GetMapping("/vnpay-callback")
    public String vnpayCallback(HttpServletRequest request, Model model, HttpSession session) {
        Map<String, String> responseParams = new HashMap<>();
        Enumeration<String> parameterNames = request.getParameterNames();

        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String paramValue = request.getParameter(paramName);
            responseParams.put(paramName, paramValue);
        }

        // Xác minh response
        boolean isValid = vnPayUtils.verifyCallback(responseParams);

        if (!isValid) {
            model.addAttribute("message", "Xác thực giao dịch thất bại. Vui lòng liên hệ hỗ trợ.");
            return "client/order/failed";
        }

        if (isValid) {
            String vnpResponseCode = responseParams.get("vnp_ResponseCode");
            if ("00".equals(vnpResponseCode)) {
                // Thanh toán thành công
                try {
                    String orderId = responseParams.get("vnp_TxnRef");
                    String amount = responseParams.get("vnp_Amount");

                    String receiverName = (String) session.getAttribute("pendingOrder_receiverName");
                    String receiverAddress = (String) session.getAttribute("pendingOrder_receiverAddress");
                    String receiverPhone = (String) session.getAttribute("pendingOrder_receiverPhone");
                    String uuid = (String) session.getAttribute("pendingOrder_uuid");
                    Double totalPrice = (Double) session.getAttribute("pendingOrder_totalPrice");

                    Long userId = (Long) session.getAttribute("id");
                    if (userId == null) {
                        model.addAttribute("message", "Phiên đăng nhập hết hạn");
                        return "client/order/failed";
                    }

                    User user = userService.getUserById(userId);
                    productService.handlePlaceOrder(
                            user,
                            session,
                            receiverName,
                            receiverAddress,
                            receiverPhone,
                            "VNPAY",
                            uuid,
                            totalPrice);

                    session.removeAttribute("pendingOrder_receiverName");
                    session.removeAttribute("pendingOrder_receiverAddress");
                    session.removeAttribute("pendingOrder_receiverPhone");
                    session.removeAttribute("pendingOrder_uuid");
                    session.removeAttribute("pendingOrder_totalPrice");
                    session.removeAttribute("pendingOrder_orderId");

                    if (user != null && user.getEmail() != null) {
                        try {
                            sendEmailService.sendEmail(
                                    user.getEmail(),
                                    "Xác nhận đơn hàng",
                                    "Furniture Store chân thành cảm ơn bạn đã tin tưởng sử dụng sản phẩm của chúng tôi!");
                        } catch (Exception emailEx) {
                            emailEx.printStackTrace();
                        }
                    }

                    model.addAttribute("orderId", orderId);
                    model.addAttribute("amount", Long.parseLong(amount) / 100);
                    return "client/order/thankyou";
                } catch (RuntimeException ex) {
                    // Xử lý lỗi không đủ hàng
                    model.addAttribute("message", "Thanh toán thất bại: " + ex.getMessage() +
                            ". Số tiền sẽ được hoàn lại trong vòng 3-5 ngày làm việc");
                    return "client/order/failed";
                } catch (Exception ex) {
                    ex.printStackTrace();
                    model.addAttribute("message", "Có lỗi xảy ra khi xử lý đơn hàng: " + ex.getMessage());
                    return "client/order/failed";
                }
            } else {
                // Thanh toán thất bại - VNPay từ chối giao dịch
                // Lưu đơn hàng với trạng thái PAYMENT_FAILED
                try {
                    String receiverName = (String) session.getAttribute("pendingOrder_receiverName");
                    String receiverAddress = (String) session.getAttribute("pendingOrder_receiverAddress");
                    String receiverPhone = (String) session.getAttribute("pendingOrder_receiverPhone");
                    String uuid = (String) session.getAttribute("pendingOrder_uuid");
                    Double totalPrice = (Double) session.getAttribute("pendingOrder_totalPrice");
                    Long userId = (Long) session.getAttribute("id");

                    if (userId != null && receiverName != null) {
                        User user = userService.getUserById(userId);

                        // Tạo order với paymentStatus = PAYMENT_FAILED
                        Order failedOrder = new Order();
                        failedOrder.setUser(user);
                        failedOrder.setReceiverName(receiverName);
                        failedOrder.setReceiverAddress(receiverAddress);
                        failedOrder.setReceiverPhone(receiverPhone);
                        failedOrder.setStatus("Đã hủy"); // Đơn hàng bị hủy do thanh toán thất bại
                        failedOrder.setPaymentMethod("VNPAY");
                        failedOrder.setPaymentStatus("PAYMENT_FAILED"); // Thanh toán thất bại
                        failedOrder.setPaymentRef(uuid);
                        failedOrder.setTotalPrice(totalPrice);
                        // Không tạo OrderDetails và không trừ kho vì thanh toán thất bại
                    }

                    session.removeAttribute("pendingOrder_receiverName");
                    session.removeAttribute("pendingOrder_receiverAddress");
                    session.removeAttribute("pendingOrder_receiverPhone");
                    session.removeAttribute("pendingOrder_uuid");
                    session.removeAttribute("pendingOrder_totalPrice");
                    session.removeAttribute("pendingOrder_orderId");
                } catch (Exception e) {
                    e.printStackTrace();
                }

                model.addAttribute("message", "Thanh toán thất bại. Vui lòng thử lại.");
                return "client/order/failed";
            }
        } else {
            model.addAttribute("message", "Xác thực thanh toán thất bại");
            return "client/order/failed";
        }
    }

    @GetMapping("/success")
    public String paymentSuccess(String orderId, Model model) {
        model.addAttribute("orderId", orderId);
        return "client/order/thankyou";
    }
}