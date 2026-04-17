package com.group10.furniture_store.controller.admin;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group10.furniture_store.domain.Product;
import com.group10.furniture_store.domain.Warehouse;
import com.group10.furniture_store.repository.ProductRepository;
import com.group10.furniture_store.service.WarehouseService;

@Controller
public class WareHouseController {
    private final WarehouseService warehouseService;
    private final ProductRepository productRepository;

    public WareHouseController(WarehouseService warehouseService, ProductRepository productRepository) {
        this.warehouseService = warehouseService;
        this.productRepository = productRepository;
    }

    @GetMapping("/admin/warehouse")
    public String getWarehousePage(Model model,
            @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception ex) {
        }

        Pageable pageable = PageRequest.of(page - 1, 10);
        Page<Warehouse> warehouses = this.warehouseService.getAllWarehouses(pageable);
        List<Warehouse> listWarehouses = warehouses.getContent();

        model.addAttribute("warehouses", listWarehouses);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", warehouses.getTotalPages());
        return "admin/warehouse/show";
    }

    @GetMapping("/admin/warehouse/create")
    public String getCreateWarehousePage(Model model) {
        model.addAttribute("newWarehouse", new Warehouse());
        List<Product> products = this.productRepository.findAll();
        model.addAttribute("products", products);
        return "admin/warehouse/create";
    }

    @PostMapping("/admin/warehouse/create")
    public String handleCreateWarehouse(
            @ModelAttribute("newWarehouse") Warehouse warehouse,
            @RequestParam("productId") Long productId,
            Model model) {

        Warehouse existingWarehouse = this.warehouseService.getWarehouseByProductId(productId);
        if (existingWarehouse != null) {
            model.addAttribute("error", "Product này đã có warehouse rồi! Mỗi product chỉ có 1 warehouse.");
            model.addAttribute("newWarehouse", new Warehouse());
            List<Product> products = this.productRepository.findAll();
            model.addAttribute("products", products);
            return "admin/warehouse/create";
        }

        Product product = this.productRepository.findById(productId).orElse(null);
        if (product != null) {
            warehouse.setProduct(product);
            warehouse.setLastUpdated(LocalDateTime.now());
            this.warehouseService.saveWarehouse(warehouse);
        }
        return "redirect:/admin/warehouse";
    }

    @GetMapping("/admin/warehouse/{id}")
    public String getWarehouseDetailPage(@PathVariable long id, Model model) {
        Warehouse warehouse = this.warehouseService.getWarehouseById(id);
        model.addAttribute("warehouse", warehouse);
        model.addAttribute("id", id);
        return "admin/warehouse/detail";
    }

    @GetMapping("/admin/warehouse/update/{id}")
    public String getUpdateWarehousePage(@PathVariable long id, Model model) {
        Warehouse currentWarehouse = this.warehouseService.getWarehouseById(id);
        model.addAttribute("newWarehouse", currentWarehouse);
        List<Product> products = this.productRepository.findAll();
        model.addAttribute("products", products);
        return "admin/warehouse/update";
    }

    @PostMapping("/admin/warehouse/update")
    public String handleUpdateWarehouse(
            @ModelAttribute("newWarehouse") Warehouse warehouse,
            @RequestParam("productId") Long productId) {

        Warehouse currentWarehouse = this.warehouseService.getWarehouseById(warehouse.getId());
        if (currentWarehouse != null) {
            Product product = this.productRepository.findById(productId).orElse(null);
            if (product != null) {
                currentWarehouse.setProduct(product);
            }
            currentWarehouse.setQuantity(warehouse.getQuantity());
            currentWarehouse.setLocation(warehouse.getLocation());
            currentWarehouse.setLastUpdated(LocalDateTime.now());
            this.warehouseService.saveWarehouse(currentWarehouse);
        }
        return "redirect:/admin/warehouse";
    }

    @GetMapping("/admin/warehouse/delete/{id}")
    public String getDeleteWarehousePage(@PathVariable long id, Model model) {
        model.addAttribute("newWarehouse", new Warehouse());
        model.addAttribute("id", id);
        return "admin/warehouse/delete";
    }

    @PostMapping("/admin/warehouse/delete/{id}")
    public String deleteWarehouse(@PathVariable long id) {
        this.warehouseService.deleteWarehouse(id);
        return "redirect:/admin/warehouse";
    }
}
