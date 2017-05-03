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
        <#include "events.ftl">
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

<#include "product_modal.ftl">
</div>

<script type="text/javascript">
    var productGroups = ${productGroups};
</script>

<#include "vendor_scripts.ftl">
<#include "app_scripts.ftl">
<#include "google_analytics.ftl">

</body>
</html>