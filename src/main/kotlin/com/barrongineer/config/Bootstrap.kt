package com.barrongineer.config

import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component

@Component
class Bootstrap(val mailProperties: MailProperties) : CommandLineRunner {

    override fun run(vararg args: String?) {
        println("HOST: ${mailProperties.host}")
        println("PORT: ${mailProperties.port}")
        println("USERNAME: ${mailProperties.username}")
        println("PASSWORD: ${mailProperties.password}")
    }
}