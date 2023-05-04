package com.kbstar.service;

import com.kbstar.dto.Cart;
import com.kbstar.dto.Cust;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.CartMapper;
import com.kbstar.mapper.CustMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j // 로그 쓸 수 있음
@Service
public class CartService implements KBService<Integer, Cart> {


    /**
     * 등록 및 가입 진행
     * argument : Object
     * return : null
     *
     * @param cart
     */
    @Autowired
    CartMapper mapper;
    @Override
    public void register(Cart cart) throws Exception {
        mapper.insert(cart);
        log.info("Cart Register finished. Send mail......................" + cart.getId());
    }

    @Override
    public void remove(Integer i) throws Exception {
        mapper.delete(i);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        mapper.update(cart);
    }

    @Override
    public Cart get(Integer i) throws Exception {
        return mapper.select(i);
    }

    @Override
    public List<Cart> get() throws Exception {
        return mapper.selectall();
    }

    public List<Cart> getmycart(String cartid) throws Exception {
        return mapper.getmycart(cartid);
    }
}
