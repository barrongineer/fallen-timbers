<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <title>Fallen Timbers Design | Home Decor</title>

<#include "vendor_styles.ftl">
</head>
<body>

<#include "app_styles.ftl">

<div id="app">

<#include "nav.ftl">
<#include "landing.ftl">

<#list productGroups as pg>
    <div class="container-fluid" id="${pg.title}"
         style="padding-top: 64px; text-align: center; min-height: 100vh; padding: 35px;">
        <#if pg.title == "events">
            <div style="margin-top: 40px;" class="container">
                <#include "events.ftl">
            </div>
        <#elseif pg.title == "custom order">
            <div class="container">
                <#include "custom_order.ftl">
            </div>
        <#elseif pg.title == "contact">
            <#include "contact.ftl">
        <#elseif pg.title == "about">
            <div class="container">
                <#include "about.ftl">
            </div>
        <#else>
            <#include "product_group.ftl">
        </#if>
    </div>
</#list>


<#include "product-modals.ftl">
</div>

<#include "vendor_scripts.ftl">
<#include "app_scripts.ftl">
<#include "google_analytics.ftl">

</body>
</html>