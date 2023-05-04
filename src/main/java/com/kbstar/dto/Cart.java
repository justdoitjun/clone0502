package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Cart {
    private int id;
    private String cust_id;
    private int item_id;
    private int cnt;
    private Date rdate;

    //조인 (join)
    private String cust_name;
    private String item_name;
    private int item_price;
    private String item_imgname;

    public Cart(String cust_id, String item_name, int item_price) {
        this.cust_id = cust_id;
        this.item_name = item_name;
        this.item_price = item_price;
    }
    public Cart(int id, int item_id, String cust_id, String item_name, int item_price) {
        this.id = id;
        this.item_id = item_id;
        this.cust_id = cust_id;
        this.item_name = item_name;
        this.item_price = item_price;
    }
}
