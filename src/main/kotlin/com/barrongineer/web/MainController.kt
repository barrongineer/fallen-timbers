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

        val rufflesAndRust1 = Event(
                url = "https://www.rufflesandrustexpo.com/",
                image = "/img/ruffles_and_rust.jpg",
                dates = listOf("March 17, 2018 9am - 5pm", "March 18, 2018 10am - 4pm"),
                venue = "Ruffles and Rust Expo - Spring",
                location = "Butler County Fairgrounds, Hamilton OH"
        )

        val vmd = Event(
                url = "https://vintagemarketdays.com/market/west-columbus/event.php?EventId=341",
                image = "/img/vmd.jpg",
                dates = listOf("April 27, 2018 10am -5pm", "April 28, 2018 10am -5pm", "April 29, 2018 10am -4pm"),
                venue = "Vintage Market Days",
                location = "Franklin County Fair Grounds, Hilliard OH"
        )

        val charmAtTheFarmSpringMarket = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf("June 9, 2018 9am - 4pm", "June 10, 2018 9am - 3pm"),
                venue = "Charm at the Farm - Spring Market",
                location = "Lebanon, OH"
        )

        val rufflesAndRust2 = Event(
                url = "https://www.rufflesandrustexpo.com/",
                image = "/img/ruffles_and_rust.jpg",
                dates = listOf("June 16, 2018 9am - 5pm", "June 17, 2018 10am - 4pm"),
                venue = "Ruffles and Rust Expo - Spring",
                location = "Butler County Fairgrounds, Hamilton OH"
        )

//        val cityFlea = Event(
//                url = "http://www.thecityflea.com/",
//                image = "/img/city_flea.jpg",
//                dates = listOf("August 19th, 2017 10am-4pm"),
//                venue = "City Flea",
//                location = "Washington Park, Cincinnati OH"
//        )

        val charmAtTheFarmSummerMarket = Event(
                url = "http://www.charmatthefarm.com/",
                image = "/img/charm_at_the_farm.jpg",
                dates = listOf("August 25, 2018 9am - 4pm", "August 26, 2018 9am - 3pm"),
                venue = "Charm at the Farm - Summer Market",
                location = "Lebanon, OH"
        )

//        val marketDay = Event(
//                url = "http://web.worthingtonchamber.org/events/eventdetail.aspx?EventID=2089",
//                image = "/img/market_day.jpg",
//                dates = listOf("September 23, 2017", "9am - 4pm"),
//                venue = "Market Day",
//                location = "Worthington, OH"
//        )

        model.addAttribute("events", listOf(
                rufflesAndRust1,
                vmd,
                charmAtTheFarmSpringMarket,
                rufflesAndRust2,
                charmAtTheFarmSummerMarket))
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