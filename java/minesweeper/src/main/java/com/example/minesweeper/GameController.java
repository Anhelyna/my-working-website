package com.example.minesweeper;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class GameController {

    @GetMapping("/api/test")
    public String test() {
        return "Java backend connected!";
    }
}