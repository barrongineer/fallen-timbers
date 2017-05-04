<script type="text/x-template" id="event-template">
    <div class="row" style="margin-bottom: 20px;">
        <div class="col-xs-12 col-md-6">
            <a :href="url" target="_blank">
                <img :src="image" class="img-responsive img-thumbnail">
            </a>
        </div>

        <div class="col-xs-12 col-md-6 visible-md visible-lg">
            <h3 v-for="date in dates">{{date}}</h3>
            <h3>{{venue}}</h3>
            <h3>{{location}}</h3>
        </div>

        <div class="col-xs-12 col-md-6 visible-xs visible-sm">
            <h3 v-for="date in dates">{{date}}</h3>
            <h3>{{venue}}</h3>
            <h3>{{location}}</h3>
        </div>
    </div>
</script>