package com.barrongineer.service

import com.barrongineer.model.FlickrCollectionsResponse
import com.barrongineer.model.FlickrPhotosResponse
import org.springframework.stereotype.Service
import org.springframework.web.client.RestTemplate
import org.springframework.web.util.UriComponentsBuilder

@Service
class FlickrService(val restTemplate: RestTemplate) {

    fun getCollections(): FlickrCollectionsResponse {
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

    fun getPhotos(photosetId: String): FlickrPhotosResponse {
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