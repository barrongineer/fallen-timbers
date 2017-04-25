package com.barrongineer.web

import com.barrongineer.model.ProductGroupsCache
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/")
class MainController(val objectMapper: ObjectMapper) {

    @GetMapping
    fun get(model: Model): String {
        model.addAttribute("productGroups", objectMapper.writeValueAsString(ProductGroupsCache.productGroups))

        return "index"
    }
}