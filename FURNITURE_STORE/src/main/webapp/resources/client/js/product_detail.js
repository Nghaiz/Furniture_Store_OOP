document.addEventListener("DOMContentLoaded", () => {
  const fadeEls = document.querySelectorAll(".fade-up");
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) entry.target.classList.add("visible");
      });
    },
    { threshold: 0.2 }
  );
  fadeEls.forEach((el) => observer.observe(el));

  initProductMediaGallery();
  initQuantityControls();
  initAddToCart();
  initBuyNow();
  initImageZoom();
  
});

function initProductMediaGallery() {
  const gallery = document.querySelector(".product-media-gallery");
  if (!gallery) return;

  const viewerImage = gallery.querySelector(".product-media-viewer__image");
  const viewerVideo = gallery.querySelector(".product-media-viewer__video");
  const thumbs = Array.from(gallery.querySelectorAll(".media-thumb"));
  const prevBtn = gallery.querySelector(".gallery-nav--prev");
  const nextBtn = gallery.querySelector(".gallery-nav--next");
  const interval = Number(gallery.dataset.interval || 0) || 2000;
  const shouldAutoplay = gallery.dataset.autoplay === "true";

  let currentIndex = 0;
  let autoplayTimer = null;

  const stopAutoplay = () => {
    if (!autoplayTimer) return;
    clearInterval(autoplayTimer);
    autoplayTimer = null;
  };

  const setActiveMedia = (index) => {
    if (!thumbs.length) return;
    currentIndex = (index + thumbs.length) % thumbs.length;
    thumbs.forEach((thumb, idx) =>
      thumb.classList.toggle("active", idx === currentIndex)
    );

    const targetThumb = thumbs[currentIndex];
    const mediaType = targetThumb.dataset.mediaType || "image";
    const mediaSrc = targetThumb.dataset.mediaSrc || "";

    if (mediaType === "video" && mediaSrc) {
      stopAutoplay();
      if (viewerImage) viewerImage.classList.add("is-hidden");
      if (viewerVideo) {
        viewerVideo.classList.add("is-active");
        viewerVideo.src = mediaSrc;
        viewerVideo.load();
        viewerVideo.currentTime = 0;
        viewerVideo.play().catch(() => {});
      }
      return;
    }

    if (viewerVideo) {
      viewerVideo.pause();
      viewerVideo.classList.remove("is-active");
      viewerVideo.removeAttribute("src");
      viewerVideo.load();
    }

    if (viewerImage) {
      viewerImage.classList.remove("is-hidden");
      if (mediaSrc) viewerImage.src = mediaSrc;
    }
  };

  const showNext = () => setActiveMedia(currentIndex + 1);
  const showPrev = () => setActiveMedia(currentIndex - 1);

  const startAutoplay = () => {
    if (!shouldAutoplay || thumbs.length <= 1) return;
    stopAutoplay();
    autoplayTimer = setInterval(() => {
      showNext();
    }, interval);
  };

  const restartAutoplay = () => {
    stopAutoplay();
    startAutoplay();
  };

  thumbs.forEach((thumb, idx) => {
    thumb.addEventListener("click", () => {
      setActiveMedia(idx);
      restartAutoplay();
    });
  });

  if (prevBtn)
    prevBtn.addEventListener("click", () => {
      showPrev();
      restartAutoplay();
    });

  if (nextBtn)
    nextBtn.addEventListener("click", () => {
      showNext();
      restartAutoplay();
    });

  gallery.addEventListener("mouseenter", stopAutoplay);
  gallery.addEventListener("mouseleave", startAutoplay);

  setActiveMedia(0);
  startAutoplay();
}

function initQuantityControls() {
  const form = document.querySelector("#product-detail-cart-form");
  if (!form) return;

  const visibleInput = form.querySelector(".quantity-input");
  const hiddenInput = form.querySelector('input[name="quantity"]');
  const minusBtn = form.querySelector(".btn-minus");
  const plusBtn = form.querySelector(".btn-plus");
  const maxStock = parseInt(form.querySelector('input[name="maxStock"]')?.value || "999");

  const clampQuantity = (value) => {
    const parsed = parseInt(value, 10);
    if (!Number.isFinite(parsed) || parsed <= 0) return 1;
    if (parsed > maxStock) return maxStock;
    return parsed;
  };

  const syncQuantity = () => {
    if (!visibleInput || !hiddenInput) return;
    const safeValue = clampQuantity(visibleInput.value);
    visibleInput.value = safeValue;
    hiddenInput.value = safeValue;
    return safeValue;
  };

  if (visibleInput && hiddenInput) {
    visibleInput.addEventListener("input", syncQuantity);
    visibleInput.addEventListener("blur", syncQuantity);

    if (minusBtn) {
      minusBtn.addEventListener("click", () => {
        const current = parseInt(visibleInput.value) || 1;
        visibleInput.value = Math.max(1, current - 1);
        syncQuantity();
      });
    }

    if (plusBtn) {
      plusBtn.addEventListener("click", () => {
        const current = parseInt(visibleInput.value) || 1;
        visibleInput.value = Math.min(maxStock, current + 1);
        syncQuantity();
      });
    }
  }
}

