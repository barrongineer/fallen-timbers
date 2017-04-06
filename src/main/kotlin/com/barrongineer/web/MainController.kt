package com.barrongineer.web

import com.barrongineer.model.*
import com.barrongineer.service.FlickrService
import com.fasterxml.jackson.databind.ObjectMapper
import kotlinx.coroutines.experimental.CommonPool
import kotlinx.coroutines.experimental.Deferred
import kotlinx.coroutines.experimental.async
import kotlinx.coroutines.experimental.runBlocking
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
        val productGroups = mutableListOf<ProductGroup>()
        val collections = flickrService.getCollections()

        collections.collections.collection.forEach { (id, title, _, _, _, set) ->
            val products = mutableListOf<Product>()

            runBlocking {

                val deferred = mutableListOf<Deferred<FlickrPhotosResponse>>()

                set.forEach { (id, title) ->
                    deferred.add(async(CommonPool) {
                        val resp = flickrService.getPhotos(id)

                        val images = resp.photoset.photo
                                .map { Photo(id = it.id, url = buildPhotoUrl(it), label = it.title) }

                        products.add(Product(
                                id = id,
                                title = title,
                                thumbnail = buildPhotoUrl(resp.photoset.photo[0]),
                                images = images
                        ))

                        resp
                    })
                }

                deferred.forEach { it.await() }
            }

            productGroups.add(ProductGroup(
                    id = id,
                    title = title,
                    products = products
            ))
        }

        model.addAttribute("productGroups", objectMapper.writeValueAsString(productGroups))

        return "index"
    }

    fun buildPhotoUrl(photo: FlickrPhoto): String {
        return "https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}.jpg"
    }
}