package com.barrongineer.web

import com.barrongineer.model.MailCommand
import com.barrongineer.service.MailService
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/mail")
class MailController(val mailService: MailService) {

    @PostMapping
    fun post(@RequestBody @Valid cmd: MailCommand) {
        mailService.send(cmd)
    }
}