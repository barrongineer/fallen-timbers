var EventsComponent = Vue.component("events", {
    template: "#events-template",

    components: {
        event: EventComponent
    },

    props: ['title'],

    data: function () {
        return {
            events: [
                {
                    url: "http://www.madelocalmarketplaceshows.com/",
                    image: "/img/made_local.jpg",
                    dates: ["May 13, 2017", "12pm - 6pm"],
                    venue: "Made Local Marketplace",
                    location: "Kenwood Towne Center - Cincinnati, OH"
                },
                {
                    url: "http://www.charmatthefarm.com/",
                    image: "/img/charm_at_the_farm.jpg",
                    dates: ["August 26, 2017 10am - 6pm", "August 27, 2017 8am - 4pm"],
                    venue: "Charm at the Farm - Summer Market",
                    location: "Lebanon, OH"
                },
                {
                    url: "http://web.worthingtonchamber.org/events/eventdetail.aspx?EventID=2089",
                    image: "/img/market_day.jpg",
                    dates: ["September 23, 2017", "9am - 4pm"],
                    venue: "Market Day",
                    location: "Worthington, OH"
                }
            ]
        }
    }
});