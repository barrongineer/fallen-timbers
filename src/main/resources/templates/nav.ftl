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
            <#list productGroups as pg>
                <li>
                    <a onclick="moveTo(${pg.title})" href="javascript:void(0)">${pg.title}</a>
                </li>
            </#list>
            </ul>
        </div>
    </div>
</nav>