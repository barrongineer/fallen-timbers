package com.barrongineer.config

import org.slf4j.LoggerFactory
import org.springframework.boot.CommandLineRunner
import org.springframework.stereotype.Component

@Component
class Bootstrap(val mailProperties: MailProperties) : CommandLineRunner {

    private val log = LoggerFactory.getLogger(Bootstrap::class.java)

    override fun run(vararg args: String?) {
        log.info("HOST: ${mailProperties.host}")
        log.info("PORT: ${mailProperties.port}")
        log.info("USERNAME: ${mailProperties.username}")
        log.info("PASSWORD: ${mailProperties.password}")
    }
}