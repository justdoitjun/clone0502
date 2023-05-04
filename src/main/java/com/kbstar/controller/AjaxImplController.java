package com.kbstar.controller;

import com.kbstar.dto.Cust;
import com.kbstar.dto.Marker;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Array;
import java.util.*;

@RestController
public class AjaxImplController {
    @RequestMapping("/getservertime")
    public Object getservertime(){
        Date date = new Date();
        return date;
    }
    @RequestMapping("/checkid")
    public boolean checkid(String id){
        boolean result = true;
        if(id.equals("qqq") || id.equals("aaa") || id.equals("sss")){
            result = false;
        }
        return result;
    }// DB 가 없으니깐 대충 흐름만 봐. 그냥 저 3가지는 안된다고 보낼 생각임.
    @RequestMapping("/getdata")
    public Object getdata(Object obj){
        List<Cust> list = new ArrayList<>();
        list.add(new Cust("id01","pwd01", "James Lebron"));
        list.add(new Cust("id02","pwd02", "Stephen Curry"));
        list.add(new Cust("id03","pwd03", "Micheal Jordan"));
        list.add(new Cust("id04","pwd04", "James Harden"));
        list.add(new Cust("id05","pwd05", "Kevin Durant"));
        // DB 연결이 안되었으니 DB에 저게 있다고 가정하자.
        // Java의 ARRAY를 --> Key값이 붙은 JSON HashMap형태로 보내겠다.[] :
        // JSON(JavaScript Object Notation) : JavaScript 형태로 보내겠다.
        // [ {}, {}, {} ]
        JSONArray json = new JSONArray();
        for(Cust cust :list){
            JSONObject jsonObj = new JSONObject();
            Random r = new Random();
            int i = r.nextInt(100) + 1;     //이건 랜덤하게 보여줄려고 한 코드

            jsonObj.put("id", cust.getId());        //Key값 부여
            jsonObj.put("pwd", cust.getPwd());
            jsonObj.put("name", cust.getName()+i);
            json.add(jsonObj);                      //JSON 형태로 변환
        }
        return json;
    }// DB 가 없으니깐 대충 흐름만 봐. 그냥 저 3가지는 안된다고 보낼 생각임.

    @RequestMapping("/markers")
    public Object markers(String location){
        List<Marker> list = new ArrayList<Marker>();
        if(location.equals("s")){
            list.add(new Marker(100, "BigEdrestaurant","www.naver.com",
                    37.5732, 126.977, "a.jpeg", "s"));
            list.add(new Marker(101, "Charles'","www.google.com",
                    37.5712, 126.975, "b.jpeg", "s"));
            list.add(new Marker(102, "Lay's","www.economist.com",
                    37.57222, 126.976, "c.jpeg", "s"));
        }else if(location.equals("b")){
            list.add(new Marker(103, "BigEdrestaurant","www.naver.com",
                    35.170835, 129.1336096, "a.jpeg", "b"));
            list.add(new Marker(104, "Charles'","www.google.com",
                    35.171935, 129.1327096, "b.jpeg", "b"));
            list.add(new Marker(105, "Lay's","www.economist.com",
                    35.172735, 129.1348096, "c.jpeg", "b"));
        }else if(location.equals("j")){
            list.add(new Marker(106, "BigEdrestaurant","www.naver.com",
                    33.2417173, 126.5521947, "a.jpeg", "j"));
            list.add(new Marker(107, "Charles'","www.google.com",
                    33.24071736, 126.5511947, "b.jpeg", "j"));
            list.add(new Marker(108, "Lay's","www.economist.com",
                    33.24271736, 126.5531947, "c.jpeg", "j"));
        }
        JSONArray json = new JSONArray();
        for(Marker obj:list){
            JSONObject jo = new JSONObject();
            jo.put("id", obj.getId());
            jo.put("title", obj.getTitle());
            jo.put("target", obj.getTarget());
            jo.put("latitude", obj.getLat());
            jo.put("longitude", obj.getLng());
            jo.put("image", obj.getImg());
            jo.put("location", obj.getLoc());
            json.add(jo);
        }
        return json;
    }// DB 가 없으니깐 대충 흐름만 봐. 그냥 저 3가지는 안된다고 보낼 생각임.

}
