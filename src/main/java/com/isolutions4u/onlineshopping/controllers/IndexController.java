package com.isolutions4u.onlineshopping.controllers;

import com.isolutions4u.onlineshopping.model.Category;
import com.isolutions4u.onlineshopping.model.Product;
import com.isolutions4u.onlineshopping.service.CategoryService;
import com.isolutions4u.onlineshopping.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    @Qualifier("categoryService")
    private CategoryService categoryService;

    @Autowired
    @Qualifier("productService")
    private ProductService productService;


    @GetMapping(value = {"/", "/home"})
    public ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickHome", true);
        modelAndView.addObject("title", "Home");

        // Получаем популярные продукты
        List<Product> popularProducts = productService.getPopularProducts(3);
        modelAndView.addObject("products", popularProducts);

        List<Product> bestSellingProducts = productService.getBestSellingProducts(3);
        modelAndView.addObject("bestSellingProducts", bestSellingProducts);

        // Добавляем список категорий
        modelAndView.addObject("categories", categoryService.findAllCategories());

        return modelAndView;
    }

    @GetMapping("/contact")
    public ModelAndView contact() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickContact", true);
        modelAndView.addObject("title", "Contact Us");

        return modelAndView;
    }

    @GetMapping("/about")
    public ModelAndView about() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickAbout", true);
        modelAndView.addObject("title", "About Us");

        return modelAndView;
    }

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(name = "error", required = false) String error,
                              @RequestParam(name = "logout", required = false) String logout) {
        ModelAndView modelAndView = new ModelAndView("login");
        if (error != null) {
            modelAndView.addObject("message", "Неверный email или пароль");
        }
        if (logout != null) {
            modelAndView.addObject("logout", "Пользователь успешно вышел из системы!");
        }
        modelAndView.addObject("title", "Логин");

        return modelAndView;
    }

    @GetMapping("/show/all/products")
    public ModelAndView showAllProducts() {
        ModelAndView modelAndView = new ModelAndView("page");
        modelAndView.addObject("userClickAllProducts", true);
        modelAndView.addObject("title", "All Products");

        modelAndView.addObject("categories", categoryService.findAllCategories());

        return modelAndView;
    }

    @GetMapping("/show/category/{id}/products")
    public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
        ModelAndView modelAndView = new ModelAndView("page");

        Category category = categoryService.findCategoryById(id);

        modelAndView.addObject("userClickCategoryProducts", true);
        modelAndView.addObject("title", category.getName());
        modelAndView.addObject("categories", categoryService.findAllCategories());
        modelAndView.addObject("category", category);

        return modelAndView;
    }

    @GetMapping("/show/{id}/product")
    public ModelAndView showSingleProduct(@PathVariable("id") int id) throws ProductNotFoundExceptoion {
        ModelAndView modelAndView = new ModelAndView("page");

        Product product = productService.findProductById(id);

        if (product == null) throw new ProductNotFoundExceptoion();

        product.setViews(product.getViews() + 1);
        productService.updateProduct(product);
        modelAndView.addObject("title", product.getName());
        modelAndView.addObject("product", product);
        modelAndView.addObject("userClickShowProduct", true);

        return modelAndView;
    }

    @GetMapping("/access-denied")
    public ModelAndView accessDenied() {
        ModelAndView modelAndView = new ModelAndView("404");
        modelAndView.addObject("title", "403 - Access Denied");
        modelAndView.addObject("errorTitle", "Aha! Caught You");
        modelAndView.addObject("errorDescription", "You Are not authorized to Access this Page");
        return modelAndView;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login?logout";
    }
}