function initAddToCart() {
  const addToCartBtn = document.querySelector(".btnAddToCartDetail");
  if (!addToCartBtn) return;

  addToCartBtn.addEventListener("click", async () => {
    const form = document.querySelector("#product-detail-cart-form");
    const productId = addToCartBtn.dataset.productId;
    const quantity = parseInt(form.querySelector('input[name="quantity"]').value) || 1;
    const maxStock = parseInt(form.querySelector('input[name="maxStock"]')?.value) || 999;
    const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
    const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

    if (quantity <= 0) {
      showToast("Lỗi!", "Số lượng phải lớn hơn 0", "error");
      return;
    }

    if (quantity > maxStock) {
      showToast("Lỗi!", `Số lượng không được vượt quá ${maxStock} sản phẩm`, "error");
      return;
    }

    addToCartBtn.disabled = true;
    addToCartBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> <span>Đang thêm...</span>';

    try {
      const response = await fetch("/api/add-product-to-cart", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
        body: JSON.stringify({ productId, quantity }),
      });

      if (response.ok) {
        const data = await response.json();
        
        const cartItemCount = data.cartItemCount !== undefined ? data.cartItemCount : 0;
        const totalQuantity = data.totalQuantity !== undefined ? data.totalQuantity : cartItemCount;
        
        document.querySelectorAll("[data-mini-cart-count]").forEach(badge => {
          badge.textContent = totalQuantity;
        });
        
        const cartCountEl = document.querySelector("#cartItemCount");
        if (cartCountEl) {
          cartCountEl.textContent = cartItemCount;
        }
        
        document.dispatchEvent(new CustomEvent("cart:refresh", { 
          detail: { sum: totalQuantity, cartItemCount: cartItemCount } 
        }));
        
        await showCartModal();
        showToast("Thành công!", "Sản phẩm đã được thêm vào giỏ hàng", "success");
      } else {
        if (response.status === 401) {
          window.location.href = "/login";
        } else {
          showToast("Lỗi!", "Không thể thêm số lượng đã chọn vào giỏ hàng", "error");
        }
      }
    } catch (error) {
      console.error("Error:", error);
      showToast("Lỗi!", "Không thể thêm số lượng đã chọn vào giỏ hàng", "error");
    } finally {
      addToCartBtn.disabled = false;
      addToCartBtn.innerHTML = '<i class="fas fa-shopping-cart"></i> <span>Thêm vào giỏ hàng</span>';
    }
  });
}

function initBuyNow() {
  const buyNowBtn = document.querySelector(".btn-buy-now");
  if (!buyNowBtn) return;

  buyNowBtn.addEventListener("click", async () => {
    const form = document.querySelector("#product-detail-cart-form");
    const productId = buyNowBtn.dataset.productId;
    const quantity = parseInt(form.querySelector('input[name="quantity"]').value) || 1;
    const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
    const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

    buyNowBtn.disabled = true;
    buyNowBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> <span>Đang xử lý...</span>';

    try {
      const addResponse = await fetch("/api/add-product-to-cart", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
        body: JSON.stringify({ productId, quantity }),
      });

      if (!addResponse.ok) {
        if (addResponse.status === 401) {
          window.location.href = "/login";
          return;
        }
        throw new Error("Không thể thêm số lượng đã chọn vào giỏ hàng");
      }

      await fetch("/order/clear-selected-items", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
      });

      window.location.href = "/order/checkout";

    } catch (error) {
      console.error("Error:", error);
      showToast("Lỗi!", "Không thể thêm số lượng đã chọn vào giỏ hàng", "error");
      buyNowBtn.disabled = false;
      buyNowBtn.innerHTML = '<i class="fas fa-bolt"></i> <span>Mua ngay</span>';
    }
  });
}

