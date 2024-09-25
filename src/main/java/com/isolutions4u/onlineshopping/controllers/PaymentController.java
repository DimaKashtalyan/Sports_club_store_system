package com.isolutions4u.onlineshopping.controllers;

import com.isolutions4u.onlineshopping.model.Cart;
import com.isolutions4u.onlineshopping.model.CartLine;
import com.isolutions4u.onlineshopping.model.Product;
import com.isolutions4u.onlineshopping.repository.ProductRepository;
import com.isolutions4u.onlineshopping.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/flows")
public class PaymentController {

    @Autowired
    private CartService cartService;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/payment")
    public String processPayment(Model model) {

        Cart cart = cartService.findCart();

        List<CartLine> cartLines = cartService.findCartLinesByCartId(cart.getId());


        model.addAttribute("cartLines", cartLines);


        if (cartLines != null) {
            for (CartLine cartLine : cartLines) {
                int productId = cartLine.getProduct().getId();
                int quantity = cartLine.getProductCount();
                Product product = productRepository.findById(productId).orElse(null);
                if (product != null) {
                    int newQuantity = product.getQuantity() - quantity;
                    if (newQuantity >= 0) {
                        product.setQuantity(newQuantity);
                        product.setPurchases(product.getPurchases() + quantity);
                        productRepository.save(product);
                    }
                }
            }
        }

        cartService.clearCartLines(cart.getId());

        return "payment";
    }
}
