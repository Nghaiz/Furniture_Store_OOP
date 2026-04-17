(function ($) {
  "use strict";

  $(function () {
    var $mainCards = $(
      '.sb-nav-fixed #layoutSidenav_content main .mt-5 .row > [class*="col-"].mx-auto,' +
        '.sb-nav-fixed #layoutSidenav_content main .container .row > [class*="col-"].mx-auto,' +
        '.sb-nav-fixed #layoutSidenav_content main .container-fluid .row > [class*="col-"].mx-auto'
    );

    $mainCards.addClass("admin-card");

    var $detailCards = $(
      ".sb-nav-fixed #layoutSidenav_content main .card"
    ).filter(function () {
      var $card = $(this);
      if ($card.closest("table").length) return false;
      return $card.find("img").length || $card.find(".list-group").length;
    });

    $detailCards.addClass("admin-detail-card");

    $('a[class*="btn"]').each(function () {
      var $btn = $(this);
      var href = $btn.attr("href") || "";
      if (!href.startsWith("/admin/")) return;

      // các trang list chung: /admin/user, /admin/product, /admin/order
      if (
        href === "/admin/user" ||
        href === "/admin/product" ||
        href === "/admin/order"
      ) {
        $btn.addClass("admin-back-btn");
      }
    });

    $(".admin-card")
      .find(".invalid-feedback")
      .each(function () {
        var $feedback = $(this);
        var $group = $feedback.closest(
          ".mb-3, .mb-4, .mb-2, .col-12, .col-md-6"
        );
        $group.addClass("admin-has-error");
      });

    function bindPreview(inputSelector, imgSelector) {
      var $input = $(inputSelector);
      var $img = $(imgSelector);

      if (!$input.length || !$img.length) {
        return;
      }

      $img.addClass("admin-preview");

      var currentSrc = $img.attr("src");
      if (currentSrc && currentSrc.trim() !== "") {
        $img.show();
      }

      $input.on("change", function (e) {
        var file = e.target.files && e.target.files[0];
        if (!file) return;

        var url = URL.createObjectURL(file);
        $img.attr("src", url).show();
      });
    }

    bindPreview("#productFile", "#productPreview");
    bindPreview("#avatarFile", "#avatarPreview");
  });
})(jQuery);
