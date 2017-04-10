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
        top: 50%;
        transform: translateY(-50%);
    }

    #logo-container > img {
        width: 55%;
        display: block;
        margin: 0 auto;
        opacity: 0.8;
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

    <div class="container" v-for="pg in productGroups" :id="pg.title"
         style="padding-top: 64px; text-align: center; min-height: 100vh; padding: 35px;">
        <div v-if="pg.title === 'events'" style="margin-top: 40px;">
            <h3>
                <i class="fa fa-calendar" aria-hidden="true" style="margin-right: 20px;"></i>{{pg.title}}
            </h3>

            <div class="table-responsive">
                <table class="table table-hover">
                    <tr>
                        <td>May 13, 2017</td>
                        <td>
                            <a href="http://www.madelocalmarketplaceshows.com/" target="_blank">Made Local
                                Marketplace</a>
                        </td>
                        <td>Kenwood Towne Center - Cincinnati, OH</td>
                    </tr>

                    <tr>
                        <td>September 4, 2017</td>
                        <td>
                            <a href="http://www.uaoh.net/egov/apps/events/calendar.egov?view=detail;id=132"
                               target="_blank">Labor Day Arts Festival</a>
                        </td>
                        <td>Upper Arlington, OH</td>
                    </tr>

                    <tr>
                        <td>September 23, 2017</td>
                        <td>Market Day</td>
                        <td>Worthington, OH</td>
                    </tr>
                </table>
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

        <div v-else>
            <h3>{{pg.title}}</h3>

            <div class="container-fluid" v-if="pg.products">
                <div class="row" v-for="row in pg.rows">
                    <div class="col-12 col-sm-12 col-md-4"
                         style="padding: 0px;"
                         v-for="product in row"
                         v-on:click="showProductModal(product)">
                        <img class="img-responsive" v-bind:src="product.thumbnail" style="margin: auto;">
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