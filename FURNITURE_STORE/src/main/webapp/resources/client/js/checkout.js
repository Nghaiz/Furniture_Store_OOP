function showErrorAlert(errorDetails, generalMessage) {
    const oldAlert = document.querySelector('.checkout-alert');
    if (oldAlert) {
        oldAlert.remove();
    }

    const alertDiv = document.createElement('div');
    alertDiv.className = 'alert alert-dismissible fade show mb-4 checkout-alert checkout-alert--error';
    alertDiv.setAttribute('role', 'alert');

    let html = '<div class="checkout-alert__header">';
    html += '<div class="checkout-alert__icon-wrapper">';
    html += '<i class="fas fa-exclamation-circle checkout-alert__icon"></i>';
    html += '</div>';
    html += '<div class="checkout-alert__content">';
    html += '<h5 class="checkout-alert__title">Không thể đặt hàng</h5>';
    html += '<p class="checkout-alert__message">Một số sản phẩm trong giỏ hàng không đủ số lượng tồn kho</p>';
    html += '</div>';
    html += '<button type="button" class="checkout-alert__close" data-bs-dismiss="alert" aria-label="Close">';
    html += '<i class="fas fa-times"></i>';
    html += '</button>';
    html += '</div>';

    if (errorDetails && errorDetails.length > 0) {
        html += '<div class="checkout-error-details">';
        html += '<div class="checkout-error-details__list">';

        errorDetails.forEach((item, index) => {
            html += '<div class="checkout-error-item">';
            html += '<div class="checkout-error-item__header">';
            html += '<div class="checkout-error-item__number">' + (index + 1) + '</div>';
            html += '<div class="checkout-error-item__info">';
            html += '<h6 class="checkout-error-item__name">' + (item.productName || 'N/A') + '</h6>';
            html += '<p class="checkout-error-item__message">';
            html += '<i class="fas fa-info-circle me-1"></i>';
            html += (item.message || 'Không đủ hàng');
            html += '</p>';
            html += '</div>';
            html += '</div>';
            html += '<div class="checkout-error-item__quantities">';
            html += '<div class="quantity-box quantity-box--warning">';
            html += '<div class="quantity-box__label">Yêu cầu</div>';
            html += '<div class="quantity-box__value">' + (item.requestedQuantity || 0) + '</div>';
            html += '</div>';
            html += '<div class="quantity-box__separator">';
            html += '<i class="fas fa-arrow-right"></i>';
            html += '</div>';
            html += '<div class="quantity-box quantity-box--danger">';
            html += '<div class="quantity-box__label">Còn lại</div>';
            html += '<div class="quantity-box__value">' + (item.availableQuantity || 0) + '</div>';
            html += '</div>';
            html += '</div>';
            html += '</div>';
        });

        html += '</div>';
        html += '<div class="checkout-error-details__footer">';
        html += '<i class="fas fa-lightbulb me-2"></i>';
        html += '<span>Vui lòng điều chỉnh số lượng hoặc xóa sản phẩm trong giỏ hàng để tiếp tục</span>';
        html += '</div>';
        html += '</div>';
    } else {
        html += '<div class="checkout-error-details">';
        html += '<div class="checkout-error-details__footer">';
        html += '<i class="fas fa-lightbulb me-2"></i>';
        html += '<span>' + (generalMessage || 'Không đủ hàng để đặt đơn hàng') + '</span>';
        html += '</div>';
        html += '</div>';
    }

    alertDiv.innerHTML = html;

    const form = document.getElementById('checkoutForm');
    form.insertBefore(alertDiv, form.firstChild);

    alertDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
}

(function initErrorDisplay() {
    const existingAlert = document.querySelector('.checkout-alert');
    if (existingAlert) {
        existingAlert.scrollIntoView({ behavior: 'smooth', block: 'center' });
        return;
    }

    const errorDetailsScript = document.getElementById('errorDetailsData');
    const errorMessageInput = document.getElementById('errorMessageData');
    if (errorDetailsScript && errorMessageInput) {
        try {
            const errorDetailsFromServer = JSON.parse(errorDetailsScript.textContent);
            const errorMessage = errorMessageInput.value;
            if (errorDetailsFromServer && errorDetailsFromServer.length > 0) {
                showErrorAlert(errorDetailsFromServer, errorMessage || 'Không đủ hàng để đặt đơn hàng');
            }
        } catch (e) {
            console.error('Error parsing errorDetails:', e);
        }
    }
})();

const checkoutForm = document.getElementById('checkoutForm');
const receiverName = document.getElementById('receiverName');
const receiverPhone = document.getElementById('receiverPhone');
const receiverAddress = document.getElementById('receiverAddress');

const phoneRegex = /^(0|\+84)[0-9]{9,10}$/;

function validateName() {
    const value = receiverName.value.trim();
    const errorSpan = receiverName.nextElementSibling.querySelector('span');
    
    if (!value) {
        receiverName.classList.remove('is-valid');
        receiverName.classList.add('is-invalid');
        errorSpan.textContent = 'Vui lòng nhập họ và tên';
        return false;
    }
    if (value.length < 2) {
        receiverName.classList.remove('is-valid');
        receiverName.classList.add('is-invalid');
        errorSpan.textContent = 'Họ và tên phải có ít nhất 2 ký tự';
        return false;
    }
    if (value.length > 100) {
        receiverName.classList.remove('is-valid');
        receiverName.classList.add('is-invalid');
        errorSpan.textContent = 'Họ và tên không được vượt quá 100 ký tự';
        return false;
    }
    receiverName.classList.remove('is-invalid');
    receiverName.classList.add('is-valid');
    return true;
}

