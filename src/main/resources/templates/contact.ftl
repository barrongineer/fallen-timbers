<h3>
    <i class="fa fa-envelope" aria-hidden="true" style="margin-right: 20px;"></i>${pg.title}
</h3>

<div class="row" style="margin-top: 50px;">
    <div class="col-sm-12 col-md-6 col-md-offset-3">
        <form style="text-align: left;">
            <div class="form-group" v-bind:class="{ 'has-error': $v.mailCmd.name.$error }">
                <label class="control-label" for="name">Name</label>
                <input type="text"
                       class="form-control"
                       id="name" placeholder="Name"
                       v-model="mailCmd.name"
                       v-on:input="$v.mailCmd.name.$touch">
            </div>

            <div class="form-group" v-bind:class="{ 'has-error': $v.mailCmd.from.$error }">
                <label class="control-label" for="email">Email Address</label>
                <input type="email"
                       class="form-control"
                       id="email"
                       placeholder="Email"
                       v-model="mailCmd.from"
                       v-on:input="$v.mailCmd.from.$touch">
            </div>

            <div class="form-group" v-bind:class="{ 'has-error': $v.mailCmd.subject.$error }">
                <label class="control-label" for="subject">Subject</label>
                <input type="text"
                       class="form-control"
                       id="subject"
                       placeholder="Subject"
                       v-model="mailCmd.subject"
                       v-on:input="$v.mailCmd.subject.$touch">
            </div>

            <div class="form-group" v-bind:class="{ 'has-error': $v.mailCmd.text.$error }">
                <label class="control-label" for="message">Message</label>
                <textarea class="form-control"
                          id="message"
                          placeholder="Message..."
                          rows="5"
                          v-model="mailCmd.text"
                          v-on:input="$v.mailCmd.text.$touch"></textarea>
            </div>
        </form>

        <button type="button"
                class="btn btn-default pull-left"
                v-bind:class="{ 'disabled': $v.mailCmd.$error || !$v.mailCmd.$dirty }"
                v-bind:disabled="$v.mailCmd.$error || !$v.mailCmd.$dirty"
                v-on:click="sendMail()">Send
        </button>
    </div>
</div>

<div class="row" style="margin-top: 90px;">
    <a href="https://www.instagram.com/fallentimbersdesign/" target="_blank">
        <i class="fa fa-instagram" aria-hidden="true" style="font-size: 1.5em; color: #000000;"></i>
        <span style="font-size: 1.25em;">fallentimbersdesign</span>
    </a>
</div>