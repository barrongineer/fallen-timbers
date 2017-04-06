var moveTo = new MoveTo();

new Vue({
    el: "#app",

    data: {
        productGroups: [],
        activeProduct: {}
    },

    created: function () {
        this.productGroups = productGroups;
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