function validatePhone() {
    const value = receiverPhone.value.trim();
    const errorSpan = receiverPhone.nextElementSibling.querySelector('span');
    
    if (!value) {
        receiverPhone.classList.remove('is-valid');
        receiverPhone.classList.add('is-invalid');
        errorSpan.textContent = 'Vui lòng nhập số điện thoại';
        return false;
    }
    if (!phoneRegex.test(value)) {
        receiverPhone.classList.remove('is-valid');
        receiverPhone.classList.add('is-invalid');
        errorSpan.textContent = 'Số điện thoại không hợp lệ (VD: 0912345678 hoặc +84912345678)';
        return false;
    }
    receiverPhone.classList.remove('is-invalid');
    receiverPhone.classList.add('is-valid');
    return true;
}

function validateAddress() {
    const value = receiverAddress.value.trim();
    const errorSpan = receiverAddress.nextElementSibling.querySelector('span');
    
    if (!value) {
        receiverAddress.classList.remove('is-valid');
        receiverAddress.classList.add('is-invalid');
        errorSpan.textContent = 'Vui lòng nhập địa chỉ nhận hàng';
        return false;
    }
    if (value.length < 10) {
        receiverAddress.classList.remove('is-valid');
        receiverAddress.classList.add('is-invalid');
        errorSpan.textContent = 'Địa chỉ phải có ít nhất 10 ký tự';
        return false;
    }
    if (value.length > 255) {
        receiverAddress.classList.remove('is-valid');
        receiverAddress.classList.add('is-invalid');
        errorSpan.textContent = 'Địa chỉ không được vượt quá 255 ký tự';
        return false;
    }
    receiverAddress.classList.remove('is-invalid');
    receiverAddress.classList.add('is-valid');
    return true;
}

function validateForm() {
    const isNameValid = validateName();
    const isPhoneValid = validatePhone();
    const isAddressValid = validateAddress();
    
    if (!isNameValid) {
        receiverName.classList.add('shake');
        setTimeout(() => receiverName.classList.remove('shake'), 500);
    }
    if (!isPhoneValid) {
        receiverPhone.classList.add('shake');
        setTimeout(() => receiverPhone.classList.remove('shake'), 500);
    }
    if (!isAddressValid) {
        receiverAddress.classList.add('shake');
        setTimeout(() => receiverAddress.classList.remove('shake'), 500);
    }
    
    if (!isNameValid) {
        receiverName.focus();
        receiverName.scrollIntoView({ behavior: 'smooth', block: 'center' });
    } else if (!isPhoneValid) {
        receiverPhone.focus();
        receiverPhone.scrollIntoView({ behavior: 'smooth', block: 'center' });
    } else if (!isAddressValid) {
        receiverAddress.focus();
        receiverAddress.scrollIntoView({ behavior: 'smooth', block: 'center' });
    }
    
    return isNameValid && isPhoneValid && isAddressValid;
}

receiverName.addEventListener('input', validateName);
receiverName.addEventListener('blur', validateName);

receiverPhone.addEventListener('input', function() {
    let value = this.value;
    if (value.startsWith('+')) {
        value = '+' + value.slice(1).replace(/[^0-9]/g, '');
    } else {
        value = value.replace(/[^0-9]/g, '');
    }
    this.value = value;
    validatePhone();
});
receiverPhone.addEventListener('blur', validatePhone);

receiverAddress.addEventListener('input', validateAddress);
receiverAddress.addEventListener('blur', validateAddress);

let allowSubmit = false;

checkoutForm.addEventListener('submit', function (e) {
    if (!validateForm()) {
        e.preventDefault();
        return;
    }

    if (allowSubmit) {
        allowSubmit = false;
        return;
    }

    e.preventDefault();

    const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    const submitButton = this.querySelector('button[type="submit"]');

    submitButton.disabled = true;
    submitButton.textContent = 'Đang xử lý...';

    if (paymentMethod === 'VNPAY') {
        const formData = new FormData(this);

        fetch('/order/create-vnpay', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data.success === 'true') {
                    window.location.href = data.paymentUrl;
                } else {
                    const errorDetails = data.errorDetails || [];
                    showErrorAlert(errorDetails, data.message || 'Có lỗi xảy ra khi tạo đơn hàng');
                    submitButton.disabled = false;
                    submitButton.textContent = 'Đặt hàng';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showErrorAlert([], 'Có lỗi xảy ra, vui lòng thử lại!');
                submitButton.disabled = false;
                submitButton.textContent = 'Đặt hàng';
            });
    } else {
        const formData = new FormData(this);

        fetch('/order/check-stock', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if (data.success === true) {
                    allowSubmit = true;
                    submitButton.disabled = false;
                    submitButton.textContent = 'Đặt hàng';
                    checkoutForm.submit();
                } else {
                    const errorDetails = data.errorDetails || [];
                    showErrorAlert(errorDetails, data.message || 'Không đủ hàng để đặt đơn hàng');
                    submitButton.disabled = false;
                    submitButton.textContent = 'Đặt hàng';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showErrorAlert([], 'Có lỗi xảy ra khi kiểm tra tồn kho, vui lòng thử lại!');
                submitButton.disabled = false;
                submitButton.textContent = 'Đặt hàng';
            });
    }
});

const backToTopBtn = document.querySelector('.back-to-top');
if (backToTopBtn) {
    window.addEventListener('scroll', () => {
        if (window.scrollY > 300) {
            backToTopBtn.classList.remove('tw-opacity-0', 'tw-invisible');
            backToTopBtn.classList.add('tw-opacity-100', 'tw-visible');
        } else {
            backToTopBtn.classList.add('tw-opacity-0', 'tw-invisible');
            backToTopBtn.classList.remove('tw-opacity-100', 'tw-visible');
        }
    });

    backToTopBtn.addEventListener('click', (e) => {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}
