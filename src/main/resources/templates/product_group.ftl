<h3>{{pg.title}}</h3>

<div class="container-fluid" v-if="pg.products">
    <div class="row" v-for="row in pg.rows">
        <div class="col-xs-12 col-sm-12 col-md-4 thumbnail-container"
             style="padding: 0px; cursor: pointer;"
             v-for="product in row"
             v-on:click.prevent="showProductModal(product)">
            <img class="img-responsive" v-bind:src="product.thumbnail" style="margin: auto; width: 100%;">
            <div class="overlay"></div>

            <ol class="carousel-indicators" v-if="product.images.length > 1">
                <li v-for="(photo, index) in product.images">
                </li>
            </ol>
        </div>
    </div>
</div>