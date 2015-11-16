//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require slick.js/slick.js
//= require lightbox
//= require bootstrap-slider
//= require underscore
//= require gmaps/google
//= require bootstrap-datepicker
//= require jquery_nested_form
//= require_tree .

// app/assets/javascripts/application.js

function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  if (element) {
    var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
  }
}

function onPlaceChanged() {
  var place = this.getPlace();
  console.log(place);
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {  // Some types are ["country", "political"]
      var type_element = document.getElementById(component.types[j]);
      if (type_element) {
        type_element.value = component.long_name;
      }
    }
  }
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('spot_address');
});
