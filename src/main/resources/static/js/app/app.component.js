const moveTo = new MoveTo();
const required = window.validators.required;
const email = window.validators.email;

toastr.options = {
    positionClass: "toast-bottom-right"
};

new Vue({
    el: "#app",

    data: {
        productGroups: [],
        activeProduct: {},
        mailCmd: {
            name: null,
            from: null,
            subject: null,
            text: null
        },
        sendingMail: false,
        modalReady: false
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
        this.activeProduct = productGroups[0].products[0];
        this.modalReady = true;

        productGroups.forEach(pg => {
            let rows = [];
            let row = [];

            for (let i = 0; i < pg.products.length; i++) {
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

    mounted: function () {
        let c = $("#carousel");

        c.hammer().on('swipeleft', function () {
            $(this).carousel('next');
        });
        c.hammer().on('swiperight', function () {
            $(this).carousel('prev');
        });
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
            let self = this;

            if (!self.sendingMail) {
                self.sendingMail = true;
                toastr.info("Sending...", null, {timeOut: 0});

                axios.post("/mail", this.mailCmd)
                    .then(function () {
                        self.sendingMail = false;

                        Vue.set(self.mailCmd, "name", null);
                        Vue.set(self.mailCmd, "from", null);
                        Vue.set(self.mailCmd, "subject", null);
                        Vue.set(self.mailCmd, "text", null);

                        self.$v.mailCmd.$reset();

                        toastr.clear();
                        toastr.success("Sent!")
                    })
                    .catch(function () {
                        self.sendingMail = false;

                        toastr.clear();
                        toastr.error("There was an error sending the email.")
                    });
            }
        }
    }
});