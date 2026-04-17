package com.group10.furniture_store.controller.client;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.group10.furniture_store.domain.Order;
import com.group10.furniture_store.domain.PasswordResetToken;
import com.group10.furniture_store.domain.Product;
import com.group10.furniture_store.domain.User;
import com.group10.furniture_store.domain.DTO.ChangePasswordDTO;
import com.group10.furniture_store.domain.DTO.ForgotPasswordDTO;
import com.group10.furniture_store.domain.DTO.RegisterDTO;
import com.group10.furniture_store.domain.DTO.ResetPasswordDTO;
import com.group10.furniture_store.service.OrderService;
import com.group10.furniture_store.service.ProductService;
import com.group10.furniture_store.service.TokenService;
import com.group10.furniture_store.service.UploadService;
import com.group10.furniture_store.service.UserService;
import com.group10.furniture_store.service.sendEmail.SendEmailService;

import org.springframework.web.util.UriUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomePageController {
    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;
    private final PasswordEncoder passwordEncoder;
    private final SendEmailService sendEmailService;
    private final TokenService tokenService;
    private final UploadService uploadService;

    public HomePageController(ProductService productService, UserService userService, OrderService orderService,
            PasswordEncoder passwordEncoder, SendEmailService sendEmailService,
            TokenService tokenService, UploadService uploadService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
        this.passwordEncoder = passwordEncoder;
        this.sendEmailService = sendEmailService;
        this.tokenService = tokenService;
        this.uploadService = uploadService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        Pageable pageable = PageRequest.of(0, 10);
        Page<Product> products = this.productService.getAllProducts(pageable);
        model.addAttribute("products", products.getContent());
        return "client/homepage/show-tailwind";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult result,
            Model model) {

        List<FieldError> errors = result.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("Field: " + error.getField() + " - Message: " + error.getDefaultMessage());
        }

        if (result.hasErrors()) {
            for (FieldError error : errors) {
                model.addAttribute(
                        "error" + error.getField().substring(0, 1).toUpperCase() + error.getField().substring(1),
                        error.getDefaultMessage());
            }
            model.addAttribute("registerUser", registerDTO);
            return "client/auth/register";
        }

        // Kiểm tra email đã tồn tại chưa
        if (this.userService.checkEmailExist(registerDTO.getEmail())) {
            model.addAttribute("errorEmail", "Email đã được sử dụng.");
            model.addAttribute("registerUser", registerDTO);
            return "client/auth/register";
        }

        String rawPassword = registerDTO.getPassword();
        String hashPassword = this.passwordEncoder.encode(rawPassword);

        // sử dụng mapper chuyển registerDTO thành User
        User user = this.userService.registerDTOToUser(registerDTO);

        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        user.setEmailVerified(false);

        // Tạo OTP và set vào user
        String otp = this.userService.generateEmailOtp(user);

        this.userService.handleSaveUser(user);

        // Gửi email OTP
        try {
            String subject = "Mã OTP xác minh email - Furniture Store";
            String body = "Xin chào " + user.getFullName() + ",\n\n"
                    + "Mã OTP để xác minh email của bạn là: " + otp + "\n"
                    + "Mã này sẽ hết hạn sau 5 phút.\n\n"
                    + "Nếu bạn không thực hiện đăng ký, vui lòng bỏ qua email này.";
            this.sendEmailService.sendEmail(user.getEmail(), subject, body);
        } catch (Exception ex) {
            ex.printStackTrace();
            model.addAttribute("errorEmail", "Không thể gửi email xác minh. Vui lòng thử lại sau.");
            model.addAttribute("registerUser", registerDTO);
            return "client/auth/register";
        }

        String encodedEmail = UriUtils.encode(user.getEmail(), StandardCharsets.UTF_8);
        return "redirect:/login?pendingVerify=true&email=" + encodedEmail;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @PostMapping("/api/verify-otp")
    @ResponseBody
    public ResponseEntity<?> verifyOtp(@RequestParam("email") String email,
            @RequestParam("otp") String otp) {
        Map<String, String> response = new HashMap<>();

        try {
            boolean success = this.userService.verifyEmailOtp(email, otp);
            if (!success) {
                response.put("status", "error");
                response.put("message", "Mã OTP không hợp lệ hoặc đã hết hạn");
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
            }

            response.put("status", "success");
            response.put("message", "Xác minh email thành công. Bạn có thể đăng nhập ngay");
            return ResponseEntity.ok(response);
        } catch (Exception ex) {
            ex.printStackTrace();
            response.put("status", "error");
            response.put("message", "Đã có lỗi xảy ra. Vui lòng thử lại");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @GetMapping("/access-denied")
    public String getDenyPage(Model model) {
        return "client/auth/deny";
    }

    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);

        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        List<Order> orders = this.orderService.fetchOrderByUser(currentUser);
        model.addAttribute("orders", orders);
        return "client/cart/order-history";
    }

    @GetMapping("/forgot-password")
    public String getForgotPasswordPage(Model model) {
        model.addAttribute("forgotPasswordDTO", new ForgotPasswordDTO());
        return "client/auth/forgotPassword";
    }

    @PostMapping("/forgot-password")
    public String handleForgotPassword(@ModelAttribute("forgotPasswordDTO") @Valid ForgotPasswordDTO forgotPasswordDTO,
            BindingResult result, Model model, HttpServletRequest request) {

        if (result.hasErrors()) {
            return "client/auth/forgotPassword";
        }

        String email = forgotPasswordDTO.getEmail();

        // Kiểm tra email có tồn tại trong hệ thống không
        if (!this.userService.checkEmailExist(email)) {
            model.addAttribute("errorMessage", "Email không tồn tại trong hệ thống.");
            return "client/auth/forgotPassword";
        }

        try {
            User user = this.userService.getUserByEmail(email);

            // Tạo token
            String token = this.tokenService.createPasswordResetToken(user);

            // Tạo link reset password
            String baseUrl = request.getScheme() + "://" + request.getServerName();
            if (request.getServerPort() != 80 && request.getServerPort() != 443) {
                baseUrl += ":" + request.getServerPort();
            }
            baseUrl += request.getContextPath();
            String resetLink = baseUrl + "/reset-password?token=" + token;

            // Đảm bảo fullName không null khi gửi email
            String fullName = user.getFullName();
            if (fullName == null || fullName.isBlank()) {
                fullName = user.getEmail(); // Sử dụng email nếu fullName không có
            }

            // Gửi email
            this.sendEmailService.sendPasswordResetEmail(email, fullName, resetLink);

            model.addAttribute("successMessage", "Password reset email đã được gửi! Vui lòng kiểm tra email của bạn.");
            return "client/auth/forgotPassword";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Đã xảy ra lỗi khi gửi email. Vui lòng thử lại sau.");
            return "client/auth/forgotPassword";
        }
    }

    @GetMapping("/reset-password")
    public String getResetPasswordPage(@RequestParam(required = false) String token, Model model) {
        if (token == null || token.isEmpty()) {
            model.addAttribute("errorMessage", "Token không hợp lệ.");
            return "client/auth/resetPasswordError";
        }

        // Validate token
        PasswordResetToken resetToken = this.tokenService.validatePasswordResetToken(token);

        if (resetToken == null) {
            model.addAttribute("errorMessage", "Token đã hết hạn.");
            return "client/auth/resetPasswordError";
        }

        // Tạo DTO và set token vào đó
        ResetPasswordDTO dto = new ResetPasswordDTO();
        dto.setToken(token);

        model.addAttribute("token", token);
        model.addAttribute("resetPasswordDTO", dto);
        return "client/auth/resetPassword";
    }

    @PostMapping("/reset-password")
    public String handleResetPasswordWithToken(
            @ModelAttribute("resetPasswordDTO") @Valid ResetPasswordDTO resetPasswordDTO,
            BindingResult result, Model model) {

        // Get token from DTO
        String token = resetPasswordDTO.getToken();

        // Nếu token là null hoặc rỗng thì hiển thị error
        if (token == null || token.isEmpty()) {
            model.addAttribute("errorMessage", "Token không hợp lệ.");
            return "client/auth/resetPasswordError";
        }

        model.addAttribute("token", token);

        // Validate token trước
        PasswordResetToken resetToken = this.tokenService.validatePasswordResetToken(token);

        if (resetToken == null) {
            model.addAttribute("errorMessage", "Token đã hết hạn.");
            return "client/auth/resetPasswordError";
        }

        if (result.hasErrors()) {
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                String fieldName = error.getField();
                String errorMessage = error.getDefaultMessage();
                model.addAttribute("error" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1),
                        errorMessage);
            }
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        String newPassword = resetPasswordDTO.getNewPassword();
        String confirmPassword = resetPasswordDTO.getConfirmPassword();

        if (newPassword.length() < 6) {
            model.addAttribute("errorMessage", "Mật khẩu phải có ít nhất 6 ký tự.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        if (!newPassword.matches(".*[a-z].*")) {
            model.addAttribute("errorMessage", "Mật khẩu phải có ít nhất 1 chữ cái thường.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        if (!newPassword.matches(".*[A-Z].*")) {
            model.addAttribute("errorMessage", "Mật khẩu phải có ít nhất 1 chữ cái hoa.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        if (!newPassword.matches(".*[0-9].*")) {
            model.addAttribute("errorMessage", "Mật khẩu phải có ít nhất 1 số.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("errorMessage", "Mật khẩu không khớp.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }

        String hashPassword = this.passwordEncoder.encode(newPassword);
        boolean success = this.tokenService.changePasswordWithToken(token, hashPassword);

        if (success) {
            return "redirect:/login?resetSuccess=true";
        } else {
            model.addAttribute("errorMessage", "Đã xảy ra lỗi. Vui lòng thử lại.");
            model.addAttribute("resetPasswordDTO", resetPasswordDTO);
            return "client/auth/resetPassword";
        }
    }

    @GetMapping("/view-profile")
    public String getProfileView(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "client/homepage/viewProfile";
    }

    @GetMapping("update-profile/{id}")
    public String getProfileUpdatePage(HttpSession session, Model model, @PathVariable long id) {
        Long sessionUserID = (Long) session.getAttribute("id");
        if (sessionUserID == null || sessionUserID != id) {
            return "not-match";
        }
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("id", id);
        model.addAttribute("updateUser", currentUser);
        return "client/homepage/updateProfile";
    }

    @PostMapping("/update-profile")
    public String updateProfile(@ModelAttribute("updateUser") User updateUser, BindingResult result,
            @RequestParam("avatarFile") MultipartFile file, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Long id = (Long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id);
        if (result.hasErrors())
            return "not-match";
        if (file != null && !file.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setAvatar(avatar);
            currentUser.setPhone(updateUser.getPhone());
            currentUser.setAddress(updateUser.getAddress());
            this.userService.handleSaveUser(currentUser);
            session.setAttribute("avatar", avatar);
            return "redirect:/view-profile";
        } else {
            currentUser.setPhone(updateUser.getPhone());
            currentUser.setAddress(updateUser.getAddress());
            this.userService.handleSaveUser(currentUser);
            return "redirect:/view-profile";
        }
    }

    @GetMapping("/change-password")
    public String getChangePasswordPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Long id = (Long) session.getAttribute("id");
        User user = this.userService.getUserById(id);

        // Kiểm tra nếu user đăng nhập bằng OAuth2 (avatar là URL)
        boolean isOAuth2User = user != null && user.getAvatar() != null &&
                (user.getAvatar().startsWith("http://") || user.getAvatar().startsWith("https://"));

        ChangePasswordDTO changePasswordDTO = ChangePasswordDTO.builder().userId(user != null ? user.getId() : null)
                .build();
        model.addAttribute("changePasswordDTO", changePasswordDTO);
        model.addAttribute("isOAuth2User", isOAuth2User);
        if (isOAuth2User) {
            model.addAttribute("errorMessage",
                    "Tài khoản đăng nhập bằng Google không thể đổi mật khẩu. Vui lòng đổi mật khẩu trên tài khoản Google của bạn.");
        }
        return "client/homepage/changePassword";
    }

    @PostMapping("/change-password")
    public String changePassword(@ModelAttribute("changePasswordDTO") @Valid ChangePasswordDTO changePasswordDTO,
            BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            String error = result.getFieldError().getDefaultMessage();
            model.addAttribute("errorNewPassword", error);
            return "client/homepage/changePassword";
        }
        HttpSession session = request.getSession(false);
        if (session == null) {
            model.addAttribute("errorOldPassword", "Phiên làm việc đã hết hạn. Vui lòng đăng nhập lại.");
            return "client/homepage/changePassword";
        }
        Long sessionId = (Long) session.getAttribute("id");
        if (sessionId == null) {
            model.addAttribute("errorOldPassword", "User không hợp lệ. Vui lòng đăng nhập lại.");
            return "client/homepage/changePassword";
        }
        Long id = sessionId;
        String oldPassword = changePasswordDTO.getOldPassword();
        String newPassword = changePasswordDTO.getNewPassword();

        User user = this.userService.getUserById(id);
        if (user == null) {
            model.addAttribute("errorOldPassword", "User không tồn tại.");
            return "client/homepage/changePassword";
        }

        // Kiểm tra nếu user đăng nhập bằng OAuth2 (avatar là URL)
        boolean isOAuth2User = user.getAvatar() != null &&
                (user.getAvatar().startsWith("http://") || user.getAvatar().startsWith("https://"));
        if (isOAuth2User) {
            model.addAttribute("changePasswordDTO", changePasswordDTO);
            model.addAttribute("isOAuth2User", true);
            model.addAttribute("errorMessage",
                    "Tài khoản đăng nhập bằng Google không thể đổi mật khẩu. Vui lòng đổi mật khẩu trên tài khoản Google của bạn.");
            return "client/homepage/changePassword";
        }

        if (passwordEncoder.matches(oldPassword, user.getPassword())) {
            // Kiểm tra mật khẩu mới có khác mật khẩu cũ không
            if (passwordEncoder.matches(newPassword, user.getPassword())) {
                model.addAttribute("errorNewPassword", "Mật khẩu mới phải khác mật khẩu cũ");
                return "client/homepage/changePassword";
            }
            user.setPassword(passwordEncoder.encode(newPassword));
            this.userService.handleSaveUser(user);
            model.addAttribute("message", "Thay đổi mật khẩu thành công!");
            return "redirect:/change-password-success";
        } else {
            model.addAttribute("errorOldPassword", "Mật khẩu không chính xác");
            return "client/homepage/changePassword";
        }
    }

    @GetMapping("/change-password-success")
    public String getSuccessPage() {
        return "client/homepage/changePasswordSuccess";
    }
}
