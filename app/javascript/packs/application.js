// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require("stylesheets/application.scss")

// THIS IS MAKING jQuery AVAILABLE EVEN INSIDE Views FOLDER
global.$ = require("jquery")

require("jquery") // Don't really need to require this...
require("jquery-ui")

document.addEventListener("turbolinks:load", function() {
  $(function(){

      $('#dog_owner_name').autocomplete( { source: $('#dog_owner_name').data('autocomplete-source') } );
      $('#groupclass_dog_name').autocomplete( { source: $('#groupclass_dog_name').data('autocomplete-source') } );
      $('#ptclass_dog_name').autocomplete( { source: $('#ptclass_dog_name').data('autocomplete-source') } );

  })
})



Rails.start()
Turbolinks.start()
ActiveStorage.start()
