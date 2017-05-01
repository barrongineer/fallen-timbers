var moveTo = new MoveTo();
var required = window.validators.required;
var email = window.validators.email;

new Vue({
    el: "#app",

    data: {
        productGroups: [],
        activeProduct: {},
        mailCmd: {
            name: "",
            from: "",
            subject: "",
            text: ""
        },
        sendingMail: false
    },

    validations: {
        mailCmd: {
            name: {required},
            from: {required, email},
            subject: {required},
            text: {required}
        }
    },

    created: function () {
        productGroups.forEach(pg => {
            var rows = [];
            var row = [];
            for (var i = 0; i < pg.products.length; i++) {
                row.push(pg.products[i]);

                if ((i !== 0 && ((i + 1) % 3 === 0)) || i === pg.products.length - 1) {
                    rows.push(row);
                    row = []
                }
            }

            pg.rows = rows;

            this.productGroups.push(pg);
        });

        this.productGroups.push({title: "events"}, {title: "about"}, {title: "contact"});
    },

    methods: {
        moveTo: function (id) {
            moveTo.move(document.getElementById(id));
            $("#navbar").collapse("hide");
        },

        showProductModal: function (product) {
            this.activeProduct = product;
            $("#product-modal").modal("toggle");
        },

        sendMail: function () {
            var self = this;

            if (!self.sendingMail) {
                self.sendingMail = true;

                axios.post("/mail", this.mailCmd)
                    .then(function () {
                        self.sendingMail = false;
                        toastr.success("Sent!")
                    })
                    .catch(function () {
                        self.sendingMail = false;
                        toastr.error("There was an error sending the email.")
                    });
            }
        }
    }
});