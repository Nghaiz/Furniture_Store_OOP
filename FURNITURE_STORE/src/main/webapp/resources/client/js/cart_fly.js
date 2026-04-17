(function () {
  const FORM_ACTION_PREFIX = "/add-product-to-cart";
  const DUR_TO_CENTER = 500;
  const PAUSE_AT_CENTER = 100;
  const DUR_TO_CART = 1000;
  const FORM_ID_REGEX = /\/add-product-to-cart\/(\d+)/;

  const $ = (s, r = document) => r.querySelector(s);
  const clamp = (v, a, b) => Math.min(b, Math.max(a, v));
  const lerp = (a, b, t) => a + (b - a) * t;

  function qBezier(p0, p1, p2, t) {
    const u = 1 - t;
    return {
      x: u * u * p0.x + 2 * u * t * p1.x + t * t * p2.x,
      y: u * u * p0.y + 2 * u * t * p1.y + t * t * p2.y,
    };
  }

  function findCartIcon() {
    return (
      $(".container-fluid.fixed-top .fa-shopping-bag") || $(".fa-shopping-bag")
    );
  }

  function findCartBadge() {
    const icon = findCartIcon();
    const a = icon && icon.closest("a");
    return a
      ? a.querySelector(".position-absolute.bg-secondary, .bg-secondary")
      : null;
  }

  function nearestProductImage(el) {
    if (!el || typeof el.closest !== "function") {
      return null;
    }
    const root =
      el.closest(
        ".fruite-item, .fruite-img, .product, .card, [data-product]"
      ) || el.closest("div,li,section,article");
    return root ? root.querySelector("img") : null;
  }

  function resolveFormQuantity(form) {
    if (!form) return 1;
    const source =
      form.querySelector('input[name="quantity"]') ||
      form.querySelector("[data-cart-detail-index]");
    if (!source) return 1;
    const parsed = parseInt(source.value, 10);
    return Number.isFinite(parsed) && parsed > 0 ? parsed : 1;
  }

  function applyQuantityToForm(form, quantity) {
    if (!form) return;
    const qtyInput = form.querySelector('input[name="quantity"]');
    if (qtyInput) {
      qtyInput.value = quantity;
    }
    const displayInput = form.querySelector("[data-cart-detail-index]");
    if (displayInput) {
      displayInput.value = quantity;
    }
  }

  function isAddToCartForm(form) {
    if (!form || form.nodeName !== "FORM") return false;
    const action = form.getAttribute("action") || "";
    return action.startsWith(FORM_ACTION_PREFIX);
  }

  function resolveProductId(form, trigger) {
    if (!form) return null;
    const dataId =
      (trigger && trigger.getAttribute && trigger.getAttribute("data-product-id")) ||
      form.getAttribute("data-product-id");
    if (dataId) {
      const parsed = parseInt(dataId, 10);
      if (Number.isFinite(parsed) && parsed > 0) {
        return parsed;
      }
    }
    const hidden = form.querySelector('input[name="productId"]');
    if (hidden && hidden.value) {
      const parsed = parseInt(hidden.value, 10);
      if (Number.isFinite(parsed) && parsed > 0) {
        return parsed;
      }
    }
    const action = form.getAttribute("action") || "";
    const match = action.match(FORM_ID_REGEX);
    if (match && match[1]) {
      const parsed = parseInt(match[1], 10);
      if (Number.isFinite(parsed) && parsed > 0) {
        return parsed;
      }
    }
    return null;
  }

  function setButtonLoading(button, isLoading) {
    if (!button) return;
    if (button.dataset.noLoading === "true") return;
    if (isLoading) {
      if (!button.dataset.cartOriginalHtml) {
        button.dataset.cartOriginalHtml = button.innerHTML;
      }
      if ("disabled" in button) {
        button.disabled = true;
      } else {
        button.setAttribute("aria-disabled", "true");
      }
      button.innerHTML =
        '<i class="fa fa-spinner fa-spin me-2"></i>Dang them...';
    } else {
      if ("disabled" in button) {
        button.disabled = false;
      } else {
        button.removeAttribute("aria-disabled");
      }
      if (button.dataset.cartOriginalHtml) {
        button.innerHTML = button.dataset.cartOriginalHtml;
        delete button.dataset.cartOriginalHtml;
      }
    }
  }

  function resolveCsrfHeaders() {
    const tokenMeta = document.querySelector('meta[name="_csrf"]');
    const headerMeta = document.querySelector('meta[name="_csrf_header"]');
    if (!tokenMeta || !headerMeta) {
      return null;
    }
    const token = tokenMeta.getAttribute("content") || "";
    const header = headerMeta.getAttribute("content") || "";
    if (!token || !header) {
      return null;
    }
    return { token, header };
  }

  async function requestAddToCart({ productId, quantity }) {
    if (
      window.CartCommon &&
      typeof window.CartCommon.addToCart === "function"
    ) {
      return window.CartCommon.addToCart({ productId, quantity });
    }
    const headers = {
      "Content-Type": "application/json",
      "X-Requested-With": "XMLHttpRequest",
    };
    const csrf = resolveCsrfHeaders();
    if (csrf) {
      headers[csrf.header] = csrf.token;
    }
    const response = await fetch("/api/add-product-to-cart", {
      method: "POST",
      headers,
      credentials: "same-origin",
      body: JSON.stringify({ productId, quantity }),
    });
    if (response.status === 401 || response.status === 403) {
      const error = new Error("unauthorized");
      error.cartHandled = true;
      window.location.href = "/login";
      throw error;
    }
    if (!response.ok) {
      throw new Error(`HTTP ${response.status}`);
    }
    const sum = await response.json();
    if (
      window.CartCommon &&
      typeof window.CartCommon.updateCartBadge === "function"
    ) {
      window.CartCommon.updateCartBadge(sum);
      document.dispatchEvent(
        new CustomEvent("cart:refresh", { detail: { sum } })
      );
    }
    return sum;
  }

  function fireToast(heading, text, icon) {
    showCustomToast(heading, text, icon);
  }

  function showCustomToast(heading, text, icon) {
    if (!document.getElementById('custom-toast-styles')) {
      const toastStyles = document.createElement('style');
      toastStyles.id = 'custom-toast-styles';
      toastStyles.textContent = `
        .custom-toast-container {
          position: fixed;
          bottom: 24px;
          right: 24px;
          z-index: 9999;
          display: flex;
          flex-direction: column;
          gap: 12px;
          pointer-events: none;
          font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        .custom-toast {
          pointer-events: auto;
          min-width: 320px;
          max-width: 420px;
          padding: 16px 20px;
          border-radius: 16px;
          box-shadow: 0 10px 40px rgba(0,0,0,0.15), 0 4px 12px rgba(0,0,0,0.1);
          display: flex;
          align-items: flex-start;
          gap: 14px;
          transform: translateX(120%);
          opacity: 0;
          transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
          backdrop-filter: blur(10px);
        }
        .custom-toast.show {
          transform: translateX(0);
          opacity: 1;
        }
        .custom-toast.hide {
          transform: translateX(120%);
          opacity: 0;
        }
        .custom-toast.success {
          background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%);
          border: 1px solid #6ee7b7;
        }
        .custom-toast.error {
          background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%);
          border: 1px solid #fca5a5;
        }
        .custom-toast.warning {
          background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%);
          border: 1px solid #fcd34d;
        }
        .custom-toast.info {
          background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%);
          border: 1px solid #93c5fd;
        }
        .custom-toast-icon {
          width: 44px;
          height: 44px;
          border-radius: 12px;
          display: flex;
          align-items: center;
          justify-content: center;
          flex-shrink: 0;
          font-size: 20px;
        }
        .custom-toast.success .custom-toast-icon {
          background: linear-gradient(135deg, #10b981 0%, #059669 100%);
          color: white;
          box-shadow: 0 4px 12px rgba(16, 185, 129, 0.4);
        }
        .custom-toast.error .custom-toast-icon {
          background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
          color: white;
          box-shadow: 0 4px 12px rgba(239, 68, 68, 0.4);
        }
        .custom-toast.warning .custom-toast-icon {
          background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
          color: white;
          box-shadow: 0 4px 12px rgba(245, 158, 11, 0.4);
        }
        .custom-toast.info .custom-toast-icon {
          background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
          color: white;
          box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4);
        }
        .custom-toast-content {
          flex: 1;
          min-width: 0;
        }
        .custom-toast-heading {
          font-size: 15px;
          font-weight: 700;
          margin-bottom: 4px;
          line-height: 1.3;
        }
        .custom-toast.success .custom-toast-heading { color: #065f46; }
        .custom-toast.error .custom-toast-heading { color: #991b1b; }
        .custom-toast.warning .custom-toast-heading { color: #92400e; }
        .custom-toast.info .custom-toast-heading { color: #1e40af; }
        .custom-toast-text {
          font-size: 13px;
          line-height: 1.5;
          opacity: 0.85;
        }
        .custom-toast.success .custom-toast-text { color: #047857; }
        .custom-toast.error .custom-toast-text { color: #b91c1c; }
        .custom-toast.warning .custom-toast-text { color: #b45309; }
        .custom-toast.info .custom-toast-text { color: #1d4ed8; }
        .custom-toast-close {
          width: 28px;
          height: 28px;
          border-radius: 8px;
          border: none;
          background: rgba(0,0,0,0.08);
          color: rgba(0,0,0,0.5);
          cursor: pointer;
          display: flex;
          align-items: center;
          justify-content: center;
          transition: all 0.2s;
          flex-shrink: 0;
          font-size: 14px;
        }
        .custom-toast-close:hover {
          background: rgba(0,0,0,0.15);
          color: rgba(0,0,0,0.8);
        }
        .custom-toast-progress {
          position: absolute;
          bottom: 0;
          left: 0;
          height: 3px;
          border-radius: 0 0 16px 16px;
          animation: toastProgress 4s linear forwards;
        }
        .custom-toast.success .custom-toast-progress { background: #10b981; }
        .custom-toast.error .custom-toast-progress { background: #ef4444; }
        .custom-toast.warning .custom-toast-progress { background: #f59e0b; }
        .custom-toast.info .custom-toast-progress { background: #3b82f6; }
        @keyframes toastProgress {
          from { width: 100%; }
          to { width: 0%; }
        }
      `;
      document.head.appendChild(toastStyles);
    }

    let container = document.querySelector('.custom-toast-container');
    if (!container) {
      container = document.createElement('div');
      container.className = 'custom-toast-container';
      document.body.appendChild(container);
    }

    const icons = {
      success: '<i class="fas fa-check"></i>',
      error: '<i class="fas fa-times"></i>',
      warning: '<i class="fas fa-exclamation"></i>',
      info: '<i class="fas fa-info"></i>'
    };

    const toast = document.createElement('div');
    toast.className = `custom-toast ${icon || 'success'}`;
    toast.innerHTML = `
      <div class="custom-toast-icon">${icons[icon] || icons.success}</div>
      <div class="custom-toast-content">
        <div class="custom-toast-heading">${heading}</div>
        <div class="custom-toast-text">${text}</div>
      </div>
      <button class="custom-toast-close"><i class="fas fa-times"></i></button>
      <div class="custom-toast-progress"></div>
    `;

    container.appendChild(toast);

    requestAnimationFrame(() => {
      toast.classList.add('show');
    });

    const closeBtn = toast.querySelector('.custom-toast-close');
    closeBtn.addEventListener('click', () => {
      toast.classList.remove('show');
      toast.classList.add('hide');
      setTimeout(() => toast.remove(), 400);
    });

    setTimeout(() => {
      if (toast.parentElement) {
        toast.classList.remove('show');
        toast.classList.add('hide');
        setTimeout(() => toast.remove(), 400);
      }
    }, 4000);
  }

  function notifySuccess(quantity) {
    const heading = "Thêm vào giỏ hàng thành công!";
    const text =
      quantity > 1
        ? `Đã thêm ${quantity} sản phẩm vào giỏ hàng của bạn.`
        : "Sản phẩm đã được thêm vào giỏ hàng.";
    fireToast(heading, text, "success");
  }

  function notifyError(message) {
    fireToast("Không thể thêm sản phẩm", message, "error");
  }

  function notifyOutOfStock() {
    fireToast(
      "Sản phẩm đã hết hàng",
      "Xin lỗi, sản phẩm này hiện tại không còn hàng. Vui lòng chọn sản phẩm khác.",
      "warning"
    );
  }

  function handleAddError(error) {
    if (error && error.cartHandled) {
      return;
    }
    if (error && typeof error.message === "string") {
      if (error.message.includes("401") || error.message === "unauthorized") {
        notifyError("Vui lòng đăng nhập để tiếp tục mua sắm.");
        return;
      } else if (error.message.includes("403")) {
        notifyError("Bạn không có quyền thực hiện thao tác này.");
        return;
      } else if (error.message.includes("out_of_stock") || error.message.includes("hết hàng")) {
        notifyOutOfStock();
        return;
      }
    }
    notifyError("Không thể thêm số lượng đã chọn vào giỏ hàng");
  }

  function isProductOutOfStock(form, button) {
    if (button && button.disabled) {
      return true;
    }
    
    const productContainer = form.closest('[data-stock]');
    if (productContainer) {
      const stock = parseInt(productContainer.dataset.stock, 10);
      if (Number.isFinite(stock) && stock <= 0) {
        return true;
      }
    }
    
    if (button && button.dataset.outOfStock === 'true') {
      return true;
    }
    
    return false;
  }

  function injectStyles() {
    if ($("#cart-fly-styles")) return;
    const css = `
      .fly-clone{position:fixed;z-index:3000;pointer-events:none;border-radius:50%;object-fit:cover;
        box-shadow:0 12px 28px rgba(0,0,0,.22);will-change:transform,opacity}
      .cart-bump{transform-origin:center;transition:transform .28s ease;transform:scale(1.12) rotate(-6deg)}
      .cart-plus-anim{position:fixed;z-index:3500;pointer-events:none;font-weight:600;color:#fff;background:#ff4d4f;
        padding:4px 7px;border-radius:12px;font-size:12px;opacity:0;transform:translateY(0) scale(.85);
        transition:transform .6s cubic-bezier(.22,.61,.36,1),opacity .6s}
      
      /* Bubble particles effect */
      .bubble-particle{position:fixed;z-index:2999;pointer-events:none;border-radius:50%;
        will-change:transform,opacity;animation:bubbleFloat 1.2s ease-out forwards}
      @keyframes bubbleFloat{
        0%{opacity:1;transform:scale(0.3) translateY(0)}
        30%{opacity:1;transform:scale(1) translateY(-30px)}
        100%{opacity:0;transform:scale(0.5) translateY(-100px)}
      }
      
      /* Ring pulse effect */
      .ring-pulse{position:fixed;z-index:2998;pointer-events:none;border-radius:50%;border:3px solid #80c61a;
        will-change:transform,opacity;animation:ringExpand 0.8s ease-out forwards}
      @keyframes ringExpand{
        0%{opacity:1;transform:scale(0.5)}
        100%{opacity:0;transform:scale(2.5)}
      }
      
      /* Sparkle effect */
      .sparkle-particle{position:fixed;z-index:3001;pointer-events:none;
        will-change:transform,opacity;animation:sparkleAnim 0.8s ease-out forwards}
      @keyframes sparkleAnim{
        0%{opacity:1;transform:scale(0) rotate(0deg)}
        50%{opacity:1;transform:scale(1.2) rotate(180deg)}
        100%{opacity:0;transform:scale(0.5) rotate(360deg)}
      }
    `;
    const s = document.createElement("style");
    s.id = "cart-fly-styles";
    s.textContent = css;
    document.head.appendChild(s);
  }

  function createBubbleParticles(x, y, count = 8) {
    const colors = ['#80c61a', '#f99427', '#4ade80', '#60a5fa', '#f472b6', '#fbbf24'];
    for (let i = 0; i < count; i++) {
      const bubble = document.createElement('div');
      bubble.className = 'bubble-particle';
      const size = Math.random() * 16 + 8;
      const angle = (Math.PI * 2 * i) / count + Math.random() * 0.5;
      const distance = Math.random() * 60 + 30;
      const color = colors[Math.floor(Math.random() * colors.length)];
      
      Object.assign(bubble.style, {
        left: `${x - size/2}px`,
        top: `${y - size/2}px`,
        width: `${size}px`,
        height: `${size}px`,
        background: `radial-gradient(circle at 30% 30%, ${color}, ${color}88)`,
        boxShadow: `0 0 ${size/2}px ${color}66`,
        '--tx': `${Math.cos(angle) * distance}px`,
        '--ty': `${Math.sin(angle) * distance - 50}px`,
      });
      
      bubble.style.animation = `bubbleFloat 1s ease-out forwards`;
      bubble.style.setProperty('--tx', `${Math.cos(angle) * distance}px`);
      
      document.body.appendChild(bubble);
      
      const startTime = performance.now();
      const duration = 1000 + Math.random() * 500;
      
      function animateBubble(now) {
        const elapsed = now - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const easeOut = 1 - Math.pow(1 - progress, 3);
        
        const currentX = x + Math.cos(angle) * distance * easeOut;
        const currentY = y + Math.sin(angle) * distance * easeOut - 80 * easeOut;
        const scale = progress < 0.3 ? progress / 0.3 : 1 - (progress - 0.3) * 0.7;
        const opacity = progress < 0.7 ? 1 : 1 - (progress - 0.7) / 0.3;
        
        bubble.style.left = `${currentX - size/2}px`;
        bubble.style.top = `${currentY - size/2}px`;
        bubble.style.transform = `scale(${scale})`;
        bubble.style.opacity = opacity;
        
        if (progress < 1) {
          requestAnimationFrame(animateBubble);
        } else {
          bubble.remove();
        }
      }
      
      requestAnimationFrame(animateBubble);
    }
  }

  function createRingPulse(x, y) {
    const ring = document.createElement('div');
    ring.className = 'ring-pulse';
    const size = 60;
    
    Object.assign(ring.style, {
      left: `${x - size/2}px`,
      top: `${y - size/2}px`,
      width: `${size}px`,
      height: `${size}px`,
    });
    
    document.body.appendChild(ring);
    setTimeout(() => ring.remove(), 800);
  }

  function createSparkles(x, y, count = 6) {
    for (let i = 0; i < count; i++) {
      const sparkle = document.createElement('div');
      sparkle.className = 'sparkle-particle';
      sparkle.innerHTML = '✦';
      
      const angle = (Math.PI * 2 * i) / count;
      const distance = Math.random() * 40 + 25;
      const size = Math.random() * 12 + 10;
      
      Object.assign(sparkle.style, {
        left: `${x}px`,
        top: `${y}px`,
        fontSize: `${size}px`,
        color: Math.random() > 0.5 ? '#f99427' : '#80c61a',
        textShadow: '0 0 8px currentColor',
      });
      
      document.body.appendChild(sparkle);
      
      const startTime = performance.now();
      const duration = 700 + Math.random() * 300;
      
      function animateSparkle(now) {
        const elapsed = now - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const easeOut = 1 - Math.pow(1 - progress, 2);
        
        const currentX = x + Math.cos(angle) * distance * easeOut;
        const currentY = y + Math.sin(angle) * distance * easeOut - 30 * easeOut;
        const scale = progress < 0.5 ? progress * 2 : 2 - progress * 2;
        const opacity = 1 - progress;
        const rotation = progress * 360;
        
        sparkle.style.left = `${currentX}px`;
        sparkle.style.top = `${currentY}px`;
        sparkle.style.transform = `scale(${scale}) rotate(${rotation}deg)`;
        sparkle.style.opacity = opacity;
        
        if (progress < 1) {
          requestAnimationFrame(animateSparkle);
        } else {
          sparkle.remove();
        }
      }
      
      requestAnimationFrame(animateSparkle);
    }
  }

  function flyToCart(startEl, imgUrl, quantity, done) {
    const cart = findCartIcon();
    if (!cart) {
      done && done();
      return;
    }
    const added = Number.isFinite(quantity) && quantity > 0 ? quantity : 1;
    injectStyles();

    const baseEl = startEl || cart;
    const r0 = baseEl.getBoundingClientRect();
    
    const startX = r0.left + r0.width / 2;
    const startY = r0.top + r0.height / 2;
    createBubbleParticles(startX, startY, 10);
    createRingPulse(startX, startY);
    createSparkles(startX, startY, 8);
    
    const clone = document.createElement("img");
    clone.src = imgUrl;
    clone.alt = "";
    clone.className = "fly-clone";
    const base = clamp(
      Math.min(r0.width, r0.height) * 1.1,
      80,
      window.innerHeight * 0.22
    );

    Object.assign(clone.style, {
      left: `${r0.left + r0.width / 2 - base / 2}px`,
      top: `${r0.top + r0.height / 2 - base / 2}px`,
      width: `${base}px`,
      height: `${base}px`,
      opacity: "0.95",
      transition: `transform ${DUR_TO_CENTER}ms cubic-bezier(.23,1,.32,1),opacity ${DUR_TO_CENTER}ms`,
    });
    document.body.appendChild(clone);

    const cx = window.innerWidth / 2;
    const cy = window.innerHeight * 0.4;
    requestAnimationFrame(() => {
      const tx = cx - (r0.left + r0.width / 2);
      const ty = cy - (r0.top + r0.height / 2);
      clone.style.transform = `translate(${tx}px, ${ty}px) scale(.8)`;
    });

    setTimeout(() => {
      const rC = cart.getBoundingClientRect();
      const p0 = { x: cx, y: cy };
      const p2 = { x: rC.left + rC.width / 2, y: rC.top + rC.height / 2 };
      const mid = { x: (p0.x + p2.x) / 2, y: (p0.y + p2.y) / 2 };
      const dx = p2.x - p0.x;
      const dy = p2.y - p0.y;
      const len = Math.hypot(dx, dy) || 1;
      const nx = -dy / len;
      const ny = dx / len;
      const bend = clamp(len * 0.35, 120, 260);
      const p1 = {
        x: mid.x + nx * bend,
        y: mid.y + ny * bend - Math.abs(bend * 0.25),
      };

      const t0 = performance.now();
      const endScale = 0.18;

      function step(now) {
        const t = clamp((now - t0) / DUR_TO_CART, 0, 1);
        const e = t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
        const pt = qBezier(p0, p1, p2, e);
        const s = lerp(1, endScale, e);
        clone.style.transition = "none";
        clone.style.transform = `translate(${pt.x - (r0.left + r0.width / 2)}px, ${pt.y - (r0.top + r0.height / 2)}px) scale(${s})`;
        clone.style.opacity = String(lerp(0.95, 0.35, e));
        if (t < 1) requestAnimationFrame(step);
        else finish();
      }

      function finish() {
        clone.remove();
        
        const rc = cart.getBoundingClientRect();
        const cartX = rc.left + rc.width / 2;
        const cartY = rc.top + rc.height / 2;
        createBubbleParticles(cartX, cartY, 6);
        createSparkles(cartX, cartY, 4);
        
        cart.classList.add("cart-bump");
        setTimeout(() => cart.classList.remove("cart-bump"), 420);
        const badge = findCartBadge();
        if (badge) {
          const n =
            parseInt((badge.textContent || "0").replace(/\D/g, "")) || 0;
          badge.textContent = String(n + added);
        } else {
          const plus = document.createElement("div");
          plus.className = "cart-plus-anim";
          plus.textContent = `+${added}`;
          document.body.appendChild(plus);
          plus.style.left = `${rc.left + rc.width / 2 - 18}px`;
          plus.style.top = `${rc.top + rc.height / 2 - 12}px`;
          requestAnimationFrame(() => {
            plus.style.opacity = "1";
            plus.style.transform = "translateY(-18px) scale(1)";
          });
          setTimeout(() => {
            plus.style.opacity = "0";
            plus.style.transform = "translateY(-32px) scale(.8)";
            setTimeout(() => plus.remove(), 520);
          }, 520);
        }
        done && done();
      }

      requestAnimationFrame(step);
    }, DUR_TO_CENTER + PAUSE_AT_CENTER);
  }

  function onCartFormSubmit(event) {
    const form = event.target;
    if (!(form instanceof HTMLFormElement)) {
      return;
    }
    if (!isAddToCartForm(form)) {
      return;
    }
    event.preventDefault();
    if (form.dataset.cartPending === "true") {
      return;
    }

    const submitter =
      event.submitter ||
      form.querySelector('button[type="submit"]') ||
      form.querySelector("button") ||
      form;
    const submitButton =
      submitter && submitter !== form ? submitter : null;
    
    if (isProductOutOfStock(form, submitButton)) {
      notifyOutOfStock();
      return;
    }
    
    const productId = resolveProductId(form, submitButton || form);
    if (!productId) {
      form.submit();
      return;
    }
    const quantity = resolveFormQuantity(form);
    applyQuantityToForm(form, quantity);
    form.dataset.cartPending = "true";

    const productImg =
      (submitButton && nearestProductImage(submitButton)) ||
      nearestProductImage(form);
    const imgSrc =
      (productImg && (productImg.currentSrc || productImg.src)) || "";

    setButtonLoading(submitButton, true);

    const finalize = () => {
      delete form.dataset.cartPending;
      setButtonLoading(submitButton, false);
    };

    const performAdd = () =>
      requestAddToCart({ productId, quantity })
        .then(() => notifySuccess(quantity))
        .catch((error) => handleAddError(error))
        .finally(finalize);

    if (imgSrc) {
      flyToCart(productImg || submitButton || form, imgSrc, quantity, performAdd);
    } else {
      performAdd();
    }
  }

  const attach = () =>
    document.addEventListener("submit", onCartFormSubmit, true);

  document.readyState === "loading"
    ? document.addEventListener("DOMContentLoaded", attach)
    : attach();

  
  window.showCustomToast = showCustomToast;
})();