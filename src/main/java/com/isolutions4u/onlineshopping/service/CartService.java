    package com.isolutions4u.onlineshopping.service;

    import com.isolutions4u.onlineshopping.model.Cart;
    import com.isolutions4u.onlineshopping.model.CartLine;

    import java.util.List;

    public interface CartService {

        boolean saveCart(Cart cart);

        boolean updateCart(Cart cart);

        Cart findCart();

        List<CartLine> findCartLinesByCartId(int cartId);

        void clearCartLines(int cartId);

        void updateCartTotal(int cartId);

        String deleteCart(Integer id);

        String clearCart();
    }
