<h3>
    <i class="fa fa-calendar" aria-hidden="true" style="margin-right: 20px;"></i>${pg.title}
</h3>

<#list events as event>
<div class="row" style="margin-bottom: 20px;">
    <div class="col-xs-12 col-md-6">
        <a href="${event.url}" target="_blank">
            <img src="${event.image}" class="img-responsive img-thumbnail">
        </a>
    </div>

    <div class="col-xs-12 col-md-6 visible-md visible-lg">
        <#list event.dates as date>
            <h3>${date}</h3>
        </#list>
        <h3>${event.venue}</h3>
        <h3>${event.location}</h3>
    </div>

    <div class="col-xs-12 col-md-6 visible-xs visible-sm">
        <#list event.dates as date>
            <h4>${date}</h4>
        </#list>
        <h4>${event.venue}</h4>
        <h4>${event.location}</h4>
    </div>
</div>
</#list>