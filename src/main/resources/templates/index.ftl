<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <title>Fallen Timbers</title>

<#include "vendor_styles.ftl">
</head>
<body>

<#include "app_styles.ftl">

<div id="app">

<#include "nav.ftl">
<#include "landing.ftl">

    <div class="container-fluid" v-for="pg in productGroups" :id="pg.title"
         style="padding-top: 64px; text-align: center; min-height: 100vh; padding: 35px;">
        <div v-if="pg.title === 'events'" style="margin-top: 40px;" class="container">
            <events :title="pg.title"></events>
        </div>

        <div v-else-if="pg.title === 'contact'">
        <#include "contact.ftl">
        </div>

        <div v-else-if="pg.title === 'about'" class="container">
        <#include "about.ftl">
        </div>

        <div v-else>
        <#include "product_group.ftl">
        </div>
    </div>

    <div v-for="pg in productGroups">
        <div :id="'product-modal-' + product.id" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"
             v-if="pg.title !== 'contact' || pg.title !== 'about' || pg.title !== 'events'"
             v-for="product in pg.products">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div :id="'carousel-' + product.id" class="carousel slide" data-ride="carousel" data-interval="">
                        <ol class="carousel-indicators">
                            <li v-for="(photo, index) in product.images"
                                data-target="#carousel-indicators"
                                v-bind:data-slide-to="index"
                                v-bind:class="{ active: index == 0 }">
                            </li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="item"
                                 v-for="(photo, index) in product.images"
                                 v-bind:class="{ active: index == 0 }">
                                <img class="d-block img-fluid" v-bind:src="photo.url"
                                     style="height: 100%; width: 100%;"/>
                            </div>
                        </div>
                        <a class="left carousel-control" :href="'#carousel-' + product.id" role="button"
                           data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" :href="'#carousel-' + product.id" role="button"
                           data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var productGroups = ${productGroups};
</script>

<#include "vendor_scripts.ftl">
<#include "components.ftl">
<#include "app_scripts.ftl">
<#include "google_analytics.ftl">

</body>
</html>