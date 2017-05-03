<!DOCTYPE html>
<html lang="en" xmlns:v-on="http://www.w3.org/1999/xhtml" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scaleable=no"/>


    <title>Fallen Timbers</title>

<#include "vendor_styles.ftl">
</head>
<body>
<style>
    #landing {
        height: 100vh;
        padding-top: 64px;
        background: center center no-repeat url("/img/landing_bg.jpg");
        background-size: cover;
    }

    #logo-container {
        position: relative;
        top: 50%;
        transform: translateY(-50%);
    }

    #logo-container > img {
        width: 55%;
        display: block;
        margin: 0 auto;
        opacity: 0.8;
    }

    .thumbnail-container:hover .overlay {
        opacity: 0.5;
    }

    .overlay {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        height: 100%;
        width: 100%;
        opacity: 0;
        transition: .5s ease;
        background-color: #ffffff;
    }

    .carousel-indicators li, .carousel-indicators .active {
        opacity: 0.5;
        height: 1px;
        width: 20px;
        margin-right: 5px;
        margin-top: 0px;
        margin-bottom: 0px;
    }

    .carousel-indicators .active {
        opacity: 1;
    }

    .thumbnail-container .carousel-indicators li {
        opacity: 1;
        width: 12px;
    }

    .thumbnail-container .carousel-indicators {
        bottom: 0px;
    }
</style>
<div id="app">

<#include "nav.ftl">
<#include "landing.ftl">

    <div class="container-fluid" v-for="pg in productGroups" :id="pg.title"
         style="padding-top: 64px; text-align: center; min-height: 100vh; padding: 35px;">
        <div v-if="pg.title === 'events'" style="margin-top: 40px;" class="container">
            <h3>
                <i class="fa fa-calendar" aria-hidden="true" style="margin-right: 20px;"></i>{{pg.title}}
            </h3>

            <div class="row" style="margin-bottom: 20px;">
                <div class="col-xs-12 col-md-6">
                    <a href="http://www.madelocalmarketplaceshows.com/" target="_blank">
                        <img src="/img/made_local.jpg" class="img-responsive img-thumbnail">
                    </a>
                </div>

                <div class="col-xs-12 col-md-6">
                    <h3>May 13, 2017</h3>
                    <h3>12pm - 6pm</h3>
                    <h3>Made Local Marketplace</h3>
                    <h3>Kenwood Towne Center - Cincinnati, OH</h3>
                </div>
            </div>

            <div class="row" style="margin-bottom: 20px;">
                <div class="col-xs-12 col-md-6">
                    <a href="http://www.charmatthefarm.com/" target="_blank">
                        <img src="/img/charm_at_the_farm.jpg" class="img-responsive img-thumbnail">
                    </a>
                </div>

                <div class="col-xs-12 col-md-6">
                    <h3>August 26, 2017 10am - 6pm</h3>
                    <h3>August 27, 2017 8am - 4pm</h3>
                    <h3>Charm at the Farm - Summer Market</h3>
                    <h3>Lebanon, OH</h3>
                </div>
            </div>

            <div class="row" style="margin-bottom: 20px;">
                <div class="col-xs-12 col-md-6">
                    <a href="http://web.worthingtonchamber.org/events/eventdetail.aspx?EventID=2089" target="_blank">
                        <img src="/img/market_day.jpg" class="img-responsive img-thumbnail">
                    </a>
                </div>

                <div class="col-xs-12 col-md-6">
                    <h3>September 23, 2017</h3>
                    <h3>9am - 4pm</h3>
                    <h3>Market Day</h3>
                    <h3>Worthington, OH</h3>
                </div>
            </div>
        </div>

        <div v-else-if="pg.title === 'contact'">
        <#include "contact.ftl">
        </div>

        <div v-else-if="pg.title === 'about'" class="container">
        <#include "about.ftl">
        </div>

        <div v-else>
            <h3>{{pg.title}}</h3>

            <div class="container-fluid" v-if="pg.products">
                <div class="row" v-for="row in pg.rows">
                    <div class="col-xs-12 col-sm-12 col-md-4 thumbnail-container"
                         style="padding: 0px; cursor: pointer;"
                         v-for="product in row"
                         v-on:click.prevent="showProductModal(product)">
                        <img class="img-responsive" v-bind:src="product.thumbnail" style="margin: auto;">
                        <div class="overlay"></div>

                        <ol class="carousel-indicators" v-if="product.images.length > 1">
                            <li v-for="(photo, index) in product.images">
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="product-modal" class="modal fade" v-if="modalReady" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div id="carousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li v-for="(photo, index) in activeProduct.images"
                            data-target="#carousel-indicators"
                            v-bind:data-slide-to="index"
                            v-bind:class="{ active: index == 0 }">
                        </li>
                    </ol>
                    <div class="carousel-inner" role="listbox">
                        <div class="item"
                             v-for="(photo, index) in activeProduct.images"
                             v-bind:class="{ active: index == 0 }">
                            <img class="d-block img-fluid" v-bind:src="photo.url" style="height: 100%; width: 100%;"/>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var productGroups = ${productGroups};
</script>

<#include "vendor_scripts.ftl">
<#include "app_scripts.ftl">
<#include "google_analytics.ftl">

</body>
</html>