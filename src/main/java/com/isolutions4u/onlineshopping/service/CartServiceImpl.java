package com.isolutions4u.onlineshopping.service;

import com.isolutions4u.onlineshopping.model.Cart;
import com.isolutions4u.onlineshopping.model.CartLine;
import com.isolutions4u.onlineshopping.model.UserModel;
import com.isolutions4u.onlineshopping.repository.CartLineRepository;
import com.isolutions4u.onlineshopping.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private CartLineRepository cartLineRepository;

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private CartLineService cartLineService;

    @Override
    public boolean saveCart(Cart cart) {
        cartRepository.saveAndFlush(cart);
        return true;
    }

    @Override
    public boolean updateCart(Cart cart) {
        cartRepository.saveAndFlush(cart);
        return true;
    }

    @Override
    public Cart findCart() {
        return ((UserModel) httpSession.getAttribute("userModel")).getCart();
    }

    @Override
    public List<CartLine> findCartLinesByCartId(int cartId) {
        return cartLineRepository.findCartLineByCartId(cartId);
    }

    @Override
    public void clearCartLines(int cartId) {
        cartLineService.clearCartLines(cartId);

        List<CartLine> cartLines = cartLineRepository.findCartLineByCartId(cartId);
        for (CartLine cartLine : cartLines) {
            cartLine.setTotal(0);
            cartLineRepository.save(cartLine);
        }
        Cart cart = findCart();
        cart.setCartLines(0);
        cart.setGrandTotal(0);
        updateCart(cart);
    }

    @Override
    public void updateCartTotal(int cartId) {
        Cart cart = findCart();
        List<CartLine> cartLines = findCartLinesByCartId(cartId);
        double total = 0.0;
        for (CartLine cartLine : cartLines) {
            total += cartLine.getProduct().getUnitPrice() * cartLine.getProductCount();
        }
        cart.setGrandTotal(total);
        updateCart(cart);
    }



    @Override
    public String deleteCart(Integer id) {
        CartLine cartLine = cartLineService.findCartLineById(id);
        if (cartLine != null) {
            Cart cart = findCart();
            cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
            cart.setCartLines(cart.getCartLines() - 1);
            updateCart(cart);
            cartLineService.deleteCartLine(cartLine);
            updateCartTotal(cart.getId());
            return "Product Deleted Successfully";
        } else {
            return "Product Not Found";
        }
    }

    @Override
    public String clearCart() {
        Cart cart = findCart();
        cart.setGrandTotal(0);
        cart.setCartLines(0);
        updateCart(cart);
        cartLineService.clearCartLines(cart.getId());
        return "Cart Cleared Successfully";
    }
}
