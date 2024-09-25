package com.isolutions4u.onlineshopping.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ConfirmationController {

    @GetMapping("/confirmation")
    public String confirmation() {
        return "confirmation";
    }
}

