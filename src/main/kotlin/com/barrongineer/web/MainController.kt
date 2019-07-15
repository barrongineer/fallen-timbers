package com.barrongineer.web

import com.barrongineer.service.FlickrService
import com.fasterxml.jackson.databind.ObjectMapper
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/")
class MainController(val flickrService: FlickrService,
                     val objectMapper: ObjectMapper) {

    @GetMapping
    fun get(model: Model): String {
        val productGroups = flickrService.getProductGroups()

        val charmSummer = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf(
                        "August 23, 2019 4pm - 8pm VIP NIGHT",
                        "August 24, 2019 10am - 4pm",
                        "August 25, 2019 10am - 3pm"
                ),
                venue = "Charm at the Farm - Spring Market",
                location = "Lebanon, OH"
        )

        val charmFall = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf(
                        "October 18, 2019 3:30pm - 7pm VIP NIGHT",
                        "October 19, 2019 10am - 4pm",
                        "October 20, 2019 10am - 3pm"
                ),
                venue = "Charm at the Farm - Summer Market",
                location = "Lebanon, OH"
        )

        model.addAttribute("events", listOf(
                charmSummer,
                charmFall))
        model.addAttribute("productGroups", productGroups)
        model.addAttribute("productGroupsJson", objectMapper.writeValueAsString(productGroups))

        return "index"
    }
}

data class Event(
        val url: String = "",
        val image: String = "",
        val dates: List<String> = emptyList(),
        val venue: String = "",
        val location: String = ""
)