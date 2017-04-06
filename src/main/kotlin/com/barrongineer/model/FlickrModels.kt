package com.barrongineer.model

@Target(AnnotationTarget.CLASS)
annotation class NoArg

@NoArg
data class FlickrCollectionsResponse(
        val collections: FlickrCollectionsWrapper,
        val stat: String
)

@NoArg
data class FlickrCollectionsWrapper(
        val collection: List<FlickrCollection>
)

@NoArg
data class FlickrCollection(
        val id: String,
        val title: String,
        val description: String,
        val iconlarge: String,
        val iconsmall: String,
        val set: List<FlickrSet>
)

@NoArg
data class FlickrSet(
        val id: String,
        val title: String,
        val description: String
)

@NoArg
data class FlickrPhotosResponse(
        val photoset: FlickrAlbum,
        val stat: String
)

@NoArg
data class FlickrAlbum(
        val id: String,
        val primary: String,
        val owner: String,
        val ownername: String,
        val page: Int,
        val perpage: Int,
        val pages: Int,
        val total: String,
        val title: String,
        val photo: List<FlickrPhoto>
)

@NoArg
data class FlickrPhoto(
        val id: String,
        val secret: String,
        val server: String,
        val farm: Int,
        val title: String,
        val isprimary: String,
        val ispublic: Int,
        val isfriend: Int,
        val isfamily: Int
)