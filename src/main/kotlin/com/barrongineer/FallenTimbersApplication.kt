package com.barrongineer

import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.scheduling.annotation.EnableScheduling

@EnableScheduling
@SpringBootApplication
class FallenTimbersApplication

fun main(args: Array<String>) {
    SpringApplication.run(FallenTimbersApplication::class.java, *args)
}
