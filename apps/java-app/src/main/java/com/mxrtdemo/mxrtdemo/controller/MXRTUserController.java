package com.mxrtdemo.mxrtdemo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/v1")
public class MXRTUserController {

    @GetMapping("/{name}")
    public String getWelcomeMessage(String name){
        return "Welcome to MXRT Demo Java app: "+name;
    }

}
