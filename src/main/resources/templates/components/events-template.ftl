<script type="text/x-template" id="events-template">
    <div>
        <h3>
            <i class="fa fa-calendar" aria-hidden="true" style="margin-right: 20px;"></i>{{title}}
        </h3>

        <div v-for="event in events">
            <event :url="event.url"
                   :image="event.image"
                   :dates="event.dates"
                   :venue="event.venue"
                   :location="event.location">
            </event>
        </div>
    </div>
</script>