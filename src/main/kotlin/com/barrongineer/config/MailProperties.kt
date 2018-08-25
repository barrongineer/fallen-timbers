package com.barrongineer.config

import org.springframework.boot.context.properties.ConfigurationProperties
import org.springframework.stereotype.Component

@Component
@ConfigurationProperties("spring.mail")
class MailProperties {

    var host: String = ""
    var port: Int = 0
    var username: String = ""
    var password: String = ""
}