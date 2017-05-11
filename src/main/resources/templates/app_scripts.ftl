<script src="/js/app/contact.component.js"></script>

<script type="text/javascript">

    let mt = new MoveTo();

    bindNavLinks();
    initHammer();

    function bindNavLinks() {
        let productGroups = ${productGroupsJson};

        $("#home-link").click(function () {
            moveTo("landing");
        });

        productGroups.forEach(function (pg) {
            let id = "#" + pg.title.replace(" ", "") + "-navlink";

            $(id).click(function () {
                moveTo(pg.title)
            });
        });
    }

    function moveTo(id) {
        mt.move(document.getElementById(id));
        $("#navbar").collapse("hide");
    }

    function initHammer() {
        let c = $(".carousel");

        c.hammer().on('swipeleft', function () {
            $(this).carousel('next');
        });
        c.hammer().on('swiperight', function () {
            $(this).carousel('prev');
        });
    }
</script>