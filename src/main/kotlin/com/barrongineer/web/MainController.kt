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

        val madeLocal = Event(
                url = "http://www.madelocalmarketplaceshows.com/",
                image = "/img/made_local.jpg",
                dates = listOf("May 13, 2017", "12pm - 6pm"),
                venue = "Made Local Marketplace",
                location = "Kenwood Towne Center - Cincinnati, OH"
        )

        val charmAtTheFarmSpringMarket = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf("June 3, 2017 10am - 6pm", "June 4, 2017 10am - 4pm"),
                venue = "Charm at the Farm - Spring Market",
                location = "Lebanon, OH"
        )

        val cityFlea = Event(
                url = "http://www.thecityflea.com/",
                image = "/img/city_flea.jpg",
                dates = listOf("August 19th, 2017 10am-4pm"),
                venue = "City Flea",
                location = "Washington Park, Cincinnati OH"
        )

        val charmAtTheFarmSummerMarket = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf("August 26, 2017 10am - 6pm", "August 27, 2017 10am - 4pm"),
                venue = "Charm at the Farm - Summer Market",
                location = "Lebanon, OH"
        )

        val marketDay = Event(
                url = "http://web.worthingtonchamber.org/events/eventdetail.aspx?EventID=2089",
                image = "/img/market_day.jpg",
                dates = listOf("September 23, 2017", "9am - 4pm"),
                venue = "Market Day",
                location = "Worthington, OH"
        )

        model.addAttribute("events", listOf(
                madeLocal,
                charmAtTheFarmSpringMarket,
                cityFlea,
                charmAtTheFarmSummerMarket,
                marketDay))
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