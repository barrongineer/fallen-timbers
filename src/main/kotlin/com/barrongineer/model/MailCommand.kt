package com.barrongineer.model

import org.hibernate.validator.constraints.NotBlank

class MailCommand(

        @field:NotBlank
        var from: String = "",

        @field:NotBlank
        var subject: String = "",

        @field:NotBlank
        var text: String = "",

        @field:NotBlank
        var name: String = ""
)