package com.isolutions4u.onlineshopping.service;

import com.isolutions4u.onlineshopping.model.Cart;
import com.isolutions4u.onlineshopping.model.CartLine;
import com.isolutions4u.onlineshopping.repository.CartLineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("cartLineService")
public class CartLineServiceImpl implements CartLineService {

    @Autowired
    private CartService cartService;

    @Autowired
    private CartLineRepository cartLineRepository;

    @Override
    public CartLine findCartLineById(int id) {
        return cartLineRepository.getOne(id);
    }

    @Override
    public boolean saveCartLine(CartLine cartLine) {
        cartLineRepository.saveAndFlush(cartLine);
        return true;
    }

    @Override
    public boolean updateCartLine(CartLine cartLine) {
        cartLineRepository.saveAndFlush(cartLine);
        return true;
    }

    @Override
    public boolean deleteCartLine(CartLine cartLine) {
        cartLineRepository.delete(cartLine);
        return true;
    }

    @Override
    public List<CartLine> findAllCartLine(int cartId) {
        return cartLineRepository.findAll();
    }

    @Override
    public List<CartLine> findCartLines() {
        Cart cart = cartService.findCart();
        return cartLineRepository.findCartLineByCartId(cart.getId());
    }

    @Override
    public CartLine findCartLineByCartIdAndProductId(int cartId, int productId) {
        return cartLineRepository.findCartLineByCartIdAndProductId(cartId, productId);
    }

    public void clearCartLines(int cartId) {
        List<CartLine> cartLines = cartLineRepository.findCartLineByCartId(cartId);
        for (CartLine cartLine : cartLines) {
            cartLineRepository.delete(cartLine);
        }
    }

    public int calculateTotalPurchases() {
        List<CartLine> cartLines = cartLineRepository.findAll();
        int totalPurchases = 0;
        for (CartLine cartLine : cartLines) {
            totalPurchases += cartLine.getProduct().getPurchases();
        }
        return totalPurchases;
    }
}
