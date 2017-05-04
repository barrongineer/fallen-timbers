var EventComponent = Vue.component("event", {
    template: "#event-template",
    props: ["url", "image", "dates", "venue", "location"]
});