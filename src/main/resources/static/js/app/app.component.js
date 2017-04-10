var moveTo = new MoveTo();

new Vue({
    el: "#app",

    data: {
        productGroups: [],
        activeProduct: {}
    },

    created: function () {
        this.productGroups = productGroups;

        productGroups.forEach(pg => {
            var rows = [];
            var row = [];
            for (var i = 0; i < pg.products.length; i++) {
                row.push(pg.products[i]);

                if ((i != 0 && ((i + 1) % 3 == 0)) || i == pg.products.length - 1) {
                    rows.push(row);
                    row = []
                }
            }

            pg.rows = rows;
        });

        this.productGroups.push({title: "events"}, {title: "contact"});
    },

    methods: {
        moveTo: function (id) {
            moveTo.move(document.getElementById(id));
            $("#navbar").collapse("hide");
        },

        showProductModal: function (product) {
            this.activeProduct = product;
            $("#product-modal").modal("toggle");
        }
    }
});