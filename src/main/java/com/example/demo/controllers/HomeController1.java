package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController1 {

    @GetMapping("/eventApp")
    public String index() {
        return "index1";
    }
}
