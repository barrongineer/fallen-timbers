<#list productGroups as pg>
    <#list pg.products as product>
        <#if pg.title != "contact" || pg.title != "about" || pg.title != "events">
            <#assign modalId = "product-modal-${product.id}">
        <div id="${modalId}" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-body">
                        <#assign carouselId = "carousel-${product.id}">
                        <div id="${carouselId}" class="carousel slide" data-ride="carousel" data-interval="">
                            <ol class="carousel-indicators">
                                <#list product.images as photo>
                                    <#if photo?is_first>
                                        <li data-target="#carousel-indicators" data-slide-to="${photo?index}"
                                            class="active"></li>
                                    <#else>
                                        <li data-target="#carousel-indicators" data-slide-to="${photo?index}">
                                        </li>
                                    </#if>
                                </#list>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <#list product.images as photo>
                                    <#if photo?is_first>
                                        <div class="item active">
                                            <img class="d-block img-fluid" src="${photo.url}"
                                                 style="height: 100%; width: 100%;"/>
                                        </div>
                                    <#else>
                                        <div class="item">
                                            <img class="d-block img-fluid" src="${photo.url}"
                                                 style="height: 100%; width: 100%;"/>
                                        </div>
                                    </#if>
                                </#list>
                            </div>
                            <#assign href = "#carousel-${product.id}">

                            <a class="left carousel-control" href="${href}" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>

                            <a class="right carousel-control" href="${href}" role="button"
                               data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>

                    <#if product.description != "">
                        <div class="description-footer modal-footer">
                            <span>${product.description}</span>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
        </#if>
    </#list>
</#list>