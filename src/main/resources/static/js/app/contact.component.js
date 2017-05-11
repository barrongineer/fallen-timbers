var required = window.validators.required;
var email = window.validators.email;

toastr.options = {
    positionClass: "toast-bottom-right"
};

Vue.use(window.vuelidate.default);

new Vue({
    el: "#contact-component",

    data: {
        mailCmd: {
            name: null,
            from: null,
            subject: null,
            text: null
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

    methods: {
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