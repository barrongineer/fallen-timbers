package com.barrongineer.service

import com.barrongineer.model.*
import kotlinx.coroutines.experimental.*
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate
import org.springframework.web.util.UriComponentsBuilder

@Service
class FlickrService(val restTemplate: RestTemplate,
                    val productGroupsCache: ProductGroupsCache) {

    @Scheduled(fixedRate = 60 * 1000)
    fun populateProductGroupCache() {
        val productGroups = mutableListOf<ProductGroup>()
        val collections = getCollections()

        runBlocking {
            val jobs = mutableListOf<Job>()
            collections.collections.collection.forEach { (id, title, _, _, _, set) ->
                jobs.add(launch(CommonPool) {
                    val products = mutableListOf<Product>()

                    val deferred = mutableListOf<Deferred<FlickrPhotosResponse>>()

                    set.forEach { (id, title) ->
                        deferred.add(async(CommonPool) {
                            val resp = getPhotos(id)

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

                    productGroups.add(ProductGroup(
                            id = id,
                            title = title,
                            products = products
                    ))
                })
            }

            jobs.forEach { it.join() }
        }

        productGroupsCache.productGroups = productGroups
    }

    private fun buildPhotoUrl(photo: FlickrPhoto): String {
        return "https://farm${photo.farm}.staticflickr.com/${photo.server}/${photo.id}_${photo.secret}.jpg"
    }

    private fun getCollections(): FlickrCollectionsResponse {
        val url = UriComponentsBuilder.fromHttpUrl("https://api.flickr.com/services/rest/")
                .queryParam("api_key", "66eff9ae2c9e2a677746eb48d24fc33f")
                .queryParam("user_id", "148696990@N04")
                .queryParam("format", "json")
                .queryParam("nojsoncallback", 1)
                .queryParam("method", "flickr.collections.getTree")
                .buildAndExpand()
                .toUriString()

        return restTemplate.getForObject(url, FlickrCollectionsResponse::class.java)
    }

    private fun getPhotos(photosetId: String): FlickrPhotosResponse {
        val url = UriComponentsBuilder.fromHttpUrl("https://api.flickr.com/services/rest/")
                .queryParam("api_key", "66eff9ae2c9e2a677746eb48d24fc33f")
                .queryParam("user_id", "148696990@N04")
                .queryParam("format", "json")
                .queryParam("nojsoncallback", 1)
                .queryParam("method", "flickr.photosets.getPhotos")
                .queryParam("photoset_id", photosetId)
                .buildAndExpand()
                .toUriString()

        return restTemplate.getForObject(url, FlickrPhotosResponse::class.java)
    }
}