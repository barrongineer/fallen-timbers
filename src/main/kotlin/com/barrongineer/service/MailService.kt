package com.barrongineer.service

import com.barrongineer.model.MailCommand
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import org.springframework.stereotype.Service
import javax.mail.internet.InternetAddress

@Service
class MailService(val mailSender: JavaMailSender) {

    fun send(cmd: MailCommand) {
        val msg = mailSender.createMimeMessage()
        val helper = MimeMessageHelper(msg, false)

        val from = InternetAddress(cmd.from, cmd.name)
        helper.setFrom(from)
        helper.setReplyTo(from)
        helper.setTo("fallentimbersdesign@gmail.com")
        helper.setSubject(cmd.subject)
        helper.setText(cmd.text)

        mailSender.send(helper.mimeMessage)
    }
}