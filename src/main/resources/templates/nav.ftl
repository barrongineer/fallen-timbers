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
            <a id="home-link" class="navbar-brand" href="javascript:void(0)">
                <i class="fa fa-tree" aria-hidden="true"></i> fallen timbers
            </a>
        </div>

        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
            <#list productGroups as pg>
                <#if pg.href??>
                    <li>
                        <a id="${pg.title?replace(" ", "")}-navlink" href="${pg.href}">${pg.title}</a>
                    </li>
                <#else>
                    <li>
                        <a id="${pg.title?replace(" ", "")}-navlink" href="javascript:void(0)">${pg.title}</a>
                    </li>
                </#if>
            </#list>
            </ul>
        </div>
    </div>
</nav>