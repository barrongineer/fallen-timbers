package com.barrongineer.model

object ProductGroupsCache {
    var productGroups: MutableList<ProductGroup> = mutableListOf()
}

data class Photo(
        var id: String = "",
        var url: String = "",
        var label: String = ""
)

data class Product(
        var id: String = "",
        var title: String = "",
        var thumbnail: String = "",
        var images: List<Photo> = emptyList()
)

data class ProductGroup(
        var id: String = "",
        var title: String = "",
        var products: MutableList<Product> = mutableListOf()
)