async function showCartModal() {
  const modal = document.getElementById("cartModal");
  const modalBody = document.getElementById("cartModalBody");
  const overlay = modal.querySelector(".cart-modal-overlay");
  const closeBtn = modal.querySelector(".cart-modal-close");
  const continueShopping = modal.querySelector(".btn-continue-shopping");
  const checkoutBtn = modal.querySelector(".btn-checkout");

  modal.classList.add("active");
  modalBody.innerHTML = '<div style="text-align:center;padding:20px;"><i class="fas fa-spinner fa-spin fa-2x"></i></div>';

  try {
    const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
    const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

    const response = await fetch("/api/cart/items", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        [csrfHeader]: csrfToken,
      },
    });

    if (response.ok) {
      const data = await response.json();
      renderCartItems(data);
    } else {
      modalBody.innerHTML = '<div class="cart-empty"><i class="fas fa-shopping-cart"></i><p>Không thể tải giỏ hàng</p></div>';
    }
  } catch (error) {
    console.error("Error loading cart:", error);
    modalBody.innerHTML = '<div class="cart-empty"><i class="fas fa-exclamation-circle"></i><p>Đã xảy ra lỗi</p></div>';
  }

  const closeModal = () => modal.classList.remove("active");
  overlay.addEventListener("click", closeModal);
  closeBtn.addEventListener("click", closeModal);
  continueShopping.addEventListener("click", closeModal);
  
  checkoutBtn.addEventListener("click", async () => {
    try {
      const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
      const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

      await fetch("/order/clear-selected-items", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          [csrfHeader]: csrfToken,
        },
      });

      window.location.href = "/order/checkout";
    } catch (error) {
      console.error("Error:", error);
      window.location.href = "/order/checkout";
    }
  });
}

function renderCartItems(data) {
  const modalBody = document.getElementById("cartModalBody");
  const totalPriceEl = document.getElementById("cartTotalPrice");

  if (!data.items || data.items.length === 0) {
    modalBody.innerHTML = '<div class="cart-empty"><i class="fas fa-shopping-cart"></i><p>Giỏ hàng của bạn đang trống</p></div>';
    totalPriceEl.textContent = "0 đ";
    return;
  }

  let html = "";
  data.items.forEach((item) => {
    const stockQuantity = item.stockQuantity || 999;
    const isAtMax = item.quantity >= stockQuantity;
    const plusDisabled = isAtMax ? 'disabled style="opacity: 0.5; cursor: not-allowed;"' : '';
    
    html += `<div class="cart-item" data-cart-detail-id="${item.id}" data-stock="${stockQuantity}">
      <div class="cart-item-image">
        <img src="/images/product/${item.productImage}" alt="${item.productName}" />
      </div>
      <div class="cart-item-info">
        <p class="cart-item-name">${item.productName}</p>
        <p class="cart-item-price">${formatNumber(item.price)} đ</p>
        <div class="cart-item-controls">
          <div class="cart-item-quantity">
            <button type="button" class="btn-qty-minus" data-id="${item.id}">
              <i class="fas fa-minus"></i>
            </button>
            <input type="number" value="${item.quantity}" min="1" max="${stockQuantity}" readonly />
            <button type="button" class="btn-qty-plus" data-id="${item.id}" data-stock="${stockQuantity}" ${plusDisabled}>
              <i class="fas fa-plus"></i>
            </button>
          </div>
          <button type="button" class="cart-item-remove" data-id="${item.id}">
            <i class="fas fa-trash-alt"></i>
          </button>
        </div>
        ${isAtMax ? `<small style="color: #dc3545; font-size: 11px;">Đã đạt giới hạn tồn kho (${stockQuantity})</small>` : ''}
      </div>
    </div>`;
  });

  modalBody.innerHTML = html;
  totalPriceEl.textContent = formatNumber(data.totalPrice) + " đ";
  attachCartItemHandlers();
}

function attachCartItemHandlers() {
  document.querySelectorAll(".btn-qty-plus").forEach((btn) => {
    btn.addEventListener("click", async () => {
      if (btn.disabled) return;
      
      const id = btn.dataset.id;
      const stockQuantity = parseInt(btn.dataset.stock) || 999;
      const cartItem = btn.closest(".cart-item");
      const input = cartItem?.querySelector("input[type='number']");
      const currentQty = parseInt(input?.value) || 0;
      
      if (currentQty >= stockQuantity) {
        showToast("Thông báo!", `Số lượng không được vượt quá ${stockQuantity} sản phẩm`, "warning");
        return;
      }
      
      await updateCartItemQuantity(id, 1);
    });
  });

  document.querySelectorAll(".btn-qty-minus").forEach((btn) => {
    btn.addEventListener("click", async () => {
      const id = btn.dataset.id;
      await updateCartItemQuantity(id, -1);
    });
  });

  document.querySelectorAll(".cart-item-remove").forEach((btn) => {
    btn.addEventListener("click", async () => {
      const id = btn.dataset.id;
      if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
        await removeCartItem(id);
      }
    });
  });
}

