package com.example.minesweeper;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MinesweeperApplication {

    public void main(String[] args) {
        SpringApplication.run(MinesweeperApplication.class, args);
    
		mine_swipper.start();
	}
}
