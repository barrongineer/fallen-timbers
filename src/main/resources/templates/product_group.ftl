<h3>${pg.title}</h3>

<#if pg.products?size gt 0>
<div class="container-fluid">
    <#list pg.rows as row>
        <div class="row">
            <#list row as product>
                <div class="col-xs-12 col-sm-12 col-md-4 thumbnail-container"
                     style="padding: 0px; cursor: pointer;"
                     onclick="showProductModal(${product})">
                    <img class="img-responsive" src="${product.thumbnail}" style="margin: auto; width: 100%;">
                    <div class="overlay"></div>

                    <#if product.images?size gt 1>
                        <ol class="carousel-indicators">
                            <#list product.images as photo>
                                <li></li>
                            </#list>
                        </ol>
                    </#if>
                </div>
            </#list>
        </div>
    </#list>
</div>
</#if>