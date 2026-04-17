'use strict';

(function () {
  const setGroupCollapsed = (orderId, collapsed) => {
    const summary = document.querySelector(
      `.order-history__summary[data-order-id="${orderId}"]`
    );
    if (!summary) {
      return;
    }

    summary.classList.toggle('is-collapsed', collapsed);

    const detailRows = document.querySelectorAll(
      `.order-history__item[data-parent-order="${orderId}"]`
    );
    
    detailRows.forEach((row) => {
      row.classList.toggle('is-hidden', collapsed);
    });

    const toggle = summary.querySelector('.order-history__toggle');
    if (toggle) {
      toggle.setAttribute('aria-expanded', (!collapsed).toString());
      toggle.setAttribute('title', collapsed ? 'Xem chi tiết' : 'Thu gọn');
    }
  };

  const initOrderHistory = () => {
    const summaryRows = document.querySelectorAll('.order-history__summary');
    const detailRows = document.querySelectorAll('.order-history__item');

    if (!summaryRows.length) {
      return;
    }

    const prefersReducedMotion = window.matchMedia
      ? window.matchMedia('(prefers-reduced-motion: reduce)').matches
      : false;

    const observer = prefersReducedMotion ||
      typeof window.IntersectionObserver === 'undefined'
      ? null
      : new IntersectionObserver(
          (entries) => {
            entries.forEach((entry) => {
              if (entry.isIntersecting) {
                entry.target.classList.add('is-visible');
                observer.unobserve(entry.target);
              }
            });
          },
          { threshold: 0.1 }
        );

    const setupAnimation = (rows) => {
      rows.forEach((row) => row.classList.add('order-history__animate'));
      if (!observer) {
        rows.forEach((row) => row.classList.add('is-visible'));
        return;
      }
      rows.forEach((row) => observer.observe(row));
    };

    setupAnimation(summaryRows);
    setupAnimation(detailRows);

    const toggles = document.querySelectorAll('.order-history__toggle');
    toggles.forEach((toggle) => {
      toggle.addEventListener('click', (e) => {
        e.stopPropagation();
        const orderId = toggle.getAttribute('data-order-id');
        if (!orderId) {
          return;
        }
        const summary = toggle.closest('.order-history__summary');
        const currentlyCollapsed = summary?.classList.contains('is-collapsed');
        setGroupCollapsed(orderId, !currentlyCollapsed);
      });
    });

    summaryRows.forEach((summary) => {
      summary.style.cursor = 'pointer';
      summary.addEventListener('click', (e) => {
        if (e.target.closest('.order-history__toggle')) return;
        
        const orderId = summary.getAttribute('data-order-id');
        if (!orderId) return;
        
        const currentlyCollapsed = summary.classList.contains('is-collapsed');
        setGroupCollapsed(orderId, !currentlyCollapsed);
      });
    });

    const groups = document.querySelectorAll('.order-history__group');
    groups.forEach((group, index) => {
      const summary = group.querySelector('.order-history__summary');
      if (!summary) {
        return;
      }
      const orderId = summary.getAttribute('data-order-id');
      if (!orderId) {
        return;
      }

      if (index === 0) {
        setGroupCollapsed(orderId, false);
      } else {
        summary.classList.add('is-collapsed');
        const detailRows = document.querySelectorAll(
          `.order-history__item[data-parent-order="${orderId}"]`
        );
        detailRows.forEach((row) => row.classList.add('is-hidden'));
        const toggle = summary.querySelector('.order-history__toggle');
        if (toggle) {
          toggle.setAttribute('aria-expanded', 'false');
          toggle.setAttribute('title', 'Xem chi tiết');
        }
      }
    });
  };

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initOrderHistory);
  } else {
    initOrderHistory();
  }
})();
