<!DOCTYPE html>
<html lang="en" xmlns:v-on="http://www.w3.org/1999/xhtml" xmlns:v-bind="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scaleable=no"/>


    <title>Fallen Timbers</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"/>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
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
        top: 50%;pp
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
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" v-on:click.prevent="moveTo('landing')" href="javascript:void(0)">
                    <i class="fa fa-tree" aria-hidden="true"></i> fallen timbers
                </a>
            </div>

            <div id="navbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li v-for="pg in productGroups">
                        <a v-on:click="moveTo(pg.title)" href="javascript:void(0)">{{pg.title}}</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="landing">
        <div class="container" style="height: 100%;">
            <div class="row" style="height: 100%;">
                <div id="logo-container" class="align-middle col align-self-center">
                    <img src="/img/logo.jpg"/>
                </div>
            </div>
        </div>
    </div>

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
            <h3>
                <i class="fa fa-envelope" aria-hidden="true" style="margin-right: 20px;"></i>{{pg.title}}
            </h3>

            <div style="margin-top: 50px;">
                <div>
                    <a href="mailto:fallentimbersdesign@gmail.com">fallentimbersdesign@gmail.com</a>
                </div>

                <div style="margin-top: 20px;">
                    <a href="https://www.instagram.com/fallentimbersdesign/" target="_blank">
                        <i class="fa fa-instagram" aria-hidden="true" style="font-size: 1.5em; color: #000000;"></i>
                        <span>fallentimbersdesign</span>
                    </a>
                </div>
            </div>
        </div>

        <div v-else-if="pg.title === 'about'" class="container">
            <h3>{{pg.title}}</h3>

            <div style="text-align: left;
            padding-left: 50px;
            padding-right: 50px;
            margin-top: 35px;
            font-size: 1.1em;">
                <div>
                    Fallen Timbers was born out of a family’s passion for
                    home décor, eye for design, and a can-do attitude.
                    Our pieces are made from a mix of new and reclaimed
                    wood. We’re always on the hunt for unusual reclaimed
                    timber, recovered from abandoned industrial buildings
                    and farmhouses. We love the challenge of taking
                    something old and upcycling it into something new and
                    stylish!
                </div>
                <div style="margin-top: 20px;">
                    The Fallen Timbers design is inspired by the modern
                    farmhouse. From our furniture to artwork, we pride
                    ourselves in the fact that each of our items is uniquely
                    handcrafted, without mass production. When you take
                    one of our contemporary rustic pieces home, you will
                    have a one-of-a-kind item.
                </div>
            </div>
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

    <div id="product-modal" class="modal fade" v-if="activeProduct.images" tabindex="-1" role="dialog"
         aria-hidden="true">
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

<script src="https://unpkg.com/vue/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
<#--<script src="https://unpkg.com/axios/dist/axios.min.js"></script>-->
<script src="https://unpkg.com/moveto/dist/moveTo.min.js"></script>

<script src="/js/app/app.component.js"></script>

</body>
</html>