async function updateCartItemQuantity(cartDetailId, change) {
  const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
  const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

  try {
    const response = await fetch("/api/cart/update-quantity", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        [csrfHeader]: csrfToken,
      },
      body: JSON.stringify({ cartDetailId, change }),
    });

    if (response.ok) {
      const data = await response.json();
      renderCartItems(data);
      
      const cartItemCount = data.cartItemCount !== undefined ? data.cartItemCount : 0;
      const totalQuantity = data.totalQuantity !== undefined ? data.totalQuantity : cartItemCount;
      
      document.querySelectorAll("[data-mini-cart-count]").forEach(badge => {
        badge.textContent = totalQuantity;
      });
      
      const cartCountEl = document.querySelector("#cartItemCount");
      if (cartCountEl) {
        cartCountEl.textContent = cartItemCount;
      }
      
      document.dispatchEvent(new CustomEvent("cart:refresh", { 
        detail: { sum: totalQuantity, cartItemCount: cartItemCount } 
      }));
    } else {
      const errorData = await response.json().catch(() => ({}));
      const errorMessage = errorData.message || "Không thể cập nhật số lượng";
      showToast("Lỗi!", errorMessage, "error");
    }
  } catch (error) {
    console.error("Error:", error);
    showToast("Lỗi!", "Đã xảy ra lỗi khi cập nhật", "error");
  }
}

async function removeCartItem(cartDetailId) {
  const csrfToken = document.querySelector('meta[name="_csrf"]')?.getAttribute("content");
  const csrfHeader = document.querySelector('meta[name="_csrf_header"]')?.getAttribute("content");

  try {
    const response = await fetch("/api/cart/remove-item", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        [csrfHeader]: csrfToken,
      },
      body: JSON.stringify({ cartDetailId }),
    });

    if (response.ok) {
      const data = await response.json();
      renderCartItems(data);
      
      const cartItemCount = data.cartItemCount !== undefined ? data.cartItemCount : 0;
      const totalQuantity = data.totalQuantity !== undefined ? data.totalQuantity : cartItemCount;
      
      document.querySelectorAll("[data-mini-cart-count]").forEach(badge => {
        badge.textContent = totalQuantity;
      });
      
      const cartCountEl = document.querySelector("#cartItemCount");
      if (cartCountEl) {
        cartCountEl.textContent = cartItemCount;
      }
      
      document.dispatchEvent(new CustomEvent("cart:refresh", { 
        detail: { sum: totalQuantity, cartItemCount: cartItemCount } 
      }));
      
      showToast("Thành công!", "Đã xóa sản phẩm khỏi giỏ hàng", "success");
    } else {
      showToast("Lỗi!", "Không thể xóa sản phẩm", "error");
    }
  } catch (error) {
    console.error("Error:", error);
    showToast("Lỗi!", "Đã xảy ra lỗi khi xóa sản phẩm", "error");
  }
}

function initImageZoom() {
  const modal = document.getElementById("imageZoomModal");
  const zoomedImage = document.getElementById("zoomedImage");
  const closeBtn = modal.querySelector(".image-zoom-close");
  const overlay = modal.querySelector(".image-zoom-overlay");

  const mainImage = document.querySelector(".product-media-viewer__image");
  if (mainImage) {
    mainImage.addEventListener("click", () => {
      zoomedImage.src = mainImage.src;
      modal.classList.add("active");
    });
  }


  const closeModal = () => modal.classList.remove("active");
  closeBtn.addEventListener("click", closeModal);
  overlay.addEventListener("click", closeModal);
  
  document.addEventListener("keydown", (e) => {
    if (e.key === "Escape" && modal.classList.contains("active")) {
      closeModal();
    }
  });
}

function formatNumber(number) {
  return new Intl.NumberFormat("vi-VN").format(number);
}

function showToast(heading, text, icon) {
  if (typeof window.showCustomToast === "function") {
    window.showCustomToast(heading, text, icon);
  } else {
    console.log(`[${icon}] ${heading}: ${text}`);
  }
}