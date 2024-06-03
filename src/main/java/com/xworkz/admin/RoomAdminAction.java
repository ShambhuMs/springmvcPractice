package com.xworkz.admin;

import com.sun.deploy.net.HttpResponse;
import com.xworkz.dto.RoomDTO;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/")
public class RoomAdminAction {
    public RoomAdminAction() {
        System.out.println("Created no-arg const in RoomAdminAction....");
    }
   /* @PostMapping("/admin/room")
    public String adminRoom(HttpRequest httpRequest, HttpResponse httpResponse,RoomDTO roomDTO){
        System.out.println("Request: "+httpRequest);
        System.out.println("Response: "+httpResponse);
        return "index";
    }*/
}
